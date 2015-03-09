from synthesizer import Synthesizer
from ast import *
from sim51 import evalState

def eval8051(inputs, outputs):
    # initialize input state.
    iram = inputs['IRAM']
    assert len(iram) >= 1
    default_iram = iram[-1]
    regs = [default_iram]*384
    for [addr,data] in iram[:-1]:
        assert addr < 256
        assert data < 256
        regs[addr] = data
    # regs = [0] * 384

    regs[0x160] = inputs['ACC']
    regs[0x101] = inputs['SP']
    regs[0x150] = inputs['PSW']
    regs[0x102] = inputs['DPL']
    regs[0x103] = inputs['DPH']

    opcode = inputs['opcode']
    pc = inputs['PC']
    # simulate
    newPC, newRegs = evalState(pc, opcode, regs)
    # read output state
    outputs['PC'] = newPC
    outputs['ACC']  = newRegs[0x160]
    outputs['SP']   = newRegs[0x101]
    outputs['PSW']  = newRegs[0x150]
    outputs['DPL']  = newRegs[0x102]
    outputs['DPH']  = newRegs[0x103]

def create8051Inputs(syn):
    # The "more useful" registers.
    syn.addInput(BitVecVar('ACC', 8))
    syn.addInput(BitVecVar('B', 8))
    syn.addInput(BitVecVar('PSW', 8))
    syn.addInput(BitVecVar('SP', 8))
    syn.addInput(BitVecVar('DPL', 8))
    syn.addInput(BitVecVar('DPH', 8))
    # These two are for the synthesis. 
    # Need to think about replacing this with a memory abstraction.
    syn.addInput(BitVecVar('PC', 16))
    syn.addInput(BitVecVar('opcode', 24))
    # IRAM
    syn.addInput(MemVar('IRAM', 8, 8))
    # ports
    syn.addInput(BitVecVar('P0', 8))
    syn.addInput(BitVecVar('P1', 8))
    syn.addInput(BitVecVar('P2', 8))
    syn.addInput(BitVecVar('P3', 8))
    # misc SFRs.
    syn.addInput(BitVecVar('PCON', 8))
    syn.addInput(BitVecVar('TCON', 8))
    syn.addInput(BitVecVar('TMOD', 8))
    syn.addInput(BitVecVar('TL0', 8))
    syn.addInput(BitVecVar('TH0', 8))
    syn.addInput(BitVecVar('TL1', 8))
    syn.addInput(BitVecVar('TH1', 8))
    syn.addInput(BitVecVar('SCON', 8))
    syn.addInput(BitVecVar('SBUF', 8))
    syn.addInput(BitVecVar('IE', 8))
    syn.addInput(BitVecVar('IP', 8))

def synthesize():
    syn = Synthesizer()
    create8051Inputs(syn)

    PC = syn.inp('PC')
    SP = syn.inp('SP')
    IRAM = syn.inp('IRAM')
    SP_plus1 = Add(SP, BitVecVal(1, 8))
    SP_minus1 = Sub(SP, BitVecVal(1, 8))
    mem_SP = ReadMem(IRAM, SP)
    mem_SP_plus1 = ReadMem(IRAM, SP_plus1)
    mem_SP_minus1 = ReadMem(IRAM, SP_minus1)
    
    opcode = syn.inp('opcode')
    op0 = Extract(7, 0, opcode)
    op1 = Extract(15, 8, opcode)

    PC_plus1 = Add(PC, BitVecVal(1, 16))
    PC_plus2 = Add(PC, BitVecVal(2, 16))
    PC_ajmp  = Concat(
                    Extract(15, 11, Choice('ajmp', op0, [PC, PC_plus2])),
                    ChooseConsecBits('ajmp_3bits', 3, opcode), 
                    ChooseConsecBits('ajmp_8bits', 8, opcode))
    PC_ret1 = Concat(mem_SP_minus1, mem_SP)
    PC_ret2 = Concat(mem_SP, mem_SP_plus1)
    PC_ret3 = Concat(mem_SP, mem_SP_minus1)
    PC_ret4 = Concat(mem_SP_plus1, mem_SP)
    PC_ret = Choice('SP_choice', 'op0', [PC_ret1, PC_ret2, PC_ret3, PC_ret4])

    nPC = Choice('nPC', op0, [PC_plus1, PC_plus2, PC_ajmp, PC_ret])
    syn.addOutput('PC', nPC)

    ACC = syn.inp('ACC')
    PSW = syn.inp('PSW')

    ACC_RR = RotateRight(ACC)
    ACC_RL = RotateLeft(ACC)
    ACC_RRC = Extract(8, 1, RotateRight(Concat(ACC, ChooseConsecBits('PSW_CY_bit', 1, PSW))))
    ACC_RLC = Extract(7, 0, RotateLeft(Concat(ChooseConsecBits('PSW_CY_bit', 1, PSW), ACC)))
    ACC_DEC = Sub(ACC, BitVecVal(1, 8))
    ACC_INC = Add(ACC, BitVecVal(1, 8))
    OP_IMM1 = Extract(15, 8,  opcode)
    OP_IMM2 = Extract(23, 16, opcode)
    ACC_ADD_IMM = Add(ACC, Choice('add_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]))
    ACC_ADDC_IMM = Add(ACC, Choice('addc_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]), ZeroExt(ChooseConsecBits('PSW_CY_bit', 1, PSW), 7))
    ACC_SUB_IMM = Sub(ACC, Choice('sub_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]))
    ACC_SUBB_IMM = Sub(Sub(ACC, Choice('subb_acc_imm_choice', op0, [OP_IMM1, OP_IMM2])), ZeroExt(ChooseConsecBits('PSW_CY_bit', 1, PSW), 7))

    nACC = Choice('nACC', op0, [   
            ACC_RR, 
            ACC_RL, 
            ACC_RRC, 
            ACC_RLC, 
            ACC_INC, 
            ACC_DEC, 
            ACC_ADD_IMM, 
            ACC_ADDC_IMM,
            ACC_SUB_IMM,
            ACC_SUBB_IMM])
    syn.addOutput('ACC', nACC)
    
    for opcode in [0x03, 0x04, 0x14, 0x24, 0x34, 0x13, 0x23, 0x33]:
        cnst = Equal(op0, BitVecVal(opcode, 8))
        print syn.synthesize('ACC', [cnst], eval8051)

    for opcode in [0, 1, 0x22, 0x22]: 
        cnst = Equal(op0, BitVecVal(opcode, 8))
        print syn.synthesize('PC', [cnst], eval8051)

if __name__ == '__main__':
    synthesize()

