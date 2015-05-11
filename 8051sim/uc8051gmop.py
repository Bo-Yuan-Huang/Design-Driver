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

rmw_opcodes = set([
    0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 
    0xd, 0xe, 0xf, 0x15, 0x16, 0x17, 0x18, 
    0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 
    0x42, 0x43, 0x45, 0x46, 0x47, 0x48, 0x49, 
    0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x52, 
    0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 
    0x5a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f, 0x62, 
    0x63, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 
    0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x72, 0x82, 
    0xa0, 0xb0, 0xb2, 0xc2, 0xd2, 0xd5, 0xd8, 
    0xd9, 0xda, 0xdb, 0xdc, 0xdd, 0xde, 0xdf])

zero_regs = [
    'SBUF', 'SCON', 'PCON', 'TCON', 
    'TL0', 'TL1', 'TH0', 'TH1', 
    'TMOD', 'IE', 'IP'
]

def forceRegsToZero(st, v):
    if st in zero_regs:
        return ast.BitVecVar(st, 8)
    return v

def addZeroRegs(vctx):
    for r in zero_regs:
        vctx.outputs.append((r, (7,0)))
        vctx.wires.append((r+'_next', (7,0)))
        vctx.outputs.append((r+'_next', (7,0)))
        vctx.statements.append('assign %s_next = %s;' % (r, r))

def rewritePortsAsInputs(opcode, st, v):
    port_names = set(['P0', 'P1', 'P2', 'P3'])
    def f(n):
        if n.nodetype == ast.Node.BITVECVAR and n.name in port_names:
            assert n.width == 8
            n_p = ast.BitVecVar(n.name + 'INREG', n.width)
            return n_p
        else:
            return n

    if (opcode not in rmw_opcodes) and (st not in port_names):
        return v.apply(f)
    elif (opcode == 0x85):
        assert v.nodetype == ast.Node.IF
        return ast.If(v.cond, v.exptrue.apply(f), v.expfalse)
    else:
        return v
                
def main(argv):
    if len(argv) != 5:
        print 'Syntax error.'
        print 'Usage: %s <ast-dir> <cnst> <opcode> <output.v>'
        return 1

    asts = readAllASTs(argv[1])
    assert len(asts) == 0x100

    vctx = VerilogContext() 
    cnst = readCnst(argv[2])

    subs = ast2verilog.AddrSubs()
    cnst_p = ast2verilog.rewriteMemReads(-1, cnst, subs)
    vctx.setCnst(cnst_p)

    this_opcode = int(argv[3], 0)
    vctx.cinputs.append(('XRAM_DATA_IN', (7, 0)))
    vctx.objects[ast.BitVecVar('XRAM_DATA_IN', 8)] = 'XRAM_DATA_IN'
    vctx.addInput(ast.BitVecVar('XRAM_ADDR', 16), (15,0))
    vctx.addInput(ast.BitVecVar('XRAM_DATA_OUT', 8), (7,0))

    for i in xrange(4):
        pi = 'P%dIN' % i
        pireg = 'P%dINREG' % i
        vctx.cinputs.append((pi, (7,0)))
        vctx.always_stmts.append('%s <= %s;' % (pireg, pi))


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
        addr_expr = subs.getExpr(cnst_p, m, s, this_opcode, vctx)
        addr_name = s.name + "_ADDR"
        vctx.addComment(addr_name + "=" + str(addr_expr))
        vctx.addAssignment(addr_expr, vctx.getExpr(addr_expr), addr_name)
        if(m.name != 'ROM'):
            rd_expr = ast2verilog.resizeMem(ast.ReadMem(m, addr_expr), 'IRAM', 4)
            vctx.addAssignment(rd_expr, vctx.getExpr(rd_expr), s.name)
        else:
            vctx.outputs.append((addr_name, vctx.getWidth(addr_expr)))

    for opcode, astdict in enumerate(asts_p):
        assert len(astdict) == 25

        for st, v in astdict:
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st and v.isMem(): continue
            if st in zero_regs: continue

            # some comments to show what is going on.
            vctx.addComment('')
            vctx.addComment('%s_%02x' % (st, opcode))
            vctx.addComment('')

            if v.isMem(): 
                mw = vctx.getMemWrite(st, ast2verilog.resizeMem(v, 'IRAM', 4))
                if mw != None: vctx.addMemWrite(st, opcode, mw)
            else:
                if opcode != this_opcode: continue

                name = '%s_%02x' % (st, opcode)
                vctx.addAssignment(v, vctx.getExpr(v), name)
                vctx.addStateChange(st, opcode, name)


    vctx.addOutputsSingleOp(this_opcode)
    vctx.addMems(this_opcode)
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
    with open(argv[4], 'wt') as f:
        vctx.dump(f, 'oc8051_golden_model')


if __name__ == '__main__':
    main(sys.argv)
