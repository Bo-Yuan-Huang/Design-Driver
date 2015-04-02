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
        data.append(n)
    return data

def from_byte_array(bs):
    n = 0
    for b in bs:
        n = (n << 8) | b
    return n

def evalAES(sim_inputs, sim_outputs):
    inputs = {}
    for (k,v) in sim_inputs.iteritems():
        if k == 'ctr' or k == 'key':
            inputs[k] = to_byte_array(v, 16)
        else:
            inputs[k] = v

    sin = AesState(**inputs)
    data_out, sout = eval_aes(sin)

    for k in sout._fields:
        v = getattr(sout, k)
        if k == 'ctr' or k == 'key':
            sim_outputs[k] = from_byte_array(v)
        else:
            sim_outputs[k] = v

def write2byteReg(wr, addr, reg, REG_ADDR, data_in):
    addr16 = Concat(Extract(15, 1, addr), BitVecVal(0, 1))
    hi_byte = Equal(Extract(0, 0, addr), BitVecVal(1, 1))

    reg_out = If(And(wr, Equal(addr16, REG_ADDR)),
                    If(hi_byte, Concat(data_in, Extract(7, 0, reg)),
                                Concat(Extract(15, 8, reg), data_in)),
                    reg)
    return reg_out                

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

    REG_LEN_ADDR = Choice('REG_LEN_ADDR', state, addrlist)
    REG_ADDR_ADDR = Choice('REG_ADDR_ADDR', state, addrlist)

    nop = Equal(op, BitVecVal(0, 2))
    rd = Equal(op, BitVecVal(1, 2))
    can_write = Choice('can_write', state, [BoolVal(0), BoolVal(1)])
    wr = And(can_write, Equal(op, BitVecVal(2, 2)))

    addr_out = write2byteReg(wr, addr_in, addr, REG_ADDR_ADDR, data_in)
    length_out = write2byteReg(wr, addr_in, length, REG_LEN_ADDR, data_in)
                  
    syn.addOutput('addr', addr_out, Synthesizer.BITVEC)
    syn.addOutput('length', length_out, Synthesizer.BITVEC)

    cnst = Equal(state, BitVecVal(st, 1))
    return syn.synthesize(['addr', 'length'], [cnst], evalAES)

for st in xrange(2):
    r = synAES(st)
    print 'state: %d' % st
    print '\n'.join(str(s) for s in r), '\n'
