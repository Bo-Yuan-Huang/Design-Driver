import itertools
from z3 import *
from sim51 import evalPC

# Notes on the PC
# 
# Instructions that affect the PC.
# 
# AJMP  : xxx0_0001  --> the top 3 bits contain the page number which is written
# ACALL : xxx1_0001      into bits [10:8] of the new PC. bits [15:11] come from 
#                        PC+2 (one cube?)
# JB, JBC, JNB       --> 4 cubes? check if a particular bit is set and jump to
# JC, JNC, JZ, JNZ   --> relative address.
# [1-7]0
# 
# SJMP               --> relative jump using the next byte.
#
# LJMP               --> long jump
# LCALL              
# 
# RET/RETI           --> pop bytes off the stack and jump.
# 
# JMP                --> DPTR + ACC
# 
# CJNE               --> compare and jump if not equal
#                        variants:
#                           A, immediate
#                           A, iram addr
#                           [R0], imm
#                           [R1], imm
#                           R, imm
#
# DJNZ               --> decrement and jump if not zero.
#                        variants:
#                        iram addr
#                        Rn
# PC Table
# opcode   0x00   0x01    0x02    0x03   0x04   0x05   0x06   0x07   0x08   0x09   0x0a   0x0b   0x0c   0x0d   0x0e   0x0f
# 0x00     ---    AJMP    LJMP    --     ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x10     JBC    ACALL   LCALL   ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x20     JB     AJMP    RET     --     ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x30     JNB    ACALL   RETI    ---    ----   ----   ----   ----   ----   ----   ----   ----   ----   ----   ----   ----
# 0x40     JC     AJMP    ---     ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x50     JNC    ACALL   ---     ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x60     JZ     AJMP    ---     ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x70     JNZ    ACALL   ---     JMP    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x80     SJMP   AJMP    ---     ----   ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0x90     ---    ACALL   ---     ----   ----   ----   ----   ----   ----   ----   ----   ----   ----   ----   ----   ----
# 0xa0     ---    AJMP    ---     ---    ---    ?      ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0xb0     ---    ACALL   ---     ---    CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE   CJNE
# 0xc0     ----   AJMP    ---     ---    ----   ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0xd0     ---    ACALL   ----    ----   --     DJNZ   ----   ----   DJNZ   DJNZ   DJNZ   DJNZ   DJNZ   DJNZ   DJNZ   DJNZ
# 0xe0     ----   AJMP    ----    ----   ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---
# 0xf0     ----   ACALL   ----    ----   ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---    ---


def BVRedAnd(a):
    return BitVecRef(Z3_mk_bvredand(a.ctx_ref(), a.as_ast()), a.ctx)

def BVXnor(a, b):
    return BitVecRef(Z3_mk_bvxnor(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)

def CreateTCAM(bits, prefix, num_rules):
    assert num_rules >= 1
    tcam_bits = []
    matches = []
    for i in xrange(num_rules):
        match_bits_i = BitVec(prefix + '_match_bits_' + str(i), bits.size())
        dc_bits_i = BitVec(prefix + '_dc_bits' + str(i), bits.size())
        match_i = (BVRedAnd(BVXnor(match_bits_i, bits) | dc_bits_i) == BitVecVal(1,1))
        tcam_bits.append((match_bits_i, dc_bits_i))
        matches.append(match_i)

    if len(matches) == 1:
        return matches[0],tcam_bits
    else:
        return Or(*matches), tcam_bits

def getBit(m, bv, i):
    val = m[bv].as_long() if m[bv] is not None else ((1 << bv.size()) - 1)
    if (val & (1 << i)) != 0: 
        return 1
    else: 
        return 0

def printTCAM(m, label, tcam):
    ss = []
    for (ms, ds) in tcam:
        s = ''
        for i in reversed(xrange(ms.size())):
            if getBit(m, ds, i) == 0:
                s += str(getBit(m, ms, i))
            else:
                s += '-'
        ss.append(s)
    print label, ':', (' + '.join(ss))

class Syn51(object):
    def __init__(self):
        pass

    def encodePC(self, pc, opcode, regs, prefix):
        op0 = Extract(7,  0,  opcode)
        op1 = Extract(15, 8,  opcode)
        op2 = Extract(23, 16, opcode)

        pc_p1 = pc + BitVecVal(1, 16)
        pc_p2 = pc + BitVecVal(2, 16)
        pc_p3 = pc + BitVecVal(3, 16)

        ajmp_pc = Concat(Extract(15, 11, pc_p2), Extract(7, 5, op0), op1)
        roffset1 = If(Extract(7, 7, op1) == BitVecVal(1, 1), 
                       Concat(BitVecVal(255, 8), op1),
                       Concat(BitVecVal(0, 8), op1))
        roffset2 = If(Extract(7, 7, op2) == BitVecVal(1, 1), 
                       Concat(BitVecVal(255, 8), op2),
                       Concat(BitVecVal(0, 8), op2))
        rpc1 = pc + roffset1
        rpc2 = pc + roffset2
        abs_pc = Concat(op1, op2)

        PSW   = regs[0x150]
        Rbank = Extract(5, 4, PSW)
        ACC   = regs[0x160]
        SP    = regs[0x101]
        SPm1  = SP - BitVecVal(1, 8)
        DPL   = regs[0x102]
        DPH   = regs[0x103]
        DPTR  = Concat(DPH, DPL)

        Rx = [If(Rbank == BitVecVal(0, 2), regs[i],
                If(Rbank == BitVecVal(1, 2), regs[i+8],
                    If(Rbank == BitVecVal(2, 2), regs[i+16],
                        regs[i+24]))) for i in xrange(8)]


        def reg_selector(index, R):
            if index == 0:
                return regs[0]
            else:
                return If(R == BitVecVal(index, 8), 
                            regs[index], 
                            reg_selector(index-1, R))

        ret_pc = Concat(reg_selector(255, SP), reg_selector(255, SPm1))
        jmp_pc = DPTR + Concat(BitVecVal(0, 8), ACC)

        sel_jmp_pc, self.sel_jmp_bits   = CreateTCAM(op0, prefix+'_sel_jmp_pc', 1)
        sel_ajmp_pc, self.sel_ajmp_bits = CreateTCAM(op0, prefix+'_sel_ajmp_pc', 1)
        sel_abs_pc, self.sel_abs_bits   = CreateTCAM(op0, prefix+'_sel_abs_pc', 1)
        sel_ret_pc, self.sel_ret_bits   = CreateTCAM(op0, prefix+'_sel_ret_pc', 1)
        sel_pcp1, self.sel_pcp1_bits    = CreateTCAM(op0, prefix+'_sel_pcp1', 4)
        sel_pcp2, self.sel_pcp2_bits    = CreateTCAM(op0, prefix+'_sel_pcp2', 4)
        sel_pcp3, self.sel_pcp3_bits    = CreateTCAM(op0, prefix+'_sel_pcp3', 4)

        new_pc = If(sel_pcp1, pc_p1,
                    If(sel_pcp2, pc_p2,
                        If(sel_pcp3, pc_p3,
                            If(sel_ajmp_pc, ajmp_pc,
                                If(sel_abs_pc, abs_pc,
                                    If(sel_ret_pc, ret_pc,
                                        jmp_pc))))))

        return new_pc

    def print_solution(self, m):
        printTCAM(m, 'pc_plus_1  ', self.sel_pcp1_bits)
        printTCAM(m, 'pc_plus_2  ', self.sel_pcp2_bits)
        printTCAM(m, 'pc_plus_3  ', self.sel_pcp3_bits)
        printTCAM(m, 'ajmp       ', self.sel_ajmp_bits)
        printTCAM(m, 'ljmp       ', self.sel_abs_bits)
        printTCAM(m, 'ret        ', self.sel_ret_bits)
        printTCAM(m, 'jmp        ', self.sel_jmp_bits)

def add_cnsts(S, pc, pc_val, opcode, opcode_val, regs, regs_val, new_pc, new_pc_val):
    subs = [
        (pc, BitVecVal(pc_val, 16)),
        (opcode, BitVecVal(opcode_val, 24))
    ]
    assert len(regs) == 384
    assert len(regs_val) == 384
    for reg, reg_val in itertools.izip(regs, regs_val):
        subs.append((reg, BitVecVal(reg_val, 8)))

    new_pc_prime = substitute(new_pc, subs)
    S.add(new_pc_prime == BitVecVal(new_pc_val, 16)) 

def synthesizePC():
    # create solver.
    S = Solver()
    # input variables.
    pc = BitVec('pc', 16)
    opcode = BitVec('opcode', 24)
    regs = [BitVec('r%d' % i, 8) for i in xrange(384)]

    # synthesis formulas and variables.
    s51a = Syn51()
    s51b = Syn51()
    new_pc1 = s51a.encodePC(pc, opcode, regs, 'p1')
    new_pc2 = s51b.encodePC(pc, opcode, regs, 'p2')

    y = Bool('different')
    S.add(y == (new_pc1 != new_pc2))

    op0_lo = Extract(3, 0, opcode)
    S.add(Or(op0_lo == BitVecVal(1, 4), op0_lo == BitVecVal(2, 4), op0_lo == BitVecVal(3, 4)))
    # S.add(op0_lo == BitVecVal(1, 4))

    citer = 0
    while S.check(y) == sat:
        m = S.model()

        opcode_val = m[opcode].as_long()
        pc_val = m[pc].as_long() if m[pc] is not None else 0
        regs_val = [(m[ri].as_long() if m[ri] is not None else 0) for ri in regs]
        new_pc_val = evalPC(pc_val, opcode_val, regs_val)

        # regs_str = ['%d:%d' for x,y in enumerate(regs_val) if y != 0]
        regs_str = ' '.join('%2x:%2x' % (x,y) for x,y in enumerate(regs_val) if y != 0)
        print '%4X %6X [%s] --> %4X' % (pc_val, opcode_val, regs_str, new_pc_val)

        add_cnsts(S, pc, pc_val, opcode, opcode_val, regs, regs_val, new_pc1, new_pc_val)
        add_cnsts(S, pc, pc_val, opcode, opcode_val, regs, regs_val, new_pc2, new_pc_val)

        citer += 1

    print 'UNSAT after %d iterations.' % citer
    assert S.check(Not(y)) == sat
    s51a.print_solution(S.model())

if __name__ == '__main__':
    synthesizePC()
