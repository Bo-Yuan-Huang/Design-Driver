from synthesizer import Synthesizer
from ast import *
from sim51 import evalState
import sys
from uc8051ast import Ctx8051, Ctx8051FromSyn, create8051Inputs, CtxChoice
from uc8051sim import eval8051

def synthesize():
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

    PC_ajmp  = Concat(Extract(15, 11, PC_plus2), ChooseConsecBits('ajmp_3bits', 3, op0), op1)
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
    PC_jmp = Add(DPTR, SignExt(ctx.ACC, 8))

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

    nextPC = Choice('nextPC', op0, [PC_plus1, PC_ajmp])

    # IMM1 = op1
    # IRAM_MOV_AT_R0 = WriteMem(ctx.IRAM, Rx[0], IMM1)
    # syn.addOutput('IRAM', IRAM_MOV_AT_R0, Synthesizer.MEM)

    # INC_SRC1_INDIR_ADDR = Choice('INC_SRC1_INDIR', op0, [Rx[0], Rx[1]])
    # INC_SRC1_INDIR = ReadMem(ctx.IRAM, INC_SRC1_INDIR_ADDR)

    ctxNOP = ctx.clone()
    ctxNOP.PC = nextPC

    # Instructions which modify the accumulator.
    ACC_RR  = RotateRight(ctxNOP.ACC)
    ACC_RRC = Extract(8, 1, RotateRight(Concat(ctxNOP.ACC, ctx.CY())))
    ACC_INC = Add(ctxNOP.ACC, BitVecVal(1, 8))

    ctxACC = ctxNOP.clone()
    ctxACC.ACC = Choice('ACC_RES', op0, [ACC_RR, ACC_INC])
    ACC_CY = Choice('ACC_CY', op0, [ctxNOP.CY(), Extract(0, 0, ctxNOP.ACC)])
    ctxACC.PSW = Concat(ACC_CY, Extract(6, 0, ctx.PSW))

    # JBC is a weird instruction by itself.
    ctxJBC = ctxNOP.writeBit(jb_bitaddr, BitVecVal(0, 1))

    # call type instructions push the PC onto the stack.
    ctxCALL = ctxNOP.clone()
    PC_topush = Choice('PC_topush', op0, [ctxCALL.PC, PC_plus1, PC_plus2, PC_plus3])
    PC_topush_lo = Extract(7, 0, PC_topush)
    PC_topush_hi = Extract(15, 8, PC_topush)
    PC_topush_0 = Choice('PC_topush_endianess', op0, [PC_topush_lo, PC_topush_hi])
    PC_topush_1 = Choice('PC_topush_endianess', op0, [PC_topush_hi, PC_topush_lo])
    PC_push_addr = Choice('PC_push_addr', op0, [ctxCALL.SP, Add(ctxCALL.SP, BitVecVal(1, 8))])
    ctxCALL.IRAM = WriteMem(WriteMem(ctxCALL.IRAM, PC_push_addr, PC_topush_0), Add(PC_push_addr, BitVecVal(1, 8)), PC_topush_1)

    SRC1_DIR_ADDR = Choice('SRC1_DIR', op0, [op1, op2] + ctxNOP.RxAddrs())
    SRC1_DIR = ctxNOP.readDirect(SRC1_DIR_ADDR)
    SRC1_DIR_INC = Add(SRC1_DIR, BitVecVal(1, 8))
    ctxDIR = ctxNOP.writeDirect(SRC1_DIR_ADDR, SRC1_DIR_INC)

    SRC1_INDIR_ADDR = Choice('SRC1_INDIR_ADDR', op0, [ctxNOP.Rx(0), ctxNOP.Rx(1)])
    SRC1_INDIR = ReadMem(ctxNOP.IRAM, SRC1_INDIR_ADDR)
    SRC1_INDIR_INC = Add(SRC1_INDIR, BitVecVal(1, 8))
    ctxINDIR = ctxNOP.clone()
    ctxINDIR.IRAM = WriteMem(ctxNOP.IRAM, SRC1_INDIR_ADDR, SRC1_INDIR_INC)

    ctxFINAL = CtxChoice('CTX3', op0, [ctxNOP, ctxACC, ctxDIR, ctxINDIR, ctxJBC, ctxCALL])
    syn.addOutput('PC', ctxNOP.PC, Synthesizer.BITVEC)

    syn.logfile = sys.stdout # open('debug.log', 'wt')
    for opc in xrange(1, 2):
        cnst = Equal(op0, BitVecVal(opc, 8))
        if opc == 1:
            syn.DEBUG = True
            syn.VERBOSITY = 2
        [pc] = syn.synthesize(['PC'], [cnst], eval8051)
        print '%02x\n%s\n' % (opc, str(pc))

        # [acc] = syn.synthesize(['ACC'], [cnst], eval8051)
        # [pc] = syn.synthesize(['PC'], [cnst], eval8051)
        # print '%02x\n%s\n' % (opc, str(pc))
        # print '%02x\n%s\n' % (opc, str(acc))
        # print '%02x\n%s\n%s\n' % (opc, str(pc), str(acc))
        # [pc, acc, iram] = syn.synthesize(['PC', 'ACC', 'IRAM'], [cnst], eval8051)
        # print '%02x\n%s\n%s\n%s\n' % (opc, pc, acc, iram)


if __name__ == '__main__':
    synthesize()

