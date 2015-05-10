#! /usr/bin/python2.7

import os
import sys
import ast
import z3
import copy

from cPickle import Unpickler
from ast2verilog import VerilogContext
import ast2verilog

def readAST(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        opcode = pk.load()
        asts = {}
        while True:
            try:
                name = pk.load()
                ast = pk.load()
                asts[(name, opcode)] = ast
            except EOFError:
                break
        return asts

def readAllASTs(d):
    astfiles = [os.path.join(d, f) for f in os.listdir(d) if f.endswith('.ast')]

    asts = []
    for i in xrange(0x10): asts.append({})

    for f in astfiles:
        ast = readAST(f)
        for (name, opcode), tree in ast.iteritems():
            assert opcode < 0x100 and opcode >= 0
            asts[opcode][name] = tree

    return asts

def rewriteComplexMemReads(n):
    def f(n):
        if n.nodetype == ast.Node.READMEM:
            if n.mem.nodetype != ast.Node.MEMVAR:
                mem = ast2verilog.getBaseMemory(n.mem)
                return ast.ReadMem(mem, n.addr)
            else:
                return n
        else:
            return n
    return n.apply(f)

def nondetChooseMemWrite(choice_vars, memwrites, sz=16):
    if len(memwrites) == 0:
        return ast.BoolVal(0), ast.BitVecVal(0, sz)
    else:
        def createIf(i):
            (cond_i, mem_i, addr_i) = memwrites[i]
            if i == len(memwrites) - 1:
                return cond_i, addr_i
            else:
                cond_rest, addr_rest = createIf(i+1)
                cond = ast.If(choice_vars[i], cond_i, cond_rest) 
                addr = ast.If(choice_vars[i], addr_i, addr_rest)
                return cond, addr
        return createIf(0)

def main(argv):
    if len(argv) != 3:
        print 'Syntax error.'
        print 'Usage: %s <ast-dir> <output.v>'
        return 1

    asts = readAllASTs(argv[1])
    assert len(asts) == 0x10

    vctx = VerilogContext() 
    cnst = ast.Concat(
                ast.Extract(1, 0, ast.BitVecVar('sha_state', 8)), 
                ast.Extract(1, 0, ast.BitVecVar('aes_state', 8)))

    vctx.setCnst(cnst)

    vctx.cinputs.append(('op', (3,0)))
    vctx.cinputs.append(('addrin', (15,0)))
    vctx.cinputs.append(('datain', (7,0)))
    vctx.objects[ast.BitVecVar('op', 4)] = 'op'
    vctx.objects[ast.BitVecVar('addrin', 16)] = 'addrin'
    vctx.objects[ast.BitVecVar('datain', 8)] = 'datain'

    vctx.addInput(ast.BoolVar('WR_XRAM_EN'), None)
    vctx.addInput(ast.BitVecVar('WR_XRAM_ADDR', 16), (15,0))

    subs = ast2verilog.AddrSubs()
    asts_p = []
    nondet_inputs = []
    for opcode, astdict in enumerate(asts):
        astdict_p = []
        acc_v = None
        for st, v in astdict.iteritems():
            v_p1 = ast2verilog.stripMacros(v)
            v_p2 = rewriteComplexMemReads(v_p1)
            v_p3 = ast2verilog.replaceFunctions(v_p2, nondet_inputs)
            v_p4 = ast2verilog.rewriteMemReads(opcode, v_p3, subs)
            astdict_p.append((st, v_p4))

        asts_p.append(astdict_p)

    for var, name, width in nondet_inputs:
        vctx.cinputs.append((name, width))
        vctx.objects[var] = name

    ports = subs.getReadPorts()
    for m, s in ports:
        vctx.addComment("port: " + m.name + "->" + str(s))
        vctx.createWire(s)
        vctx.cinputs.append((s, vctx.getWidth(s)))
        vctx.objects[s] = s.name;

    for m, s in ports:
        addr_expr = subs.getExpr(cnst, m, s)
        addr_name = s.name + "_ADDR"
        vctx.addComment(addr_name + "=" + str(addr_expr))
        vctx.addAssignment(addr_expr, vctx.getExpr(addr_expr), addr_name)
        vctx.outputs.append((addr_name, vctx.getWidth(addr_expr)))

    max_writes = 120
    choice_vars = []
    for i in xrange(120):
        name = 'nondet_memwrite_choice_%d' % i
        var = ast.BoolVar(name)
        vctx.cinputs.append((name, None))
        vctx.objects[var] = name
        choice_vars.append(var)

    for opcode, astdict in enumerate(asts_p):
        assert len(astdict) == 18

        memwrites = []
        for st, v in astdict:
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue

            # some comments to show what is going on.
            vctx.addComment('')
            vctx.addComment('%s_%02x' % (st, opcode))
            vctx.addComment('')

            if not v.isMem(): 
                name = '%s_%02x' % (st, opcode)
                vctx.addAssignment(v, vctx.getExpr(v), name)
                vctx.addStateChange(st, opcode, name)
            else:
                vctx.getMemWriteAddrs(ast.BoolVal(1), st, v, memwrites)
                # mw = vctx.getMemWrite(st, v)
                # if mw != None: vctx.addMemWrite(st, opcode, mw)

        cond, addr = nondetChooseMemWrite(choice_vars, memwrites)
        vctx.addAssignment(cond, vctx.getExpr(cond), 'WR_XRAM_EN_%02x' % opcode)
        vctx.addStateChange('WR_XRAM_EN', opcode, 'WR_XRAM_EN_%02x' % opcode)
        vctx.addAssignment(addr, vctx.getExpr(addr), 'WR_XRAM_ADDR_%02x' % opcode)
        vctx.addStateChange('WR_XRAM_ADDR', opcode, 'WR_XRAM_ADDR_%02x' % opcode)

    vctx.inputs.append(('dataout', (7,0)))
    vctx.addOutputs()
    # vctx.addMems()

    with open(argv[2], 'wt') as f:
        vctx.dump(f, 'xm8051_golden_model')

if __name__ == '__main__':
    main(sys.argv)
