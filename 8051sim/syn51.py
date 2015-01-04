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

def evalTCAM(m, value, tcam):
    "Evaluate whether value matches the model m for the TCAM."
    for (ms, ds) in tcam:
        match = True
        for i in xrange(ms.size()):
            if getBit(m, ds, i) == 0:
                b_tcam = getBit(m, ms, i)
                b_value = (value & ( 1 << i)) != 0
                if b_value != b_tcam:
                    match = False
                    break
        if match:
            return True
    return False

class Syn51(object):
    def __init__(self):
        pass

    def encodePC(self, pc, opcode, regs, prefix):
        op0 = Extract(7,  0,  opcode)
        op1 = Extract(15, 8,  opcode)
        op2 = Extract(23, 16, opcode)

        # PC + {1,2,3}
        pc_p1 = pc + BitVecVal(1, 16)
        pc_p2 = pc + BitVecVal(2, 16)
        pc_p3 = pc + BitVecVal(3, 16)

        # absolute jump target.
        ajmp_pc = Concat(Extract(15, 11, pc_p2), Extract(7, 5, op0), op1)
        # relative jump offsets (taken from either second or third byte of instruction.)
        roffset1 = If(Extract(7, 7, op1) == BitVecVal(1, 1), 
                       Concat(BitVecVal(255, 8), op1),
                       Concat(BitVecVal(0, 8), op1))
        roffset2 = If(Extract(7, 7, op2) == BitVecVal(1, 1), 
                       Concat(BitVecVal(255, 8), op2),
                       Concat(BitVecVal(0, 8), op2))
        rpc1 = pc_p2 + roffset1
        rpc2 = pc_p3 + roffset2
        # short jump target.
        sjmp_pc = rpc1
        # long (full 16b) jmp target
        ljmp_pc = Concat(op1, op2)

        # useful registers.
        PSW   = regs[0x150]
        Rbank = Extract(4, 3, PSW)  # Current register bank.
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

        def reg_selector(index, R, sz):
            # Helper function that reads a particular index from the IRAM.
            # index : the higest index of the possible location range.
            # R     : R is the address of the location to be read.
            # sz    : sz is the number of bits in R. (usually 8 or 9).
            if index == 0:
                return regs[0]
            else:
                return If(R == BitVecVal(index, sz), 
                            regs[index], 
                            reg_selector(index-1, R, sz))

        # cjne

        # where is the first source of cjne from?
        cjne_src1_a, self.cjne_src1_a_bits = CreateTCAM(op0, prefix+'_cjne_src1_a', 1)
        cjne_src1_at_r0, self.cjne_src1_at_r0_bits = CreateTCAM(op0, prefix+'_cjne_src1_at_r0', 1)
        cjne_src1_at_r1, self.cjne_src1_at_r1_bits = CreateTCAM(op0, prefix+'_cjne_src1_at_r1', 1)
        cjne_src1_r0, self.cjne_src1_r0_bits = CreateTCAM(op0, prefix+'_cjne_src1_r0', 1)
        cjne_src1_r1, self.cjne_src1_r1_bits = CreateTCAM(op0, prefix+'_cjne_src1_r1', 1)
        cjne_src1_r2, self.cjne_src1_r2_bits = CreateTCAM(op0, prefix+'_cjne_src1_r2', 1)
        cjne_src1_r3, self.cjne_src1_r3_bits = CreateTCAM(op0, prefix+'_cjne_src1_r3', 1)
        cjne_src1_r4, self.cjne_src1_r4_bits = CreateTCAM(op0, prefix+'_cjne_src1_r4', 1)
        cjne_src1_r5, self.cjne_src1_r5_bits = CreateTCAM(op0, prefix+'_cjne_src1_r5', 1)
        cjne_src1_r6, self.cjne_src1_r6_bits = CreateTCAM(op0, prefix+'_cjne_src1_r6', 1)
        # r7 not needed because it is the "default"

        # actually get the src1 of cjne
        cjne_src1 = If(cjne_src1_a, ACC, 
                        If(cjne_src1_at_r0, reg_selector(255, Rx[0], 8),
                            If(cjne_src1_at_r1, reg_selector(255, Rx[1], 8),
                                If(cjne_src1_r0, Rx[0],
                                    If(cjne_src1_r1, Rx[1],
                                        If(cjne_src1_r2, Rx[2],
                                            If(cjne_src1_r3, Rx[3],
                                                If(cjne_src1_r4, Rx[4],
                                                    If(cjne_src1_r5, Rx[5],
                                                        If(cjne_src1_r6, Rx[6],
                                                            Rx[7]))))))))))

        # IRAM addr for both CJNE and DJNZ
        cjne_djnz_iram_addr = Concat(BitVecVal(0,1), op1) + If(Extract(7,7,op1) == BitVecVal(1,1), BitVecVal(0x80, 9), BitVecVal(0, 9))
        # the second src of cjne is a lot simpler.
        cjne_src2_iram, self.cjne_src2_iram_bits = CreateTCAM(op0, prefix+'_cjne_src2_iram', 1)
        cjne_src2 = If(cjne_src2_iram, reg_selector(383, cjne_djnz_iram_addr, 9), op1)
        cjne_result = cjne_src1 != cjne_src2
        cjne_pc = If(cjne_result, rpc2, pc_p3)
        cjne, self.cjne_bits = CreateTCAM(op0, prefix+'_cjne', 2)

        # compute the djnz src.
        djnz_r0_src, self.djnz_r0_bits = CreateTCAM(op0, prefix+'_djnz_r0_src', 1)
        djnz_r1_src, self.djnz_r1_bits = CreateTCAM(op0, prefix+'_djnz_r1_src', 1)
        djnz_r2_src, self.djnz_r2_bits = CreateTCAM(op0, prefix+'_djnz_r2_src', 1)
        djnz_r3_src, self.djnz_r3_bits = CreateTCAM(op0, prefix+'_djnz_r3_src', 1)
        djnz_r4_src, self.djnz_r4_bits = CreateTCAM(op0, prefix+'_djnz_r4_src', 1)
        djnz_r5_src, self.djnz_r5_bits = CreateTCAM(op0, prefix+'_djnz_r5_src', 1)
        djnz_r6_src, self.djnz_r6_bits = CreateTCAM(op0, prefix+'_djnz_r6_src', 1)
        djnz_r7_src, self.djnz_r7_bits = CreateTCAM(op0, prefix+'_djnz_r7_src', 1)
        djnz_iram_sel = Not(Or(djnz_r0_src, djnz_r1_src, djnz_r2_src, djnz_r3_src, djnz_r4_src, djnz_r5_src, djnz_r6_src, djnz_r7_src))
        djnz_src = If(djnz_r0_src, Rx[0],
                        If(djnz_r1_src, Rx[1],
                            If(djnz_r2_src, Rx[2],
                                If(djnz_r3_src, Rx[3],
                                    If(djnz_r4_src, Rx[4],
                                        If(djnz_r5_src, Rx[5],
                                            If(djnz_r6_src, Rx[6],
                                                If(djnz_r7_src, Rx[7],
                                                    reg_selector(383, cjne_djnz_iram_addr, 9)))))))))
        djnz_result = djnz_src != BitVecVal(1, 8)
        djnz_pc_iram = If(djnz_result, rpc2, pc_p3)
        djnz_pc_reg  = If(djnz_result, rpc1, pc_p2)
        djnz_pc = If(djnz_iram_sel, djnz_pc_iram, djnz_pc_reg)
        djnz, self.djnz_bits = CreateTCAM(op0, prefix+'_djnz', 2)

        # compute the bit being addressed.
        bit_addr = op1
        bit_addr_bit_num = Extract(2, 0, bit_addr)
        iram_bit_addr_byte_index =  BitVecVal(32, 9) + Concat(BitVecVal(0, 5), Extract(6, 3, bit_addr))
        sfr_bit_addr_byte_index  = BitVecVal(128, 9) + Concat(BitVecVal(0, 1), Extract(7, 3, bit_addr), BitVecVal(0, 3))
        bit_addr_byte_index = If((Extract(7, 7, bit_addr) == BitVecVal(1,1)), 
                                sfr_bit_addr_byte_index, 
                                iram_bit_addr_byte_index)
        # finally read the byte.
        bit_addr_byte = reg_selector(383, bit_addr_byte_index, 9)
        bit_addr_bit  = (If(bit_addr_bit_num == BitVecVal(0, 3), Extract(0, 0, bit_addr_byte),
                            If(bit_addr_bit_num == BitVecVal(1, 3), Extract(1, 1, bit_addr_byte),
                                If(bit_addr_bit_num == BitVecVal(2, 3), Extract(2, 2, bit_addr_byte),
                                    If(bit_addr_bit_num == BitVecVal(3, 3), Extract(3, 3, bit_addr_byte),
                                        If(bit_addr_bit_num == BitVecVal(4, 3), Extract(4, 4, bit_addr_byte),
                                            If(bit_addr_bit_num == BitVecVal(5, 3), Extract(5, 5, bit_addr_byte),
                                                If(bit_addr_bit_num == BitVecVal(6, 3), Extract(6, 6, bit_addr_byte),
                                                    Extract(7, 7, bit_addr_byte))))))))) == BitVecVal(1, 1)


        # extract carry and zero flags (zero is not a real flat, need to comp ACC with 0.)
        carry_bit = (Extract(7, 7, PSW) == BitVecVal(1, 1))
        zero_bit  = (ACC == BitVecVal(0, 8))

        # and finally compute the conditional jump targets.
        jb, self.jb_bits = CreateTCAM(op0, prefix+'_jb', 2)
        jc, self.jc_bits = CreateTCAM(op0, prefix+'_jc', 1)
        jz, self.jz_bits = CreateTCAM(op0, prefix+'_jz', 1)
        self.sel_jcond = Or(jb, jc, jz, cjne)
        cond_bit = If(jb, bit_addr_bit, 
                        If(jc, carry_bit, 
                            zero_bit))
        jcond_invert, self.jcond_invert_bits = CreateTCAM(op0, prefix+'_jcond_invert', 3)
        jcondtaken = And(Xor(cond_bit, jcond_invert), self.sel_jcond) # conditional branch and match.
        jb_pc = If(jcondtaken, rpc2, pc_p3)
        jcz_pc = If(jcondtaken, rpc1, pc_p2)
        # conditional jump target.
        jcond_pc = If(jb, jb_pc, If(cjne, cjne_pc, If(djnz, djnz_pc, jcz_pc)))

        # return target.
        ret_pc = Concat(reg_selector(255, SP, 8), reg_selector(255, SPm1, 8))
        # jump target.
        jmp_pc = DPTR + Concat(BitVecVal(0, 8), ACC)

        self.sel_jmp_pc, self.sel_jmp_bits   = CreateTCAM(op0, prefix+'_sel_jmp_pc', 1)
        self.sel_ajmp_pc, self.sel_ajmp_bits = CreateTCAM(op0, prefix+'_sel_ajmp_pc', 1)
        self.sel_sjmp_pc, self.sel_sjmp_bits = CreateTCAM(op0, prefix+'_sel_sjmp_c', 1)
        self.sel_ljmp_pc, self.sel_ljmp_bits = CreateTCAM(op0, prefix+'_sel_ljmp_pc', 1)
        self.sel_ret_pc, self.sel_ret_bits   = CreateTCAM(op0, prefix+'_sel_ret_pc', 1)
        self.sel_pcp1, self.sel_pcp1_bits    = CreateTCAM(op0, prefix+'_sel_pcp1', 6)
        self.sel_pcp2, self.sel_pcp2_bits    = CreateTCAM(op0, prefix+'_sel_pcp2', 6)
        self.sel_pcp3, self.sel_pcp3_bits    = CreateTCAM(op0, prefix+'_sel_pcp3', 6)

        new_pc = If(self.sel_pcp1, pc_p1,
                    If(self.sel_pcp2, pc_p2,
                        If(self.sel_pcp3, pc_p3,
                            If(self.sel_ajmp_pc, ajmp_pc,
                                If(self.sel_sjmp_pc, sjmp_pc,
                                    If(self.sel_ljmp_pc, ljmp_pc,
                                        If(self.sel_ret_pc, ret_pc,
                                            If(self.sel_jcond, jcond_pc,
                                            jmp_pc))))))))

        return new_pc

    def exclusive_sels(self):
        sels = [
            self.sel_jmp_pc, self.sel_ajmp_pc, self.sel_sjmp_pc, self.sel_ljmp_pc,
            self.sel_ret_pc, self.sel_pcp1, self.sel_pcp2, self.sel_pcp3
        ]
        terms = []
        for i in xrange(len(sels)):
            s1 = sels[i]
            for j in xrange(i):
                s2 = sels[j]
                terms.append(Not(And(s1, s2)))
        return And(*terms)
        
    def print_solution(self, m):
        printTCAM(m, 'pc_plus_1  ', self.sel_pcp1_bits)
        printTCAM(m, 'pc_plus_2  ', self.sel_pcp2_bits)
        printTCAM(m, 'pc_plus_3  ', self.sel_pcp3_bits)
        printTCAM(m, 'ajmp       ', self.sel_ajmp_bits)
        printTCAM(m, 'sjmp       ', self.sel_sjmp_bits)
        printTCAM(m, 'ljmp       ', self.sel_ljmp_bits)
        printTCAM(m, 'ret        ', self.sel_ret_bits)
        printTCAM(m, 'jb         ', self.jb_bits)
        printTCAM(m, 'jc         ', self.jc_bits)
        printTCAM(m, 'jz         ', self.jz_bits)
        printTCAM(m, 'jcond_inv  ', self.jcond_invert_bits)
        printTCAM(m, 'jmp        ', self.sel_jmp_bits)

    def get_table_entry(self, r, c, m):
        def opResult(opcode):
            if evalTCAM(m, opcode, self.sel_pcp1_bits):
                return 'PC+1'
            if evalTCAM(m, opcode, self.sel_pcp2_bits):
                return 'PC+2'
            if evalTCAM(m, opcode, self.sel_pcp3_bits):
                return 'PC+3'
            if evalTCAM(m, opcode, self.sel_ajmp_bits):
                return 'AJMP'
            if evalTCAM(m, opcode, self.sel_sjmp_bits):
                return 'SJMP'
            if evalTCAM(m, opcode, self.sel_ljmp_bits):
                return 'LJMP'
            if evalTCAM(m, opcode, self.sel_ret_bits):
                return 'RET' 

            cond_invert = evalTCAM(m, opcode, self.jcond_invert_bits)
            if evalTCAM(m, opcode, self.jb_bits):
                return 'JNB' if cond_invert else 'JB'
            if evalTCAM(m, opcode, self.cjne_bits):
                return 'CJNE'
            if evalTCAM(m, opcode, self.djnz_bits):
                return 'DJNZ'
            if evalTCAM(m, opcode, self.jc_bits):
                return 'JNC' if cond_invert else 'JC'
            if evalTCAM(m, opcode, self.jz_bits):
                return 'JNZ' if cond_invert else 'JZ'
            return 'JMP'

        
        opcode = (r << 4) | c
        return '%-4s'% opResult(opcode)

    def print_table(self, rows, cols, m):
        for r in rows:
            for c in cols:
                print self.get_table_entry(r, c, m),
            print

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

def synthesizePC(rows, cols):
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
    op0_hi = Extract(7, 4, opcode)
    # S.add(Or(op0_lo == BitVecVal(0, 4), op0_lo == BitVecVal(1, 4), op0_lo == BitVecVal(2, 4), op0_lo == BitVecVal(3, 4)))
    # S.add(Or(op0_lo == BitVecVal(1, 4), op0_lo == BitVecVal(2, 4), op0_lo == BitVecVal(3, 4)))
    S.add(Or(*[op0_lo == BitVecVal(ni, 4) for ni in cols]))
    S.add(Or(*[op0_hi == BitVecVal(ni, 4) for ni in rows]))

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

    # S.add(s51a.exclusive_sels())
    assert S.check(Not(y)) == sat
    #s51a.print_solution(S.model())
    #s51a.print_table(rows, cols, S.model())
    return s51a, S.model()

if __name__ == '__main__':
    rstrs = []
    for r in xrange(16):
        cs = xrange(16)
        s, m = synthesizePC([r], cs)
        rstrs.append([s.get_table_entry(r, ci, m) for ci in cs])

    for r in rstrs:
        print ' '.join(r)


    # s.print_table(rs, cs, m)
