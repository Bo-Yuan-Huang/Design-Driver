import sys
import itertools
import argparse

import ast
from synthesizer import Synthesizer
from xm8051sim import evalXMM, XMM

class XmemContext(object):
    def __init__(self, 
        xram, op, addrin, datain, 
        aes_state, aes_addr, aes_len, aes_ctr, aes_key0, aes_key1,
        aes_bytes_processed, aes_read_data, aes_enc_data, aes_func,
        sha_state, sha_rdaddr, sha_wraddr, sha_len,
        sha_bytes_processed, sha_read_data, sha_digest):

        self.xram = xram
        self.op = op
        self.addrin = addrin
        self.datain = datain

        self.aes_state = aes_state
        self.aes_addr = aes_addr
        self.aes_len = aes_len
        self.aes_ctr = aes_ctr
        self.aes_key0 = aes_key0
        self.aes_key1 = aes_key1
        self.aes_bytes_processed = aes_bytes_processed
        self.aes_read_data = aes_read_data
        self.aes_enc_data = aes_enc_data
        self.aes_func = aes_func

        self.sha_state = sha_state
        self.sha_rdaddr = sha_rdaddr
        self.sha_wraddr = sha_wraddr
        self.sha_len = sha_len
        self.sha_bytes_processed = sha_bytes_processed
        self.sha_read_data = sha_read_data
        self.sha_digest = sha_digest

def evalxmm(inputs, outputs):
    dataout = evalXMM(inputs['op'], inputs['addrin'], inputs['datain'], inputs, outputs)
    outputs['dataout'] = dataout

def createInputs(syn):
    xram = syn.addInput(ast.MemVar('xram', 16, 8))
    op = syn.addInput(ast.BitVecVar('op', 4))
    addrin = syn.addInput(ast.BitVecVar('addrin', 16))
    datain = syn.addInput(ast.BitVecVar('datain', 8))

    aes_state = syn.addInput(ast.BitVecVar('aes_state', 8))
    aes_addr = syn.addInput(ast.BitVecVar('aes_addr', 16))
    aes_len = syn.addInput(ast.BitVecVar('aes_len', 16))
    aes_ctr = syn.addInput(ast.BitVecVar('aes_ctr', 128))
    aes_key0 = syn.addInput(ast.BitVecVar('aes_key0', 128))
    aes_key1 = syn.addInput(ast.BitVecVar('aes_key1', 128))
    aes_bytes_processed = syn.addInput(ast.BitVecVar('aes_bytes_processed', 16))
    aes_read_data = syn.addInput(ast.BitVecVar('aes_read_data', 128))
    aes_enc_data = syn.addInput(ast.BitVecVar('aes_enc_data', 128))
    aes_func = syn.addInput(ast.FuncVar('aes_func', 256, 128))

    sha_state = syn.addInput(ast.BitVecVar('sha_state', 8))
    sha_rdaddr = syn.addInput(ast.BitVecVar('sha_rdaddr', 16))
    sha_wraddr = syn.addInput(ast.BitVecVar('sha_wraddr', 16))
    sha_len = syn.addInput(ast.BitVecVar('sha_len', 16))
    sha_bytes_processed = syn.addInput(ast.BitVecVar('sha_bytes_processed', 16))
    sha_read_data = syn.addInput(ast.BitVecVar('sha_read_data', 512))
    sha_digest = syn.addInput(ast.BitVecVar('sha_digest', 160))

    return XmemContext(
        xram=xram, op=op, addrin=addrin, datain=datain,
        aes_state=aes_state, aes_addr=aes_addr, aes_len=aes_len,
        aes_ctr=aes_ctr, aes_key0=aes_key0, aes_key1=aes_key1,
        aes_bytes_processed=aes_bytes_processed,
        aes_read_data=aes_read_data, aes_enc_data=aes_enc_data,
        aes_func=aes_func,
        sha_state=sha_state, sha_rdaddr=sha_rdaddr, sha_wraddr=sha_wraddr,
        sha_len=sha_len, sha_bytes_processed=sha_bytes_processed,
        sha_read_data=sha_read_data, sha_digest=sha_digest)

# a bunch of utility functions.
def lsb0(x): return ast.Concat(ast.Extract(15, 1, x), ast.BitVecVal(0, 1))
def lsn0(x): return ast.Concat(ast.Extract(15, 4, x), ast.BitVecVal(0, 4))

def rd2byte(addr, reg):
    return ast.If(ast.Equal(ast.Extract(0, 0, addr), ast.BitVecVal(0, 1)),
                        ast.Extract(7, 0, reg),
                        ast.Extract(15, 8, reg))

def wr2byte(addr, reg, val):
    return ast.If(ast.Equal(ast.Extract(0, 0, addr), ast.BitVecVal(0, 1)),
                    ast.Concat(ast.Extract(15, 8, reg), val),
                    ast.Concat(val, ast.Extract(7, 0, reg)))

def rd16byte(addr, reg):
    addr_ = ast.Extract(3, 0, addr)
    return ast.If(ast.Equal(addr_, ast.BitVecVal(0, 4)), ast.Extract(7, 0, reg),
                ast.If(ast.Equal(addr_, ast.BitVecVal(1, 4)), ast.Extract(15, 8, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(2, 4)), ast.Extract(23, 16, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(3, 4)), ast.Extract(31, 24, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(4, 4)), ast.Extract(39, 32, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(5, 4)), ast.Extract(47, 40, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(6, 4)), ast.Extract(55, 48, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(7, 4)), ast.Extract(63, 56, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(8, 4)), ast.Extract(71, 64, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(9, 4)), ast.Extract(79, 72, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(10, 4)), ast.Extract(87, 80, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(11, 4)), ast.Extract(95, 88, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(12, 4)), ast.Extract(103, 96, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(13, 4)), ast.Extract(111, 104, reg),            
                ast.If(ast.Equal(addr_, ast.BitVecVal(14, 4)), ast.Extract(119, 112, reg),            
                ast.Extract(127, 120, reg))))))))))))))))

def wr16byte(addr, reg, val):
    addr_ = ast.Extract(3, 0, addr)
    return ast.If(ast.Equal(addr_, ast.BitVecVal(0, 4)), ast.Concat(ast.Extract(127, 8, reg), val),
                ast.If(ast.Equal(addr_, ast.BitVecVal(1, 4)), ast.Concat(ast.Extract(127, 16, reg), val, ast.Extract(7, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(2, 4)), ast.Concat(ast.Extract(127, 24, reg), val, ast.Extract(15, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(3, 4)), ast.Concat(ast.Extract(127, 32, reg), val, ast.Extract(23, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(4, 4)), ast.Concat(ast.Extract(127, 40, reg), val, ast.Extract(31, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(5, 4)), ast.Concat(ast.Extract(127, 48, reg), val, ast.Extract(39, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(6, 4)), ast.Concat(ast.Extract(127, 56, reg), val, ast.Extract(47, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(7, 4)), ast.Concat(ast.Extract(127, 64, reg), val, ast.Extract(55, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(8, 4)), ast.Concat(ast.Extract(127, 72, reg), val, ast.Extract(63, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(9, 4)), ast.Concat(ast.Extract(127, 80, reg), val, ast.Extract(71, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(10, 4)), ast.Concat(ast.Extract(127, 88, reg), val, ast.Extract(79, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(11, 4)), ast.Concat(ast.Extract(127, 96, reg), val, ast.Extract(87, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(12, 4)), ast.Concat(ast.Extract(127, 104, reg), val, ast.Extract(95, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(13, 4)), ast.Concat(ast.Extract(127, 112, reg), val, ast.Extract(103, 0, reg)),
                ast.If(ast.Equal(addr_, ast.BitVecVal(14, 4)), ast.Concat(ast.Extract(127, 120, reg), val, ast.Extract(111, 0, reg)),
                ast.Concat(val, ast.Extract(119, 0, reg)))))))))))))))))

# The AES model.
def modelAES(syn, rd_en, wr_en, xmem):
    # addresses for the regs
    aes_start_addr = ast.BVInRange('aes_start_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_state_addr = ast.BVInRange('aes_state_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_opaddr_addr = ast.BVInRange('aes_opaddr_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_len_addr = ast.BVInRange('aes_len_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_ctr_addr = ast.BVInRange('aes_ctr_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_key0_addr = ast.BVInRange('aes_key0_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    aes_key1_addr = ast.BVInRange('aes_key1_addr', ast.BitVecVal(0xff00, 16), ast.BitVecVal(0xff39, 16))
    in_aes_range = ast.And(ast.ULE(ast.BitVecVal(0xff00, 16), xmem.addrin),
                           ast.ULT(xmem.addrin, ast.BitVecVal(0xff40, 16)))

    # since we're using uninterpreted functions; the synthesis needs help in distinguishing
    # between the key and counter registers.
    syn.addConstraint(ast.ULT(aes_ctr_addr, aes_key0_addr))
    syn.addConstraint(ast.ULT(aes_key0_addr, aes_key1_addr))
    syn.addConstraint(ast.Equal(ast.Extract(7, 2, xmem.aes_state), ast.BitVecVal(0, 6)))

    # predicates on the current state.
    AES_IDLE = ast.BitVecVal(0, 8)
    AES_READ = ast.BitVecVal(1, 8)
    AES_OP   = ast.BitVecVal(2, 8)
    AES_WRITE= ast.BitVecVal(3, 8)
     
    aes_state_idle  = ast.Equal(xmem.aes_state, AES_IDLE)

    # should we take a step this cycle?
    aes_step = ast.Equal(ast.ChooseConsecBits('aes_step', 1, xmem.op), ast.BitVecVal(1, 1))
    # should we write to a register or just ignore the write?
    aes_wr_en = ast.And(wr_en, aes_state_idle)

    # what register is selected for reading/writing?
    aes_start_sel = ast.Equal(aes_start_addr, xmem.addrin)
    aes_state_sel = ast.Equal(aes_state_addr, xmem.addrin)
    aes_opaddr_sel = ast.Equal(aes_opaddr_addr, lsb0(xmem.addrin))
    aes_len_sel = ast.Equal(aes_len_addr, lsb0(xmem.addrin))
    aes_ctr_sel = ast.Equal(aes_ctr_addr, lsn0(xmem.addrin))
    aes_key0_sel = ast.Equal(aes_key0_addr, lsn0(xmem.addrin))
    aes_key1_sel = ast.Equal(aes_key1_addr, lsn0(xmem.addrin))

    # what register is being read?
    aes_state_sel_rd = ast.And(aes_state_sel, rd_en)
    aes_opaddr_sel_rd = ast.And(aes_opaddr_sel, rd_en)
    aes_len_sel_rd = ast.And(aes_len_sel, rd_en)
    aes_ctr_sel_rd = ast.And(aes_ctr_sel, rd_en)
    aes_key0_sel_rd = ast.And(aes_key0_sel, rd_en)
    aes_key1_sel_rd = ast.And(aes_key1_sel, rd_en)

    # what register is beig written?
    aes_state_sel_wr = ast.And(aes_state_sel, aes_wr_en)
    aes_opaddr_sel_wr = ast.And(aes_opaddr_sel, aes_wr_en)
    aes_len_sel_wr = ast.And(aes_len_sel, aes_wr_en)
    aes_ctr_sel_wr = ast.And(aes_ctr_sel, aes_wr_en)
    aes_key0_sel_wr = ast.And(aes_key0_sel, aes_wr_en)
    aes_key1_sel_wr = ast.And(aes_key1_sel, aes_wr_en)


    # output data for a read.
    aes_state_out = xmem.aes_state
    aes_opaddr_out = rd2byte(xmem.addrin, xmem.aes_addr)
    aes_len_out = rd2byte(xmem.addrin, xmem.aes_len)
    aes_ctr_out = rd16byte(xmem.addrin, xmem.aes_ctr)
    aes_key0_out = rd16byte(xmem.addrin, xmem.aes_key0)
    aes_key1_out = rd16byte(xmem.addrin, xmem.aes_key1)
    aes_dataout = ast.If(aes_state_sel_rd, aes_state_out,
                    ast.If(aes_opaddr_sel_rd, aes_opaddr_out,
                    ast.If(aes_len_sel_rd, aes_len_out,
                    ast.If(aes_ctr_sel_rd, aes_ctr_out,
                    ast.If(aes_key0_sel_rd, aes_key0_out,
                    ast.If(aes_key1_sel_rd, aes_key1_out,
                    ast.BitVecVal(0, 8)))))))

    # register update for a write
    xmem.aes_addr_next = ast.Choice('aes_next', xmem.aes_state, [ast.If(aes_opaddr_sel_wr, wr2byte(xmem.addrin, xmem.aes_addr, xmem.datain), xmem.aes_addr), xmem.aes_addr])
    xmem.aes_len_next = ast.Choice('aes_next', xmem.aes_state, [ast.If(aes_len_sel_wr, wr2byte(xmem.addrin, xmem.aes_len, xmem.datain), xmem.aes_len), xmem.aes_len])
    xmem.aes_ctr_next = ast.Choice('aes_next', xmem.aes_state, [ast.If(aes_ctr_sel_wr, wr16byte(xmem.addrin, xmem.aes_ctr, xmem.datain), xmem.aes_ctr), xmem.aes_ctr])
    xmem.aes_key0_next = ast.Choice('aes_next', xmem.aes_state, [ast.If(aes_key0_sel_wr, wr16byte(xmem.addrin, xmem.aes_key0, xmem.datain), xmem.aes_key0), xmem.aes_key0])
    xmem.aes_key1_next = ast.Choice('aes_next', xmem.aes_state, [ast.If(aes_key1_sel_wr, wr16byte(xmem.addrin, xmem.aes_key1, xmem.datain), xmem.aes_key1), xmem.aes_key1])

    # are we going to start the operation in the next cycle?
    aes_start_next = ast.And(ast.Equal(ast.Extract(0, 0, xmem.datain), ast.BitVecVal(1,1)), 
                             aes_wr_en, aes_start_sel)

    # how many bytes have we eaten?
    aes_bytes_processed_next_1 = ast.If(aes_start_next, ast.BitVecVal(0, 16), xmem.aes_bytes_processed)
    aes_bytes_processed_next_2 = ast.If(aes_step, ast.Add(xmem.aes_bytes_processed, ast.BitVecVal(16, 16)),
                                        xmem.aes_bytes_processed)
    xmem.aes_bytes_processed_next = ast.Choice('aes_bytes_processed_next', xmem.aes_state, 
                                                [aes_bytes_processed_next_1, 
                                                 aes_bytes_processed_next_2, 
                                                 xmem.aes_bytes_processed])

    # read data to be processed.
    aes_read_data_array = []
    for i in xrange(16):
        aes_read_data_array.append(
            ast.ReadMem(xmem.xram, 
                ast.Add(xmem.aes_addr, 
                    ast.Add(xmem.aes_bytes_processed, ast.BitVecVal(i, 16)))))
    # reverse the damn thing because we want MSB first.
    aes_read_data_array = aes_read_data_array[::-1]

    aes_read_data_next_1 = ast.If(aes_step, ast.Concat(*aes_read_data_array), xmem.aes_read_data)
    xmem.aes_read_data_next = ast.Choice('aes_read_data_next', xmem.aes_state, 
                                            [aes_read_data_next_1, xmem.aes_read_data])

    # encrypt data.
    aes_func_inp = ast.Concat(xmem.aes_ctr, xmem.aes_read_data)
    aes_func_out = ast.Apply(xmem.aes_func, aes_func_inp)
    aes_enc_data_next_1 = ast.If(aes_step, aes_func_out, xmem.aes_enc_data)
    xmem.aes_enc_data_next = ast.Choice('aes_enc_data_next', xmem.aes_state,
                                            [aes_enc_data_next_1, xmem.aes_enc_data])
    # write data
    aes_write_xram = xmem.xram
    for i in xrange(16):
        aes_write_xram = ast.WriteMem(
            aes_write_xram, 
            ast.Add(xmem.aes_addr, ast.Add(xmem.aes_bytes_processed, ast.BitVecVal(i, 16))),
            ast.Extract(i*8+7, i*8, xmem.aes_enc_data))
    xram_next = ast.If(aes_step, aes_write_xram, xmem.xram)
    xmem.xram = ast.Choice('xram_next', xmem.aes_state, [xram_next, xmem.xram])

    # next state computation.
    aes_state_idle_next = ast.If(aes_start_next, AES_READ, AES_IDLE)
    aes_state_read_next = ast.If(aes_step, AES_OP, AES_READ)
    aes_state_op_next = ast.If(aes_step, AES_WRITE, AES_OP)
    aes_state_write_next = ast.If(aes_step, 
                                ast.If(ast.ULT(xmem.aes_bytes_processed_next, xmem.aes_len),
                                    AES_READ,
                                    AES_IDLE),
                                AES_WRITE)

    xmem.aes_state_next = ast.Choice('aes_state_next', xmem.aes_state, 
                                                    [aes_state_idle_next, 
                                                     aes_state_read_next, 
                                                     aes_state_op_next, 
                                                     aes_state_write_next])
    return in_aes_range, aes_dataout

def modelSHA():
    # addresses for the regs.
    sha_start_addr = ast.BVInRange('sha_start_addr', ast.BitVecVal(0xfe00, 16), ast.BitVecVal(0xfe0f, 16))
    sha_state_addr = ast.BVInRange('sha_state_addr', ast.BitVecVal(0xfe00, 16), ast.BitVecVal(0xfe0f, 16))
    sha_rdaddr_addr = ast.BVInRange('sha_rdaddr_addr', ast.BitVecVal(0xfe00, 16), ast.BitVecVal(0xfe0f, 16))
    sha_wraddr_addr = ast.BVInRange('sha_wraddr_addr', ast.BitVecVal(0xfe00, 16), ast.BitVecVal(0xfe0f, 16))
    sha_len_addr = ast.BVInRange('sha_len_addr', ast.BitVecVal(0xfe00, 16), ast.BitVecVal(0xfe0f, 16))
    in_sha_range = ast.And(ast.ULE(ast.BitVecVal(0xfe00, 16), xmem.addrin),
                           ast.ULT(xmem.addrin, ast.BitVecVal(0xfe10, 16)))

    
def synthesize(state, log, output, verbosity, unsat_core):
    syn = Synthesizer()
    xmem = createInputs(syn)

    c1 = ast.Or(ast.ULT(xmem.addrin, ast.BitVecVal(0xFE00, 16)), ast.UGT(xmem.addrin, ast.BitVecVal(0xFE40, 16)))
    c2 = ast.Not(ast.Equal(xmem.addrin, ast.BitVecVal(0xFF00, 16)))
    c3 = ast.Equal(ast.Extract(1, 1, xmem.op), ast.BitVecVal(0, 1))
    syn.addConstraint(ast.And(c1, c2, c3))

    # common signals.
    mem_op_bits = ast.ChooseConsecBits('mem_op_bits', 2, xmem.op)
    rd_op = ast.BVInRange('mem_rd_op', ast.BitVecVal(0, 2), ast.BitVecVal(3, 2))
    wr_op = ast.BVInRange('mem_wr_op', ast.BitVecVal(0, 2), ast.BitVecVal(3, 2))
    rd_en = ast.Equal(mem_op_bits, rd_op)
    wr_en = ast.Equal(mem_op_bits, wr_op)

    # aes.
    in_aes_range, aes_dataout = modelAES(syn, rd_en, wr_en, xmem)

    # model for the xram.
    xram_dataout = ast.If(rd_en, ast.ReadMem(xmem.xram, xmem.addrin), ast.BitVecVal(0, 8))
    xram = ast.If(ast.And(wr_en, ast.Not(in_aes_range)), 
                ast.WriteMem(xmem.xram, xmem.addrin, xmem.datain), 
                xmem.xram)


    # combine everything.
    xmem.dataout = ast.If(in_aes_range, aes_dataout, xram_dataout)
    xmem.xram = xram

    syn.addOutput('dataout', xmem.dataout, Synthesizer.BITVEC)
    syn.addOutput('xram', xmem.xram, Synthesizer.MEM)
    syn.addOutput('aes_addr', xmem.aes_addr_next, Synthesizer.BITVEC)
    syn.addOutput('aes_len', xmem.aes_len_next, Synthesizer.BITVEC)
    syn.addOutput('aes_ctr', xmem.aes_ctr_next, Synthesizer.BITVEC)
    syn.addOutput('aes_key0', xmem.aes_key0_next, Synthesizer.BITVEC)
    syn.addOutput('aes_key1', xmem.aes_key1_next, Synthesizer.BITVEC)
    syn.addOutput('aes_bytes_processed', xmem.aes_bytes_processed_next, Synthesizer.BITVEC)
    syn.addOutput('aes_read_data', xmem.aes_read_data_next, Synthesizer.BITVEC)
    syn.addOutput('aes_enc_data', xmem.aes_enc_data_next, Synthesizer.BITVEC)
    syn.addOutput('aes_state', xmem.aes_state_next, Synthesizer.BITVEC)

    if log == 'STDOUT':
        syn.logfile = sys.stdout
    elif log:
        syn.logfile = open(log, 'wt')
    syn.VERBOSITY = verbosity
    syn.unsat_core = unsat_core

    # syn.unsat_core = True

    aes_state = state & 0x3
    sha_state = (state & 0xc) >> 2

    param = ast.And(ast.Equal(xmem.aes_state, ast.BitVecVal(aes_state, 8)),
                    ast.Equal(xmem.sha_state, ast.BitVecVal(sha_state, 8)))

    states = [
        'dataout', 'xram', 'aes_addr', 'aes_len',
        'aes_ctr', 'aes_key0', 'aes_key1',
        'aes_bytes_processed', 'aes_read_data', 'aes_state'
    ]
    asts = syn.synthesize(states, [param], evalxmm)

    for a, s in itertools.izip(asts, states):
        print '\n%s\n' % s
        print str(a)

def auto_int(x): return int(x, 0)
def main():
    parser = argparse.ArgumentParser(description='8051 XRAM+crypto synthesizer')
    parser.add_argument("--log", help="log file name")
    parser.add_argument("--verbosity", help="verbosity", type=int, default=0)
    parser.add_argument("--unsat_core", help="generate UNSAT core?", type=int, default=0)
    parser.add_argument("--output", help='Pickled AST output.', default='')
    parser.add_argument("state", help="param", type=auto_int)
    args = parser.parse_args()

    print 'state : (%d,%d)' % (args.state & 0x3, (args.state & 0xc) >> 2)
    synthesize(args.state, args.log, args.output, args.verbosity, args.unsat_core)

if __name__ == '__main__':
    main()

