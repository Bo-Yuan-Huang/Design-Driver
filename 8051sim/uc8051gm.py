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

def main(argv):
    if len(argv) != 4:
        print 'Syntax error.'
        print 'Usage: %s <ast-dir> <cnst> <output.v>'
        return 1

    asts = readAllASTs(argv[1])
    assert len(asts) == 0x100


    vctx = VerilogContext() 

    cnst = readCnst(argv[2])
    vctx.setCnst(cnst)


    opcodes_to_exclude = [0xF0, 0xF2, 0xF3, 0xE0, 0xE2, 0xE3]

    subs = ast2verilog.AddrSubs()
    cnst_p = ast2verilog.rewriteMemReads(cnst, subs)
    print cnst_p
    subs.dump()
    return

    asts_p = []
    for opcode, astdict in enumerate(asts):
        astdict_p = []
        for st, v in astdict.iteritems():
            v_p = ast2verilog.stripMacros(v)
            astdict_p.append((st, v_p))
        asts_p.append(astdict_p)

    for opcode, astdict in enumerate(asts_p):
        if opcode in opcodes_to_exclude: continue
        assert len(astdict) == 24

        for st, v in astdict:
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue

            vctx.addComment('')
            vctx.addComment('%s_%02x' % (st, opcode))
            vctx.addComment('')

            if v.isMem(): 
                mw = vctx.getMemWrite(st, v)
                if mw != None: vctx.addMemWrite(st, opcode, mw)
            else:
                vctx.addAssignment(v, vctx.getExpr(v), name)
                vctx.addStateChange(st, opcode, name)
        

    vctx.addOutputs()
    vctx.addMems()

    with open(argv[3], 'wt') as f:
        vctx.dump(f, 'oc8051_golden_model')


if __name__ == '__main__':
    main(sys.argv)
