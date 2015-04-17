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

    # first compute the read ports accessed.
    asts_p = []
    for opcode, astdict in enumerate(asts):
        astdict_p = []
        for st, v in astdict.iteritems():
            v_p = ast2verilog.stripMacros(v)
            astdict_p.append((st, v_p))
        asts_p.append(astdict_p)

    # first compute the read ports accessed.
    cnstReadPorts = {}
    ast2verilog.collectReadPorts(cnst, cnstReadPorts)

    allReadPorts = {}
    mem_ports = {}
    all_opcodes = set()
    for opcode, astdict in enumerate(asts_p):
        if opcode in opcodes_to_exclude: continue
        assert len(astdict) == 24

        all_opcodes.add(opcode)

        readPorts = copy.deepcopy(cnstReadPorts)
        ast2verilog.collectReadPorts(cnst, readPorts)

        #print '\nopcode: %02x' % opcode
        for st, v in astdict:
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue
            # collect read ports.
            ast2verilog.collectReadPorts(v, readPorts)
        allReadPorts[opcode] = readPorts

        for mem, ports in readPorts.iteritems():
            if mem not in mem_ports:
                mem_ports[mem] = {}
            for i, p in enumerate(ports):
                if i not in mem_ports[mem]:
                    mem_ports[mem][i] = {}
                if p not in mem_ports[mem][i]:
                    mem_ports[mem][i][p] = set([opcode])
                else:
                    mem_ports[mem][i][p].add(opcode)

    subs = {}
    for mem, ports in mem_ports.iteritems():
        for index, exprs in ports.iteritems():
            expr, p_subs = ast2verilog.createSelect(mem, exprs, cnst, all_opcodes)
            orig = [ast.ReadMem(mem, e) for e in exprs.keys()]
            name = '_%s_RD%d_' % (mem.name, index)
            vctx.addComment('MEMRD: %s = %s' % (name, str(expr)))
            vctx.addAssignment(expr, vctx.getExpr(expr), name)
            for p, v in p_subs:
                if p not in subs: subs[p] = []
                subs[p].append((v, ast.BitVecVar(name, mem.dwidth)))

    newsubs = {}
    for opcode, opsubs in subs.iteritems():
        itcnt = 0
        while True:
            itcnt += 1
            new_opsubs = []
            for i in xrange(len(opsubs)):
                opsubs_p = opsubs[:i] + opsubs[i+1:]
                v, vp = opsubs[i]
                for n, np in opsubs_p:
                    v = v.substitute(n, np)
                    vp = vp.substitute(n, np)
                new_opsubs.append((v, vp))
            print itcnt
            if new_opsubs == opsubs:
                break
            else:
                opsubs = new_opsubs
            if itcnt >= 200:
                assert False

        newsubs[opcode] = new_opsubs
    subs = newsubs

    for opcode, astdict in enumerate(asts_p):
        if opcode in opcodes_to_exclude: continue
        assert len(astdict) == 24

        for st, v in astdict:
            name = '%s_%02x' % (st, opcode)
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue

            if opcode in subs:
                #i = 1
                while True:
                    changed = False
                    #print name, 'iteration: ', i
                    #i += 1
                    for n, np in subs[opcode]:
                        vp = v.substitute(n, np)
                        if vp != v:
                            v = vp
                            changed = True

                    #if i >= 300:
                    #    print v, vp
                    #    assert False
                    if not changed:
                        break

            vctx.addComment('')
            vctx.addComment(name)
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
