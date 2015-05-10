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

def main(argv):
    if len(argv) != 3:
        print 'Syntax error.'
        print 'Usage: %s <ast-dir> <output.v>'
        return 1

    asts = readAllASTs(argv[1])
    assert len(asts) == 0x10

    vctx = VerilogContext() 
    cnst = ast.Concat(
                ast.Extract(1, 0, ast.BitVecVar('sha_state')), 
                ast.Extract(1, 0, ast.BitVecVar('aes_state')))

    vctx.setCnst(cnst)

    vctx.cinputs.append(('op', (3,0)))
    vctx.cinputs.append(('addrin', (15,0))
    vctx.cinputs.append(('datain', (7,0))

    asts_p = []
    for opcode, astdict in enumerate(asts):
        astdict_p = []
        acc_v = None
        for st, v in astdict.iteritems():
            v_p1 = ast2verilog.stripMacros(v)
            v_p2 = ast2verilog.rewriteMemReads(opcode, v_p1, subs)
            v_p3 = forceRegsToZero(st, v_p2)
            v_p = rewritePortsAsInputs(opcode, st, v_p3)
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
    vctx.outputs.append(('IRAM_full', (127,0)))
    vctx.statements.append('assign IRAM_full = {IRAM[15], IRAM[14], IRAM[13], IRAM[12], IRAM[11], IRAM[10], IRAM[9], IRAM[8], IRAM[7], IRAM[6], IRAM[5], IRAM[4], IRAM[3], IRAM[2], IRAM[1], IRAM[0]} ;')
    vctx.setRst('P0', 'ff')
    vctx.setRst('P1', 'ff')
    vctx.setRst('P2', 'ff')
    vctx.setRst('P3', 'ff')
    vctx.setRst('TCON', '0')
    vctx.setRst('SP', '7')
    addZeroRegs(vctx)

    vctx.init_mem_guard = 'OC8051_SIMULATION'
    with open(argv[2], 'wt') as f:
        vctx.dump(f, 'oc8051_golden_model')


if __name__ == '__main__':
    main(sys.argv)
