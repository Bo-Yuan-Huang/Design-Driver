#! /usr/bin/python2.7

import os
import sys
import ast
import z3
import copy

from cPickle import Unpickler
from ast2verilog import VerilogContext
import ast2verilog

def readCnst(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        cnst = pk.load()
        return cnst

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
    for i in xrange(0x100): asts.append({})

    for f in astfiles:
        ast = readAST(f)
        for (name, opcode), tree in ast.iteritems():
            assert opcode < 0x100 and opcode >= 0
            asts[opcode][name] = tree

    return asts

def addPort(R, mem, addr, opcode):
    k = (mem, addr)
    if k not in R:
        R[k] = []

    if opcode == -1:
        R[k] = [-1]
    else:
        if R[k] != [-1]:
            R[k].append(opcode)

def rewritePortsAsInputs(st, v):
    port_names = ['P0', 'P1', 'P2', 'P3']
    def f(n):
        if n.nodetype == ast.Node.BITVECVAR and n.name in port_names:
            assert n.width == 8
            n_p = ast.BitVecVar(n.name + 'INREG', n.width)
            return n_p
        else:
            return n

    if st not in port_names:
        return v.apply(f)
    else:
        return v
                
def main(argv):
    if len(argv) != 4:
        print 'Syntax error.'
        print 'Usage: %s <ast-dir> <cnst> <output.v>'
        return 1

    asts = readAllASTs(argv[1])
    assert len(asts) == 0x100
    opcodes_to_exclude = [0xF0, 0xF2, 0xF3, 0xE0, 0xE2, 0xE3]

    vctx = VerilogContext() 
    cnst = readCnst(argv[2])

    subs = ast2verilog.AddrSubs()
    cnst_p = ast2verilog.rewriteMemReads(-1, cnst, subs)
    vctx.setCnst(cnst_p)

    for i in xrange(4):
        pi = 'P%dIN' % i
        pireg = 'P%dINREG' % i
        vctx.cinputs.append((pi, (7,0)))
        vctx.always_stmts.append('%s <= %s;' % (pireg, pi))

    asts_p = []
    for opcode, astdict in enumerate(asts):
        if opcode in opcodes_to_exclude: continue
        astdict_p = []
        acc_v = None
        for st, v in astdict.iteritems():
            v_p1 = ast2verilog.stripMacros(v)
            v_p2 = ast2verilog.rewriteMemReads(opcode, v_p1, subs)
            v_p = rewritePortsAsInputs(st, v_p2)
            astdict_p.append((st, v_p))
            if st == 'ACC':
                acc_v = v_p

        assert acc_v != None
        acc_p = ast.BVXor(ast.Extract(7, 7, acc_v),
                ast.BVXor(ast.Extract(6, 6, acc_v),
                ast.BVXor(ast.Extract(5, 5, acc_v),
                ast.BVXor(ast.Extract(4, 4, acc_v),
                ast.BVXor(ast.Extract(3, 3, acc_v),
                ast.BVXor(ast.Extract(2, 2, acc_v),
                ast.BVXor(ast.Extract(1, 1, acc_v), 
                ast.Extract(0, 0, acc_v))))))))
        for i in xrange(len(astdict_p)):
            st = astdict_p[i][0]
            v = astdict_p[i][1]
            if st == 'PSW':
                v_p = ast.Concat(ast.Extract(7, 1, v), acc_p)
                astdict_p[i] = (st, v_p)

        asts_p.append(astdict_p)

    ports = subs.getReadPorts()
    for m, s in ports:
        vctx.addComment("port: " + m.name + "->" + str(s))
        vctx.createWire(s)
        if m.name == 'ROM':
            vctx.cinputs.append((s, vctx.getWidth(s)))
            vctx.objects[s] = s.name;

    for m, s in ports:
        addr_expr = subs.getExpr(cnst_p, m, s)
        addr_name = s.name + "_ADDR"
        vctx.addComment(addr_name + "=" + str(addr_expr))
        vctx.addAssignment(addr_expr, vctx.getExpr(addr_expr), addr_name)
        if(m.name != 'ROM'):
            rd_expr = ast2verilog.resizeMem(ast.ReadMem(m, addr_expr), 'IRAM', 4)
            vctx.addAssignment(rd_expr, vctx.getExpr(rd_expr), s.name)
        else:
            vctx.outputs.append((addr_name, vctx.getWidth(addr_expr)))

    for opcode, astdict in enumerate(asts_p):
        if opcode in opcodes_to_exclude: continue
        assert len(astdict) == 24

        for st, v in astdict:
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue

            # some comments to show what is going on.
            vctx.addComment('')
            vctx.addComment('%s_%02x' % (st, opcode))
            vctx.addComment('')

            if v.isMem(): 
                mw = vctx.getMemWrite(st, ast2verilog.resizeMem(v, 'IRAM', 4))
                if mw != None: vctx.addMemWrite(st, opcode, mw)
            else:
                name = '%s_%02x' % (st, opcode)
                vctx.addAssignment(v, vctx.getExpr(v), name)
                vctx.addStateChange(st, opcode, name)
        

    vctx.addOutputs()
    vctx.addMems()
    vctx.cinputs.append(('RD_IRAM_ADDR', (3,0)))
    vctx.outputs.append(('RD_IRAM_DATA', (7,0)))
    vctx.statements.append('assign RD_IRAM_DATA = IRAM[RD_IRAM_ADDR];')
    vctx.setRst('P0', 'ff')
    vctx.setRst('P1', 'ff')
    vctx.setRst('P2', 'ff')
    vctx.setRst('P3', 'ff')

    vctx.init_mem_guard = 'OC8051_SIMULATION'
    with open(argv[3], 'wt') as f:
        vctx.dump(f, 'oc8051_golden_model')


if __name__ == '__main__':
    main(sys.argv)
