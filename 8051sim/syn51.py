from z3 import *

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

def encodePC(pc, opcode, regs):
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
    abs_pc = Concat(op2, op1)

    PSW = regs[0x150]
    Rbank = Extract(5, 4, PSW)
    ACC = regs[0x160]
    SP  = regs[0x101]
    DPL = regs[0x102]
    DPH = regs[0x103]
    DPTR = Concat(DPH, DPL)

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

    ret_pc = Concat(reg_selector(255, SP - BitVecVal(1,8)), reg_selector(255, SP))
    jmp_pc = DPTR + Concat(BitVecVal(0, 8), ACC)

pc = BitVec('pc', 16)
opcode = BitVec('opcode', 24)
regs = [BitVec('r%d' % i, 8) for i in xrange(384)]

encodePC(pc, opcode, regs)

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
