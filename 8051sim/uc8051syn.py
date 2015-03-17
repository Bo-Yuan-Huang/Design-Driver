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
    regs[0x80 + 0x80] = inputs['P0']
    regs[0x80 + 0x87] = inputs['PCON']
    regs[0x80 + 0x88] = inputs['TCON']
    regs[0x80 + 0x89] = inputs['TMOD']
    regs[0x80 + 0x8A] = inputs['TL0'] 
    regs[0x80 + 0x8C] = inputs['TH0'] 
    regs[0x80 + 0x8B] = inputs['TL1'] 
    regs[0x80 + 0x8D] = inputs['TH1'] 
    regs[0x80 + 0x90] = inputs['P1']  
    regs[0x80 + 0x98] = inputs['SCON']
    regs[0x80 + 0x99] = inputs['SBUF']
    regs[0x80 + 0xA0] = inputs['P2']  
    regs[0x80 + 0xA8] = inputs['IE']  
    regs[0x80 + 0xB0] = inputs['P3']  
    regs[0x80 + 0xB8] = inputs['IP']  
    regs[0x80 + 0xF0] = inputs['B']   

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
    outputs['P0']   = newRegs[0x80 + 0x80]
    outputs['PCON'] = newRegs[0x80 + 0x87]
    outputs['TCON'] = newRegs[0x80 + 0x88]
    outputs['TMOD'] = newRegs[0x80 + 0x89]
    outputs['TL0']  = newRegs[0x80 + 0x8A]
    outputs['TH0']  = newRegs[0x80 + 0x8C]
    outputs['TL1']  = newRegs[0x80 + 0x8B]
    outputs['TH1']  = newRegs[0x80 + 0x8D]
    outputs['P1']   = newRegs[0x80 + 0x90]
    outputs['SCON'] = newRegs[0x80 + 0x98]
    outputs['SBUF'] = newRegs[0x80 + 0x99]
    outputs['P2']   = newRegs[0x80 + 0xA0]
    outputs['IE']   = newRegs[0x80 + 0xA8]
    outputs['P3']   = newRegs[0x80 + 0xB0]
    outputs['IP']   = newRegs[0x80 + 0xB8]
    outputs['B']    = newRegs[0x80 + 0xF0]

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

class DirectIRAMRead(Node):
    "Perform a direct read from the 8051 IRAM."
    DIR_IRAM_READ = Node.NODE_TYPE_MAX+1

    def __init__(self, syn, iram, addr):
        if addr.width != 8:
            raise ValueError, "Address width must be 8."
        if iram.dwidth != 8:
            raise ValueError, "IRAM width must also be 8."

        Node.__init__(self, self.DIR_IRAM_READ)
        self.mem = iram
        self.addr = addr
        self.width = iram.dwidth
        self.syn = syn
         
    def _toZ3(self, prefix):
        mz3 = self.mem.toZ3(prefix)
        az3 = self.addr.toZ3(prefix)

        msb0 = z3.Extract(7, 7, az3) == z3.BitVecVal(0, 1)
        return z3.If(msb0, mz3[az3],
            z3.If(az3 == z3.BitVecVal(0x80, 8), self.syn.inp('P0').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x81, 8), self.syn.inp('SP').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x82, 8), self.syn.inp('DPL').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x83, 8), self.syn.inp('DPH').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x87, 8), self.syn.inp('PCON').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x88, 8), self.syn.inp('TCON').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x89, 8), self.syn.inp('TMOD').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x8A, 8), self.syn.inp('TL0').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x8C, 8), self.syn.inp('TH0').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x8B, 8), self.syn.inp('TL1').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x8D, 8), self.syn.inp('TH1').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x90, 8), self.syn.inp('P1').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x98, 8), self.syn.inp('SCON').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0x99, 8), self.syn.inp('SBUF').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xA0, 8), self.syn.inp('P2').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xA8, 8), self.syn.inp('IE').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xB0, 8), self.syn.inp('P3').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xB8, 8), self.syn.inp('IP').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xD0, 8), self.syn.inp('PSW').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xE0, 8), self.syn.inp('ACC').toZ3(prefix),
            z3.If(az3 == z3.BitVecVal(0xF0, 8), self.syn.inp('B').toZ3(prefix),
            z3.BitVecVal(0, 8)))))))))))))))))))))))

    def _toZ3Constraints(self, prefix, m):
        assert self.mem.isMemVar()
        mem_values_full = m[self.mem.name]
        awidth = self.mem.awidth
        dwidth = self.mem.dwidth

        az3 = self.addr.toZ3Constraints(prefix, m)
        if self.syn.VERBOSITY >= 4:
            self.syn.log('az3:' + z3.simplify(az3).sexpr())
        
        mem_values = []
        for [a,d] in mem_values_full[:-1]:
            # test if MSB is set:
            if (a & 0x80) == 0:
                mem_values.append([a,d])
        mem_values.append(mem_values_full[-1])
        def createIf(i):
            if i == len(mem_values) - 1:
                return z3.BitVecVal(mem_values[i], dwidth)
            else:
                [addri, datai] = mem_values[i]
                aiz3 = z3.BitVecVal(addri, awidth)
                diz3 = z3.BitVecVal(datai, dwidth)
                return z3.If(aiz3 == az3, diz3, createIf(i+1))
        expr1 = createIf(0)
        if self.syn.VERBOSITY >= 4:
            self.syn.log('mem_values_full:' + repr(mem_values_full))
            self.syn.log('mem_values:' + repr(mem_values))
            self.syn.log('expr1_o:' + expr1.sexpr())
            self.syn.log('expr1_s:' + z3.simplify(expr1).sexpr())
            self.syn.log('p0:' + self.syn.inp('P0').toZ3Constraints(prefix, m).sexpr())
        msb0 = z3.Extract(7, 7, az3) == z3.BitVecVal(0, 1)
        expr2 = z3.If(msb0, expr1,
            z3.If(az3 == z3.BitVecVal(0x80, 8), self.syn.inp('P0').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x81, 8), self.syn.inp('SP').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x82, 8), self.syn.inp('DPL').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x83, 8), self.syn.inp('DPH').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x87, 8), self.syn.inp('PCON').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x88, 8), self.syn.inp('TCON').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x89, 8), self.syn.inp('TMOD').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x8A, 8), self.syn.inp('TL0').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x8C, 8), self.syn.inp('TH0').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x8B, 8), self.syn.inp('TL1').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x8D, 8), self.syn.inp('TH1').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x90, 8), self.syn.inp('P1').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x98, 8), self.syn.inp('SCON').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0x99, 8), self.syn.inp('SBUF').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xA0, 8), self.syn.inp('P2').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xA8, 8), self.syn.inp('IE').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xB0, 8), self.syn.inp('P3').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xB8, 8), self.syn.inp('IP').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xD0, 8), self.syn.inp('PSW').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xE0, 8), self.syn.inp('ACC').toZ3Constraints(prefix, m),
            z3.If(az3 == z3.BitVecVal(0xF0, 8), self.syn.inp('B').toZ3Constraints(prefix, m),
            z3.BitVecVal(0, 8)))))))))))))))))))))))
        if self.syn.VERBOSITY >= 4:
            self.syn.log('expr2_s:' + z3.simplify(expr2).sexpr())
        return expr2

    def __str__(self):
        return '(read-direct %s %s)' % (str(self.mem), str(self.addr))

    def synthesize(self, m):
        return DirectIRAMRead(self.syn, self.mem.synthesize(m), self.addr.synthesize(m))

    def childObjects(self):
        yield self.mem
        yield self.addr
        yield self.syn.inp('P0')
        yield self.syn.inp('SP')
        yield self.syn.inp('DPL')
        yield self.syn.inp('DPH')
        yield self.syn.inp('PCON')
        yield self.syn.inp('TCON')
        yield self.syn.inp('TMOD')
        yield self.syn.inp('TL0')
        yield self.syn.inp('TH0')
        yield self.syn.inp('TL1')
        yield self.syn.inp('TH1')
        yield self.syn.inp('P1')
        yield self.syn.inp('SCON')
        yield self.syn.inp('SBUF')
        yield self.syn.inp('P2')
        yield self.syn.inp('IE')
        yield self.syn.inp('P3')
        yield self.syn.inp('IP')
        yield self.syn.inp('PSW')
        yield self.syn.inp('ACC')
        yield self.syn.inp('B')

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

    ACC = syn.inp('ACC')
    PSW = syn.inp('PSW')
    DPL = syn.inp('DPL')
    DPH = syn.inp('DPH')
    DPTR = Concat(DPH, DPL)

    CY = ChooseConsecBits('PSW_CY_bit', 1, PSW)

    # registers.
    Rbank = ChooseConsecBits('Rbank_bits', 2, PSW)
    Rx = []
    for i in xrange(8):
        Rx.append(ReadMem(IRAM, Concat(BitVecVal(0, 3), Rbank, BitVecVal(i, 3))))
    assert len(Rx) == 8
    
    opcode = syn.inp('opcode')
    op0 = Extract(7, 0, opcode)
    op1 = Extract(15, 8, opcode)
    op2 = Extract(23, 16, opcode)

    PC_plus1 = Add(PC, BitVecVal(1, 16))
    PC_plus2 = Add(PC, BitVecVal(2, 16))
    PC_plus3 = Add(PC, BitVecVal(3, 16))
    PC_rel1 = Add(Choice('PC_rel1_base', op0, [PC, PC_plus1, PC_plus2, PC_plus3]), SignExt(op1, 8))
    PC_rel2 = Add(Choice('PC_rel2_base', op0, [PC, PC_plus1, PC_plus2, PC_plus3]), SignExt(op2, 8))

    PC_ajmp  = Concat(
                    Extract(15, 11, Choice('ajmp', op0, [PC, PC_plus2])),
                    ChooseConsecBits('ajmp_3bits', 3, opcode), 
                    ChooseConsecBits('ajmp_8bits', 8, opcode))
    PC_ret1 = Concat(mem_SP_minus1, mem_SP)
    PC_ret2 = Concat(mem_SP, mem_SP_plus1)
    PC_ret3 = Concat(mem_SP, mem_SP_minus1)
    PC_ret4 = Concat(mem_SP_plus1, mem_SP)
    PC_ret = Choice('SP_pc', op0, [PC_ret1, PC_ret2, PC_ret3, PC_ret4])
    PC_ljmp = Choice('LJMP_order', op0, [Concat(op1, op2), Concat(op2, op1)])
    PC_sjmp = Choice('SJMP_relpc', op0, [PC_rel1, PC_rel2])
    
    jb_bit_addr = Choice('bit_addr_choice', op0, [op1, op2])
    jb_msb_set = Equal(Extract(7, 7, jb_bit_addr), BitVecVal(1, 1))
    jb_byte_addr = If(jb_msb_set, Concat(Extract(7, 3, jb_bit_addr), BitVecVal(0, 3)), Add(ZeroExt(Extract(7, 3, jb_bit_addr), 3), BitVecVal(32, 8)))
    jb_bit_num = Extract(2, 0, jb_bit_addr)
    jb_byte = DirectIRAMRead(syn, IRAM, jb_byte_addr)
    jb_bit = ExtractBit(jb_byte, jb_bit_num)
    PC_jb_taken = Choice('PC_jb_rel', op0, [PC_rel1, PC_rel2])
    PC_jb_seq = Choice('PC_jb_seq', op0, [PC_plus2, PC_plus3])
    PC_jb = If(Equal(jb_bit, Choice('jb_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), PC_jb_taken, PC_jb_seq)

    PC_jc_taken = Choice('PC_jc_rel', op0, [PC_rel1, PC_rel2])
    PC_jc_seq = Choice('PC_jc_seq', op0, [PC_plus2, PC_plus3])
    PC_jc = If(Equal(CY, Choice('jc_polarity', op0, [BitVecVal(1,1), BitVecVal(0,1)])), PC_jc_taken, PC_jc_seq)

    PC_jz_taken = Choice('PC_jz_rel', op0, [PC_rel1, PC_rel2])
    PC_jz_seq = Choice('PC_jz_seq', op0, [PC_plus2, PC_plus3])
    ACC_zero = Equal(ACC, BitVecVal(0, 8))
    ACC_not_zero = Not(ACC_zero)
    PC_jz = If(Choice('jz_polarity', op0, [ACC_zero, ACC_not_zero]), PC_jz_taken, PC_jz_seq)
    PC_jmp = Add(DPTR, SignExt(ACC, 8))

    cjne_src1 = Choice('cjne_src1', op0, [ACC, ReadMem(IRAM, Rx[0]), ReadMem(IRAM, Rx[1])] + Rx)
    cjne_src2 = Choice('cjne_src2', op0, [op1, op2, DirectIRAMRead(syn, IRAM, Choice('cjne_iram_addr', op0, [op1, op2]))])
    cjne_taken = Not(Equal(cjne_src1, cjne_src2))
    PC_cjne_taken = Choice('PC_cjne_taken', op0, [PC_rel1, PC_rel2])
    PC_cjne_seq = Choice('PC_cjne_seq', op0, [PC_plus2, PC_plus3])
    PC_cjne = If(cjne_taken, PC_cjne_taken, PC_cjne_seq)

    djnz_src = Choice('djnz_src', op0, [DirectIRAMRead(syn, IRAM, Choice('djnz_iram_src', op0, [op1, op2]))] + Rx)
    djnz_taken = Not(Equal(djnz_src, BitVecVal(1, 8)))
    PC_djnz_taken = Choice('PC_djnz_taken', op0, [PC_rel1, PC_rel2])
    PC_djnz_seq = Choice('PC_djnz_seq', op0, [PC_plus2, PC_plus3])
    PC_djnz = If(djnz_taken, PC_djnz_taken, PC_djnz_seq)

    # nPC = Choice('nPC', op0, [PC_plus1, PC_plus2, PC_plus3, PC_ajmp, PC_ret, PC_ljmp, PC_sjmp, PC_jb])
    nPC = Choice('nPC', op0, [PC_plus1, PC_plus2, PC_plus3, PC_ajmp, PC_ret, PC_ljmp, PC_sjmp, PC_jb, PC_jc, PC_jz, PC_jmp, PC_cjne, PC_djnz])
    syn.addOutput('PC', nPC)

    ACC_RR = RotateRight(ACC)
    ACC_RL = RotateLeft(ACC)
    ACC_RRC = Extract(8, 1, RotateRight(Concat(ACC, CY)))
    ACC_RLC = Extract(7, 0, RotateLeft(Concat(CY, ACC)))

    ACC_plus1 = Add(ACC, BitVecVal(1, 8))
    ACC_INC = ACC_plus1
    ACC_INC_DIR = If(Equal(op1, BitVecVal(0xE0, 8)), ACC_plus1, ACC)

    ACC_minus1 = Sub(ACC, BitVecVal(1, 8))
    ACC_DEC = ACC_minus1
    ACC_DEC_DIR = If(Equal(op1, BitVecVal(0xE0, 8)), ACC_minus1, ACC)

    ACC_DIR = DirectIRAMRead(syn, IRAM, Choice('acc_dir_addr', op0, [op1, op2])) # read

    OP_IMM1 = Extract(15, 8,  opcode)
    OP_IMM2 = Extract(23, 16, opcode)
    ACC_ADD_IMM = Add(ACC, Choice('add_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]))
    ACC_ADDC_IMM = Add(ACC, Choice('addc_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]), ZeroExt(CY, 7))
    ACC_SUB_IMM = Sub(ACC, Choice('sub_acc_imm_choice', op0, [OP_IMM1, OP_IMM2]))
    ACC_SUBB_IMM = Sub(Sub(ACC, Choice('subb_acc_imm_choice', op0, [OP_IMM1, OP_IMM2])), ZeroExt(CY, 7))

    nACC = Choice('nACC', op0, [   
            ACC,
            ACC_RR, 
            ACC_RL, 
            ACC_RRC, 
            ACC_RLC, 
            ACC_INC, 
            ACC_INC_DIR,
            ACC_DEC, 
            ACC_ADD_IMM, 
            ACC_ADDC_IMM,
            ACC_SUB_IMM,
            ACC_DIR,
            ACC_SUBB_IMM])
    syn.addOutput('ACC', nACC)
    
    #for opcode in [0x03, 0x04, 0x14, 0x24, 0x34, 0x13, 0x23, 0x33]:
    #    cnst = Equal(op0, BitVecVal(opcode, 8))
    #    print syn.synthesize('ACC', [cnst], eval8051)

    #for opcode in [0, 1, 0x22, 0x22]: 
    #    cnst = Equal(op0, BitVecVal(opcode, 8))
    #    print syn.synthesize('PC', [cnst], eval8051)

    # this code is a bit of mess, but oh well.
    syn.VERBOSITY = 0
    syn.MAXITER = 200
    # syn.unsat_core = True
    syn.debug_objects += [ PC_jb, jb_byte, jb_bit, jb_byte_addr, jb_bit_addr ]
    # syn.logfile = open('run.log', 'wt')
    for opcode in range(0x100):
        # z3._main_ctx = None
        # if opcode == 0x73:
        #     syn.VERBOSITY = 4
        #     syn.logfile = open('run.log', 'wt')

        cnst = Equal(op0, BitVecVal(opcode, 8))
        # print '%02x %s' % (opcode, syn.synthesize('ACC', [cnst], eval8051))
        s =  '%02x %s' % (opcode, syn.synthesize('PC', [cnst], eval8051))

        print s
        # if opcode == 0x73:
        #     syn.log(s)
        #     syn.VERBOSITY = 0
        #     syn.logfile = None



if __name__ == '__main__':
    synthesize()

