from ast import *
import sys
import argparse

from synthesizer import Synthesizer

def alu_sim(inputs, outputs):
    r0 = inputs['r0']
    r1 = inputs['r1']

    regs = [r0, r1]
     
    opcode = inputs['opcode']
    op = opcode & 1
    ra = (opcode >> 1) & 1

    if op == 0:
        regs[0] = (regs[0] + regs[ra]) & 0xFF
    else:
        regs[0] = (regs[0] - regs[ra]) & 0xFF

    outputs['r0'] = regs[0]
    outputs['r1'] = regs[1]


def synthesize(opc):
    syn = Synthesizer()
    syn.addInput(BitVecVar('r0', 8))
    syn.addInput(BitVecVar('r1', 8))
    syn.addInput(BitVecVar('opcode', 2))

    r0 = syn.inp('r0')
    r1 = syn.inp('r1')
    opcode = syn.inp('opcode')

    ra = Choice('ra', None, [r0, r1])

    add_r = Add(r0, ra)
    sub_r = Sub(r0, ra)

    r0_next = Choice('r0_next', None, [add_r, sub_r])
    syn.addOutput('r0', r0_next, Synthesizer.BITVEC)
    syn.debug(vb=2, lf=sys.stdout, uc=True)

    cnst = Equal(opcode, BitVecVal(opc, 2))
    r = syn.synthesize(['r0'], [cnst], alu_sim)
    print str(r[0])
    print '-'*40

for i in xrange(4):
    synthesize(i)

