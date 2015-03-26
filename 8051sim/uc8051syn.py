from synthesizer import Synthesizer
from ast import *
from sim51 import evalState
import sys
from uc8051ast import Ctx8051, Ctx8051FromSyn, create8051Inputs, CtxChoice
from uc8051sim import eval8051
from multiprocessing import Pool

def synthesize(opcs):
    syn = Synthesizer()
    create8051Inputs(syn)
    ctx = Ctx8051FromSyn(syn)

    mem_SP = ReadMem(ctx.IRAM, ctx.SP)
    mem_SP_plus1 = ReadMem(ctx.IRAM, Add(ctx.SP, BitVecVal(1, 8)))
    mem_SP_minus1 = ReadMem(ctx.IRAM, Sub(ctx.SP, BitVecVal(1, 8)))
    DPTR = Concat(ctx.DPH, ctx.DPL)

    op0 = Extract(7, 0, ctx.opcode)
    op1 = Extract(15, 8, ctx.opcode)
    op2 = Extract(23, 16, ctx.opcode)

    PC_plus1 = Add(ctx.PC, BitVecVal(1, 16))
    PC_plus2 = Add(ctx.PC, BitVecVal(2, 16))
    PC_plus3 = Add(ctx.PC, BitVecVal(3, 16))
    PC_rel1 = Add(Choice('PC_rel1_base', op0, [ctx.PC, PC_plus1, PC_plus2, PC_plus3]), SignExt(op1, 8))
    PC_rel2 = Add(Choice('PC_rel2_base', op0, [ctx.PC, PC_plus1, PC_plus2, PC_plus3]), SignExt(op2, 8))

    PC_ajmp  = Concat(Extract(15, 11, Choice('ajmp', op0, [ctx.PC, PC_plus2])),
                      ChooseConsecBits('ajmp_3bits', 3, ctx.opcode), 
                      ChooseConsecBits('ajmp_8bits', 8, ctx.opcode))
    PC_ret1 = Concat(mem_SP_minus1, mem_SP)
    PC_ret2 = Concat(mem_SP, mem_SP_plus1)
    PC_ret3 = Concat(mem_SP, mem_SP_minus1)
    PC_ret4 = Concat(mem_SP_plus1, mem_SP)
    PC_ret = Choice('ctx.SP_pc', op0, [PC_ret1, PC_ret2, PC_ret3, PC_ret4])
    PC_ljmp = Choice('LJMP_order', op0, [Concat(op1, op2), Concat(op2, op1)])
    PC_sjmp = Choice('SJMP_relpc', op0, [PC_rel1, PC_rel2])
    
    
    jb_bitaddr = Choice('jb_bit_addr_choice', op0, [op1, op2])
    jb_bit = ctx.readBit(jb_bitaddr)
    PC_jb_taken = Choice('PC_jb_rel', op0, [PC_rel1, PC_rel2])
    PC_jb_seq = Choice('PC_jb_seq', op0, [PC_plus2, PC_plus3])
    PC_jb = If(Equal(jb_bit, Choice('jb_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), 
        PC_jb_taken, 
        PC_jb_seq)

    PC_jc_taken = Choice('PC_jc_rel', op0, [PC_rel1, PC_rel2])
    PC_jc_seq = Choice('PC_jc_seq', op0, [PC_plus2, PC_plus3])
    PC_jc = If(Equal(ctx.CY(), Choice('jc_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), 
        PC_jc_taken, 
        PC_jc_seq)

    PC_jz_taken = Choice('PC_jz_rel', op0, [PC_rel1, PC_rel2])
    PC_jz_seq = Choice('PC_jz_seq', op0, [PC_plus2, PC_plus3])
    ACC_zero = Equal(ctx.ACC, BitVecVal(0, 8))
    ACC_not_zero = Not(ACC_zero)
    PC_jz = If(Choice('jz_polarity', op0, [ACC_zero, ACC_not_zero]), PC_jz_taken, PC_jz_seq)
    PC_jmp = Add(DPTR, ZeroExt(ctx.ACC, 8))

    cjne_src1 = Choice('cjne_src1', op0, 
        [ctx.ACC, ReadMem(ctx.IRAM, ctx.Rx(0)), ReadMem(ctx.IRAM, ctx.Rx(1))] + ctx.Rxs())
    cjne_src2 = Choice('cjne_src2', op0, 
        [op1, op2, ctx.readDirect(Choice('cjne_iram_addr', op0, [op1, op2]))])
    cjne_taken = Not(Equal(cjne_src1, cjne_src2))
    PC_cjne_taken = Choice('PC_cjne_taken', op0, [PC_rel1, PC_rel2])
    PC_cjne_seq = Choice('PC_cjne_seq', op0, [PC_plus2, PC_plus3])
    PC_cjne = If(cjne_taken, PC_cjne_taken, PC_cjne_seq)

    djnz_src = Choice('djnz_src', op0, 
        [ctx.readDirect(Choice('djnz_iram_src', op0, [op1, op2]))] + ctx.Rxs())
    djnz_taken = Not(Equal(djnz_src, BitVecVal(1, 8)))
    PC_djnz_taken = Choice('PC_djnz_taken', op0, [PC_rel1, PC_rel2])
    PC_djnz_seq = Choice('PC_djnz_seq', op0, [PC_plus2, PC_plus3])
    PC_djnz = If(djnz_taken, PC_djnz_taken, PC_djnz_seq)

    nextPC = Choice('nextPC', op0, [
        PC_plus1, PC_plus2, PC_plus3, PC_ajmp, 
        PC_ret, PC_ljmp, PC_sjmp, PC_jb, 
        PC_jc, PC_jz, PC_jmp, PC_cjne, PC_djnz])

    # IMM1 = op1
    # IRAM_MOV_AT_R0 = WriteMem(ctx.IRAM, Rx[0], IMM1)
    # syn.addOutput('IRAM', IRAM_MOV_AT_R0, Synthesizer.MEM)

    # INC_SRC1_INDIR_ADDR = Choice('INC_SRC1_INDIR', op0, [Rx[0], Rx[1]])
    # INC_SRC1_INDIR = ReadMem(ctx.IRAM, INC_SRC1_INDIR_ADDR)

    ctxNOP = ctx.clone()
    ctxNOP.PC = nextPC
    # SP can be incremented, decrement or stay the same
    ctxNOP.SP = Choice('SP_CALL', op0, [ctx.SP, Add(ctx.SP, BitVecVal(2, 8)), Sub(ctx.SP, BitVecVal(2, 8))])

    # SRC2 for instructions which modify accumulator.
    ACC_SRC2_DIR_ADDR = Choice('ACC_SRC2_DIR_ADDR', op0, [op1, op2] + ctx.RxAddrs())
    ACC_SRC2_DIR = ctx.readDirect(ACC_SRC2_DIR_ADDR)
    ACC_SRC2_INDIR_ADDR = Choice('ACC_SRC2_INDIR_ADDR', op0, [ctx.Rx(0), ctx.Rx(1)])
    ACC_SRC2_INDIR = ReadMem(ctx.IRAM, ACC_SRC2_INDIR_ADDR)
    SRC2_IMM = Choice('SRC2_IMM', op0, [op1, op2])
    ACC_SRC2 = Choice('ACC_SRC2', op0, [ACC_SRC2_DIR, ACC_SRC2_INDIR, SRC2_IMM])

    # Instructions which modify the accumulator.
    ACC_RR  = RotateRight(ctx.ACC)
    ACC_RRC = Extract(8, 1, RotateRight(Concat(ctx.ACC, ctx.CY())))
    ACC_RL  = RotateLeft(ctx.ACC)
    ACC_RLC = Extract(7, 0, RotateLeft(Concat(ctx.CY(), ctx.ACC)))
    ACC_INC = Add(ctx.ACC, BitVecVal(1, 8))
    ACC_DEC = Sub(ctx.ACC, BitVecVal(1, 8))
    ACC_ADD = Add(ctx.ACC, ACC_SRC2)
    ACC_ADDC = Add(ctx.ACC, Add(ACC_SRC2, ZeroExt(ctx.CY(), 7)))
    ACC_ORL = BVOr(ctx.ACC, ACC_SRC2)
    ACC_ANL = BVAnd(ctx.ACC, ACC_SRC2)
    ACC_XRL = BVXor(ctx.ACC, ACC_SRC2)
    ACC_MOV = ACC_SRC2

    # final acc value.
    ctxACC = ctxNOP.clone()
    ctxACC.ACC = Choice('ACC_RES', op0, [ACC_RR, ACC_RL, ACC_RRC, ACC_RLC, ACC_INC, ACC_DEC, ACC_ADD, ACC_ADDC, ACC_ORL, ACC_ANL, ACC_XRL, ACC_MOV])
    
    # compute the CY/AC/OV flags
    ALU_CY_IN = Choice('ALU_CY_IN', op0, [ctx.CY(), BitVecVal(0, 1)])

    ALU_SRC1 = ctx.ACC
    ALU_SRC1_LO = Extract(3, 0, ALU_SRC1)
    ALU_SRC1_HI = Extract(7, 4, ALU_SRC1)

    ALU_SRC2 = ACC_SRC2
    ALU_SRC2_LO = Extract(3, 0, ALU_SRC2)
    ALU_SRC2_HI = Extract(7, 4, ALU_SRC2)
    ALU_AC = Extract(4, 4, Add(ZeroExt(ALU_SRC1_LO, 1), Add(ZeroExt(ALU_SRC2_LO, 1), ZeroExt(ALU_CY_IN, 4))))

    ALU_SRC1_SEXT = SignExt(ALU_SRC1, 1)
    ALU_SRC2_SEXT = SignExt(ALU_SRC2, 1)
    ALU_SRC1_ZEXT = ZeroExt(ALU_SRC1, 1)
    ALU_SRC2_ZEXT = ZeroExt(ALU_SRC2, 1)

    ALU_SRC1_FOR_CY = Choice('ALU_SRC_FOR_CY', op0, [ALU_SRC1_SEXT, ALU_SRC1_ZEXT])
    ALU_SRC2_FOR_CY = Choice('ALU_SRC_FOR_CY', op0, [ALU_SRC2_SEXT, ALU_SRC2_ZEXT])
    ALU_CY = Extract(8, 8, Add(ALU_SRC1_FOR_CY, Add(ALU_SRC2_FOR_CY, ZeroExt(ALU_CY_IN, 8))))

    ALU_SRC1_FOR_OV = Choice('ALU_SRC_FOR_OV', op0, [ALU_SRC1_SEXT, ALU_SRC1_ZEXT])
    ALU_SRC2_FOR_OV = Choice('ALU_SRC_FOR_OV', op0, [ALU_SRC2_SEXT, ALU_SRC2_ZEXT])
    ALU_OV_CY = Extract(8, 8, Add(ALU_SRC2_FOR_OV, Add(ALU_SRC1_FOR_OV, ZeroExt(ALU_CY_IN, 8))))
    ALU_OV = If(Equal(ALU_OV_CY, Extract(7, 7, ctxACC.ACC)), BitVecVal(0, 1), BitVecVal(1, 1))

    ACC_CY = Choice('ACC_CY', op0, [ctx.CY(), Extract(0, 0, ctx.ACC), Extract(7, 7, ctx.ACC), ALU_CY])
    ACC_AC = Choice('ACC_AC', op0, [ctx.AC(), ALU_AC])
    ACC_OV = Choice('ACC_OV', op0, [ctx.OV(), ALU_OV])

    ctxACC.PSW = Concat(ACC_CY, ACC_AC, Extract(5, 3, ctx.PSW), ACC_OV, Extract(1, 0, ctx.PSW))

    # JBC is a weird instruction by itself.
    ctxJBC = ctxNOP.writeBit(jb_bitaddr, BitVecVal(0, 1))

    # call type instructions push the PC onto the stack.
    ctxCALL = ctxNOP.clone()
    PC_topush = Choice('PC_topush', op0, [ctx.PC, PC_plus1, PC_plus2, PC_plus3])
    PC_topush_lo = Extract(7, 0, PC_topush)
    PC_topush_hi = Extract(15, 8, PC_topush)
    PC_topush_0 = Choice('PC_topush_endianess', op0, [PC_topush_lo, PC_topush_hi])
    PC_topush_1 = Choice('PC_topush_endianess', op0, [PC_topush_hi, PC_topush_lo])
    PC_push_addr = Choice('PC_push_addr', op0, [ctx.SP, Add(ctx.SP, BitVecVal(1, 8))])
    ctxCALL.IRAM = WriteMem(WriteMem(ctx.IRAM, PC_push_addr, PC_topush_0), Add(PC_push_addr, BitVecVal(1, 8)), PC_topush_1)

    # instructions where the result is a direct iram address
    SRC1_DIR_ADDR = Choice('SRC1_DIR', op0, [op1, op2] + ctx.RxAddrs())
    SRC1_DIR = ctx.readDirect(SRC1_DIR_ADDR)
    SRC2_DIR = Choice('SRC2_DIR', op0, [op1, op2, ctx.ACC])
    DIR_INC = Add(SRC1_DIR, BitVecVal(1, 8))
    DIR_DEC = Sub(SRC1_DIR, BitVecVal(1, 8))
    DIR_ORL = BVOr(SRC1_DIR, SRC2_DIR)
    DIR_ANL = BVAnd(SRC1_DIR, SRC2_DIR)
    DIR_XRL = BVXor(SRC1_DIR, SRC2_DIR)
    DIR_MOV = SRC2_DIR

    DIR_RESULT = Choice('DIR_RESULT', op0, [DIR_INC, DIR_DEC, DIR_ORL, DIR_ANL, DIR_XRL, DIR_MOV])
    ctxDIR = ctxNOP.writeDirect(SRC1_DIR_ADDR, DIR_RESULT)

    # instructions where the result is an indirect iram address
    SRC1_INDIR_ADDR = Choice('SRC1_INDIR_ADDR', op0, [ctx.Rx(0), ctx.Rx(1)])
    SRC1_INDIR = ReadMem(ctx.IRAM, SRC1_INDIR_ADDR)
    SRC2_INDIR = Choice('SRC2_INDIR', op0, [op1, op2])
    SRC1_INDIR_INC = Add(SRC1_INDIR, BitVecVal(1, 8))
    SRC1_INDIR_DEC = Sub(SRC1_INDIR, BitVecVal(1, 8))
    SRC1_INDIR_MOV = SRC2_INDIR
    SRC1_INDIR_RESULT = Choice('SRC1_INDIR_RESULT', op0, [SRC1_INDIR_INC, SRC1_INDIR_DEC, SRC1_INDIR_MOV])
    ctxINDIR = ctxNOP.clone()
    ctxINDIR.IRAM = WriteMem(ctx.IRAM, SRC1_INDIR_ADDR, SRC1_INDIR_RESULT)

    # instructions which write to specific bit addressable registers.
    ctxBIT = ctxNOP.clone()
    BIT_SRC1_ADDR = Choice('BIT_SRC1_ADDR', op0, [op1, op2])
    BIT_SRC1 = ctx.readBit(BIT_SRC1_ADDR)
    CY_ORL = BVOr(ctx.CY(), BIT_SRC1)
    BIT_CY = Choice('BIT_CY', op0, [ctx.CY(), CY_ORL])
    ctxBIT.PSW = Concat(BIT_CY, Extract(6, 0, ctx.PSW))

    # final result.
    ctxFINAL = CtxChoice('CTX3', op0, [ctxNOP, ctxACC, ctxDIR, ctxINDIR, ctxJBC, ctxCALL, ctxBIT])
    syn.addOutput('PC', ctxFINAL.PC, Synthesizer.BITVEC)
    syn.addOutput('ACC', ctxFINAL.ACC, Synthesizer.BITVEC)
    syn.addOutput('IRAM', ctxFINAL.IRAM, Synthesizer.MEM)
    syn.addOutput('PSW', ctxFINAL.PSW, Synthesizer.BITVEC)
    syn.addOutput('SP', ctxFINAL.SP, Synthesizer.BITVEC)

    # syn.debug()
    for opc in opcs:
        z3._main_ctx = None
        cnst = Equal(op0, BitVecVal(opc, 8))
        r = syn.synthesize(['PC', 'ACC', 'IRAM', 'PSW', 'SP'], [cnst], eval8051)
        fmt = '%02x\n' + ('\n'.join(['%s'] * len(r))) + '\n'
        print fmt % tuple([opc] + r)

if __name__ == '__main__':
    synthesize(xrange(0x80))

