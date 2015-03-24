from synthesizer import Synthesizer
from ast import *
from sim51 import evalState
import sys
from uc8051ast import DirectIRAMRead, DirectIRAMWrite, Ctx8051
from uc8051sim import eval8051

def synthesize():
    syn = Synthesizer()
    ctx = Ctx8051(syn)

    ctx.SP_plus1 = Add(ctx.SP, BitVecVal(1, 8))
    ctx.SP_minus1 = Sub(ctx.SP, BitVecVal(1, 8))
    mem_SP = ReadMem(ctx.IRAM, ctx.SP)
    mem_SP_plus1 = ReadMem(ctx.IRAM, ctx.SP_plus1)
    mem_SP_minus1 = ReadMem(ctx.IRAM, ctx.SP_minus1)

    DPTR = Concat(ctx.DPH, ctx.DPL)

    CY = ChooseConsecBits('PSW_CY_bit', 1, ctx.PSW)

    # registers.
    Rbank = ChooseConsecBits('Rbank_bits', 2, ctx.PSW)
    Rxaddr = []
    Rx = []
    for i in xrange(8):
        Rxaddr.append(Concat(BitVecVal(0, 3), Rbank, BitVecVal(i, 3)))
        Rx.append(ReadMem(ctx.IRAM, Rxaddr[-1]))
    assert len(Rx) == 8
    assert len(Rxaddr) == 8
    
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
    
    jb_bit_addr = Choice('bit_addr_choice', op0, [op1, op2])
    jb_msb_set = Equal(Extract(7, 7, jb_bit_addr), BitVecVal(1, 1))
    jb_byte_addr = If(jb_msb_set, Concat(Extract(7, 3, jb_bit_addr), BitVecVal(0, 3)), Add(ZeroExt(Extract(7, 3, jb_bit_addr), 3), BitVecVal(32, 8)))
    jb_bit_num = Extract(2, 0, jb_bit_addr)
    jb_byte = DirectIRAMRead(ctx, jb_byte_addr)
    jb_bit = ExtractBit(jb_byte, jb_bit_num)
    PC_jb_taken = Choice('PC_jb_rel', op0, [PC_rel1, PC_rel2])
    PC_jb_seq = Choice('PC_jb_seq', op0, [PC_plus2, PC_plus3])
    PC_jb = If(Equal(jb_bit, Choice('jb_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), PC_jb_taken, PC_jb_seq)

    PC_jc_taken = Choice('PC_jc_rel', op0, [PC_rel1, PC_rel2])
    PC_jc_seq = Choice('PC_jc_seq', op0, [PC_plus2, PC_plus3])
    PC_jc = If(Equal(CY, Choice('jc_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), PC_jc_taken, PC_jc_seq)

    PC_jz_taken = Choice('PC_jz_rel', op0, [PC_rel1, PC_rel2])
    PC_jz_seq = Choice('PC_jz_seq', op0, [PC_plus2, PC_plus3])
    ACC_zero = Equal(ctx.ACC, BitVecVal(0, 8))
    ACC_not_zero = Not(ACC_zero)
    PC_jz = If(Choice('jz_polarity', op0, [ACC_zero, ACC_not_zero]), PC_jz_taken, PC_jz_seq)
    PC_jmp = Add(DPTR, SignExt(ctx.ACC, 8))

    cjne_src1 = Choice('cjne_src1', op0, [ctx.ACC, ReadMem(ctx.IRAM, Rx[0]), ReadMem(ctx.IRAM, Rx[1])] + Rx)
    cjne_src2 = Choice('cjne_src2', op0, [op1, op2, DirectIRAMRead(ctx, Choice('cjne_iram_addr', op0, [op1, op2]))])
    cjne_taken = Not(Equal(cjne_src1, cjne_src2))
    PC_cjne_taken = Choice('PC_cjne_taken', op0, [PC_rel1, PC_rel2])
    PC_cjne_seq = Choice('PC_cjne_seq', op0, [PC_plus2, PC_plus3])
    PC_cjne = If(cjne_taken, PC_cjne_taken, PC_cjne_seq)

    djnz_src = Choice('djnz_src', op0, [DirectIRAMRead(ctx, Choice('djnz_iram_src', op0, [op1, op2]))] + Rx)
    djnz_taken = Not(Equal(djnz_src, BitVecVal(1, 8)))
    PC_djnz_taken = Choice('PC_djnz_taken', op0, [PC_rel1, PC_rel2])
    PC_djnz_seq = Choice('PC_djnz_seq', op0, [PC_plus2, PC_plus3])
    PC_djnz = If(djnz_taken, PC_djnz_taken, PC_djnz_seq)

    nextPC = Choice('nextPC', op0, [PC_plus1, PC_plus2, PC_plus3, PC_ajmp, PC_ret, PC_ljmp, PC_sjmp, PC_jb, PC_jc, PC_jz, PC_jmp, PC_cjne, PC_djnz])
    syn.addOutput('PC', nextPC, Synthesizer.BITVEC)

    # IMM1 = op1
    # IRAM_MOV_AT_R0 = WriteMem(ctx.IRAM, Rx[0], IMM1)
    # syn.addOutput('IRAM', IRAM_MOV_AT_R0, Synthesizer.MEM)

    # INC_SRC1_INDIR_ADDR = Choice('INC_SRC1_INDIR', op0, [Rx[0], Rx[1]])
    # INC_SRC1_INDIR = ReadMem(ctx.IRAM, INC_SRC1_INDIR_ADDR)

    INC_SRC1_ADDR = Choice('INC_SRC1_ADDR', op0, [op1, op2] + Rxaddr)
    INC_SRC1_ADDR_msb0 = Equal(Extract(7, 7, INC_SRC1_ADDR), BitVecVal(0, 1))
    INC_SRC1_INDIR_ADDR = Choice('INC_SRC1_INDIR_ADDR', op0, [Rx[0], Rx[1]])
    INC_SRC1_INDIR = ReadMem(ctx.IRAM, INC_SRC1_INDIR_ADDR)

    INC_SRC1_DIR = DirectIRAMRead(ctx, INC_SRC1_ADDR)
    INC_SRC1 = Choice('INC_SRC1', op0, [INC_SRC1_DIR, INC_SRC1_INDIR, ctx.ACC])

    INC_RES = Add(INC_SRC1, BitVecVal(1, 8))
    INC_IRAM_DIR = If(INC_SRC1_ADDR_msb0, WriteMem(ctx.IRAM, INC_SRC1_ADDR, INC_RES), ctx.IRAM)
    INC_IRAM_INDIR = WriteMem(ctx.IRAM, INC_SRC1_INDIR_ADDR, INC_RES)
    INC_DIR_ACC = If(Equal(INC_SRC1_ADDR, BitVecVal(0xE0, 8)), INC_RES, ctx.ACC)

    nACC = Choice('nACC', op0, [INC_DIR_ACC, INC_RES, ctx.ACC])
    nIRAM = Choice('nIRAM', op0, [ctx.IRAM, INC_IRAM_DIR, INC_IRAM_INDIR])

    syn.addOutput('ACC', nACC, Synthesizer.BITVEC)
    syn.addOutput('IRAM', nIRAM, Synthesizer.MEM)
    
    syn.VERBOSITY = 0
    # syn.unsat_core = True
    # syn.logfile = sys.stdout # open('debug.log', 'wt')
    # for opcode in [0x76]:
    for opc in [0x04, 0x05, 0x6, 0x7] + range(0x08, 0x10): # range(0x100):
        cnst = Equal(op0, BitVecVal(opc, 8))
        [pc, acc, iram] = syn.synthesize(['PC', 'ACC', 'IRAM'], [cnst], eval8051)
        print '%02x\n%s\n%s\n%s\n' % (opc, pc, acc, iram)


if __name__ == '__main__':
    synthesize()

