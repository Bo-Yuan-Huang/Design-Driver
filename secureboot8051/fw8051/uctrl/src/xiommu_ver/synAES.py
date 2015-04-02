from ast import *
from synthesizer import Synthesizer
from aes_eval import AesState, eval_aes
import argparse

def createInputs(syn):
    #'state', 'addr', 'length', 'num_op_bytes', 'block_ctr',
    #'ctr', 'key', 'xram', 'op', 'addr_in', 'data_in'
    syn.addInput(BitVecVar('state', 1))
    syn.addInput(BitVecVar('addr', 16))
    syn.addInput(BitVecVar('length', 16))
    syn.addInput(BitVecVar('num_op_bytes', 16))
    syn.addInput(BitVecVar('block_ctr', 16))
    syn.addInput(BitVecVar('ctr', 128))
    syn.addInput(BitVecVar('key', 128))
    syn.addInput(MemVar('xram', 16, 8))
    syn.addInput(BitVecVar('op', 2))
    syn.addInput(BitVecVar('addr_in', 16))
    syn.addInput(BitVecVar('data_in', 8))

def to_byte_array(l, num_bytes):
    data = []
    for i in xrange(num_bytes):
        n = (l >> (i*8)) & 0xFF
        data.append(i)
    return data

def evalAES(sim_inputs, sim_outputs):
    inputs = {}
    for (k,v) in sim_inputs.iteritems():
        if k == 'ctr' or k == 'key':
            inputs[k] = to_byte_array(v, 16)
        else:
            inputs[k] = v

    sin = AesState(**inputs)
    print sin
    data_out, sout = eval_aes(sin)
    print data_out
    sim_outputs['addr'] = sout.addr

def synAES(st):
    syn = Synthesizer()
    createInputs(syn)

    state = syn.inp('state')
    addr = syn.inp('addr')
    length = syn.inp('length')
    num_op_bytes = syn.inp('num_op_bytes')
    block_ctr = syn.inp('block_ctr')
    ctr = syn.inp('ctr')
    key = syn.inp('key')
    xram = syn.inp('xram')
    op = syn.inp('op')
    addr_in = syn.inp('addr_in')
    data_in = syn.inp('data_in')

    addrlist = [BitVecVal(x, 16) for x in [0xFF00, 0xFF01, 0xFF02, 0xFF04, 0xFF10, 0xFF20]]

    REG_ADDR_ADDR = Choice('REG_ADDR_ADDR', state, addrlist)

    can_write = Choice('can_write', state, [BoolVal(0), BoolVal(1)])
    addr_8b = addr
    addr_16b = Concat(Extract(15, 1, addr), BitVecVal(0, 1))
    addr_128b = Concat(Extract(15, 4, addr), BitVecVal(0, 4))

    nop = Equal(op, BitVecVal(0, 2))
    rd = Equal(op, BitVecVal(1, 2))
    wr = And(can_write, Equal(op, BitVecVal(2, 2)))

    lo_byte = Equal(Extract(0, 0, addr), BitVecVal(0, 1))
    hi_byte = Equal(Extract(0, 0, addr), BitVecVal(1, 1))

    addr_out = If(And(wr, And(lo_byte, Equal(addr_16b, REG_ADDR_ADDR))),
                    Concat(Extract(15, 8, addr), data_in), 
                    If(And(wr, And(hi_byte, Equal(addr_16b, REG_ADDR_ADDR))),
                        Concat(data_in, Extract(7, 0, data_in)),
                        addr))
                  
    syn.addOutput('addr', addr_out, Synthesizer.BITVEC)
    cnst = Equal(state, BitVecVal(st, 1))
    return syn.synthesize(['addr'], [cnst], evalAES)

[data_out_0] = synAES(0)
[data_out_1] = synAES(1)
print str(data_out_0)
print str(data_out_1)
