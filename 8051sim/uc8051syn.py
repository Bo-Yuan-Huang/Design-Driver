from synthesizer import Synthesizer
from ast import *
from sim51 import evalState

def eval8051(inputs, outputs):
    # initialize input state.
    regs = [0] * 384
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
    syn.addInput(BitVecVar('PSW', 8))
    syn.addInput(BitVecVar('ACC', 8))
    syn.addInput(BitVecVar('SP', 8))
    syn.addInput(BitVecVar('DPL', 8))
    syn.addInput(BitVecVar('DPH', 8))
    syn.addInput(BitVecVar('PC', 16))
    syn.addInput(BitVecVar('opcode', 24))

def synthesize():
    syn = Synthesizer()
    create8051Inputs(syn)

    PCp1 = Add(syn.inp('PC'), BitVecVal(1, 16))
    PCp2 = Add(syn.inp('PC'), BitVecVal(2, 16))
    op0 = Extract(7, 0, syn.inp('opcode'))
    nPC = Choice('nPC', op0, [PCp1, PCp2])
    syn.addOutput('PC', nPC)
    
    cnst = Equal(op0, BitVecVal(0, 8))

    for opcode in [0]:
        cnst = Equal(op0, BitVecVal(0, 8))
        print syn.synthesize('PC', [cnst], eval8051)

if __name__ == '__main__':
    synthesize()

