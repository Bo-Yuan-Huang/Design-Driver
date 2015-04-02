from ast import *
from synthesizer import Synthesizer

import argparse

def createInputs(syn):
    #'state', 'addr', 'length', 'num_op_bytes', 'block_ctr',
    #'ctr', 'key', 'xram', 'op', 'addr_in', 'data_in'
    syn.addInput(BitVecVar('state', 1))
    syn.addInput(BitVecVar('addr', 16))
    syn.addInput(BitVecVar('length', 16))
    syn.addInput(BitVecVar('num_op_bytes', 16))

syn = Synthesizer()
createInputs(syn)

