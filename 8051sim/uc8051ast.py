from ast import *

def create8051Inputs(syn):
    syn.addInput(BitVecVar('PC', 16))
    # code memory.
    syn.addInput(MemVar('ROM', 16, 8))
    # IRAM
    syn.addInput(MemVar('IRAM', 8, 8))
    # main SFRs
    syn.addInput(BitVecVar('ACC', 8))
    syn.addInput(BitVecVar('B', 8))
    syn.addInput(BitVecVar('PSW', 8))
    syn.addInput(BitVecVar('SP', 8))
    syn.addInput(BitVecVar('DPL', 8))
    syn.addInput(BitVecVar('DPH', 8))
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

class Ctx8051(object):
    def __init__( self, PC, ROM, IRAM, P0, SP, DPL, DPH, PCON, TCON, TMOD, 
        TL0, TH0, TL1, TH1, P1, SCON, SBUF, P2, IE, P3, IP, PSW, ACC, B):

        self.PC = PC
        self.ROM = ROM
        self.op0 = Macro('op0', ReadMem(self.ROM, self.PC), [self.ROM, self.PC])
        self.op1 = Macro('op1', ReadMem(self.ROM, Add(self.PC, BitVecVal(1, 16))), [self.ROM, self.PC])
        self.op2 = Macro('op2', ReadMem(self.ROM, Add(self.PC, BitVecVal(2, 16))), [self.ROM, self.PC])
        self.opcode = Concat(self.op2, self.op1, self.op0)

        self.IRAM = IRAM
        self.P0 = P0
        self.SP = SP
        self.DPL = DPL
        self.DPH = DPH
        self.PCON = PCON
        self.TCON = TCON
        self.TMOD = TMOD
        self.TL0 = TL0
        self.TH0 = TH0
        self.TL1 = TL1
        self.TH1 = TH1
        self.P1 = P1
        self.SCON = SCON
        self.SBUF = SBUF
        self.P2 = P2
        self.IE = IE
        self.P3 = P3
        self.IP = IP
        self.PSW = PSW
        self.ACC = ACC
        self.B = B

        self._CY = Extract(7, 7, self.PSW)
        self._AC = Extract(6, 6, self.PSW)
        self._OV = Extract(2, 2, self.PSW)
        self._Rbank = Extract(4, 3, self.PSW)
        self._RxAddr = [Concat(BitVecVal(0, 3), self._Rbank, BitVecVal(i, 3)) for i in xrange(8)]
        self._Rx = [ReadMem(self.IRAM, RxAddr_i) for RxAddr_i in self._RxAddr]

    def clone(self):
        return Ctx8051(self.PC, self.ROM, self.IRAM, self.P0, self.SP, self.DPL, self.DPH, self.PCON, 
        self.TCON, self.TMOD, self.TL0, self.TH0, self.TL1, self.TH1, self.P1, self.SCON, 
        self.SBUF, self.P2, self.IE, self.P3, self.IP, self.PSW, self.ACC, self.B)
            
    def CY(self): return self._CY
    def AC(self): return self._AC
    def OV(self): return self._OV

    def RxAddr(self, i):
        return self._RxAddr[i]

    def RxAddrs(self):
        return self._RxAddr

    def Rx(self, i):
        return self._Rx[i]

    def Rxs(self):
        return self._Rx

    def _directInputs(self):
        return [self.IRAM, self.P0, self.SP,
            self.DPL, self.DPH, self.PCON, self.TCON,
            self.TMOD, self.TL0, self.TH0, self.TL1,
            self.TH1, self.P1, self.SCON, self.SBUF,
            self.P2, self.IE, self.P3, self.IP, self.PSW,
            self.ACC, self.B]

    def readDirect(self, addr):
        msb0 = Equal(Extract(7, 7, addr), BitVecVal(0, 1))
        expr = If(msb0, ReadMem(self.IRAM, addr),
            If(Equal(addr, BitVecVal(0x80, 8)), self.P0,
            If(Equal(addr, BitVecVal(0x81, 8)), self.SP,
            If(Equal(addr, BitVecVal(0x82, 8)), self.DPL,
            If(Equal(addr, BitVecVal(0x83, 8)), self.DPH,
            If(Equal(addr, BitVecVal(0x87, 8)), self.PCON,
            If(Equal(addr, BitVecVal(0x88, 8)), self.TCON,
            If(Equal(addr, BitVecVal(0x89, 8)), self.TMOD,
            If(Equal(addr, BitVecVal(0x8A, 8)), self.TL0,
            If(Equal(addr, BitVecVal(0x8C, 8)), self.TH0,
            If(Equal(addr, BitVecVal(0x8B, 8)), self.TL1,
            If(Equal(addr, BitVecVal(0x8D, 8)), self.TH1,
            If(Equal(addr, BitVecVal(0x90, 8)), self.P1,
            If(Equal(addr, BitVecVal(0x98, 8)), self.SCON,
            If(Equal(addr, BitVecVal(0x99, 8)), self.SBUF,
            If(Equal(addr, BitVecVal(0xA0, 8)), self.P2,
            If(Equal(addr, BitVecVal(0xA8, 8)), self.IE,
            If(Equal(addr, BitVecVal(0xB0, 8)), self.P3,
            If(Equal(addr, BitVecVal(0xB8, 8)), self.IP,
            If(Equal(addr, BitVecVal(0xD0, 8)), self.PSW,
            If(Equal(addr, BitVecVal(0xE0, 8)), self.ACC,
            If(Equal(addr, BitVecVal(0xF0, 8)), self.B,
            BitVecVal(0, 8)))))))))))))))))))))))

        return Macro('read-direct', expr, [addr] + self._directInputs())

    def readBit(self, bitaddr):
        msb1 = Equal(Extract(7, 7, bitaddr), BitVecVal(1, 1))
        byteaddr = If(msb1, 
            Concat(Extract(7, 3, bitaddr), BitVecVal(0, 3)), 
            Add(ZeroExt(Extract(7, 3, bitaddr), 3), BitVecVal(32, 8)))
        bitindex = Extract(2, 0, bitaddr)
        byte = self.readDirect(byteaddr)
        bit = ExtractBit(byte, bitindex)
        return Macro('read-bit', bit, [bitaddr] + self._directInputs())

    def writeBit(self, bitaddr, bitval):
        msb1 = Equal(Extract(7, 7, bitaddr), BitVecVal(1, 1))
        byteaddr = If(msb1, 
            Concat(Extract(7, 3, bitaddr), BitVecVal(0, 3)), 
            Add(ZeroExt(Extract(7, 3, bitaddr), 3), BitVecVal(32, 8)))
        byte = self.readDirect(byteaddr)
        bitindex = ZeroExt(Extract(2, 0, bitaddr), 5)
        # put a 0 in the right position with 1s elsewhere.
        mask1 = Complement(LShift(BitVecVal(1, 8), bitindex))
        # put the bit value in the correct position with 0s elsewhere
        mask2 = LShift(ZeroExt(bitval, 7), bitindex)
        byte_p = BVOr(BVAnd(mask1, byte), mask2)
        return self.writeDirect(byteaddr, byte_p)

    def writeDirect(self, addr, data):
        ctxp = self.clone()
        ctxp.IRAM = If(Equal(Extract(7, 7, addr), BitVecVal(0, 1)), 
            WriteMem(self.IRAM, addr, data), self.IRAM)
        ctxp.P0   = If(Equal(addr, BitVecVal(0x80, 8)), data, self.P0)
        ctxp.SP   = If(Equal(addr, BitVecVal(0x81, 8)), data, self.SP)
        ctxp.DPL  = If(Equal(addr, BitVecVal(0x82, 8)), data, self.DPL)
        ctxp.DPH  = If(Equal(addr, BitVecVal(0x83, 8)), data, self.DPH)
        ctxp.PCON = If(Equal(addr, BitVecVal(0x87, 8)), data, self.PCON)
        ctxp.TCON = If(Equal(addr, BitVecVal(0x88, 8)), data, self.TCON)
        ctxp.TMOD = If(Equal(addr, BitVecVal(0x89, 8)), data, self.TMOD)
        ctxp.TL0  = If(Equal(addr, BitVecVal(0x8A, 8)), data, self.TL0)
        ctxp.TH0  = If(Equal(addr, BitVecVal(0x8C, 8)), data, self.TH0)
        ctxp.TL1  = If(Equal(addr, BitVecVal(0x8B, 8)), data, self.TL1)
        ctxp.TH1  = If(Equal(addr, BitVecVal(0x8D, 8)), data, self.TH1)
        ctxp.P1   = If(Equal(addr, BitVecVal(0x90, 8)), data, self.P1)
        ctxp.SCON = If(Equal(addr, BitVecVal(0x98, 8)), data, self.SCON)
        ctxp.SBUF = If(Equal(addr, BitVecVal(0x99, 8)), data, self.SBUF)
        ctxp.P2   = If(Equal(addr, BitVecVal(0xA0, 8)), data, self.P2)
        ctxp.IE   = If(Equal(addr, BitVecVal(0xA8, 8)), data, self.IE)
        ctxp.P3   = If(Equal(addr, BitVecVal(0xB0, 8)), data, self.P3)
        ctxp.IP   = If(Equal(addr, BitVecVal(0xB8, 8)), data, self.IP)
        ctxp.PSW  = If(Equal(addr, BitVecVal(0xD0, 8)), data, self.PSW)
        ctxp.ACC  = If(Equal(addr, BitVecVal(0xE0, 8)), data, self.ACC)
        ctxp.B    = If(Equal(addr, BitVecVal(0xF0, 8)), data, self.B)
        return ctxp

    
def CtxChoice(name, op, ctxs):
    PC = Choice(name, op, [c.PC for c in ctxs])
    ROM = ctxs[0].ROM
    IRAM = Choice(name, op, [c.IRAM for c in ctxs])
    P0 = Choice(name, op, [c.P0 for c in ctxs])
    SP = Choice(name, op, [c.SP for c in ctxs])
    DPL = Choice(name, op, [c.DPL for c in ctxs])
    DPH = Choice(name, op, [c.DPH for c in ctxs])
    PCON = Choice(name, op, [c.PCON for c in ctxs])
    TCON = Choice(name, op, [c.TCON for c in ctxs])
    TMOD = Choice(name, op, [c.TMOD for c in ctxs])
    TL0 = Choice(name, op, [c.TL0 for c in ctxs])
    TH0 = Choice(name, op, [c.TH0 for c in ctxs])
    TL1 = Choice(name, op, [c.TL1 for c in ctxs])
    TH1 = Choice(name, op, [c.TH1 for c in ctxs])
    P1 = Choice(name, op, [c.P1 for c in ctxs])
    SCON = Choice(name, op, [c.SCON for c in ctxs])
    SBUF = Choice(name, op, [c.SBUF for c in ctxs])
    P2 = Choice(name, op, [c.P2 for c in ctxs])
    IE = Choice(name, op, [c.IE for c in ctxs])
    P3 = Choice(name, op, [c.P3 for c in ctxs])
    IP = Choice(name, op, [c.IP for c in ctxs])
    PSW = Choice(name, op, [c.PSW for c in ctxs])
    ACC = Choice(name, op, [c.ACC for c in ctxs])
    B = Choice(name, op, [c.B for c in ctxs])
    return Ctx8051(PC, ROM, IRAM, P0, SP, DPL, DPH, PCON, TCON, TMOD, 
        TL0, TH0, TL1, TH1, P1, SCON, SBUF, P2, IE, P3, IP, PSW, ACC, B)
    
def Ctx8051FromSyn(syn):
    return Ctx8051( syn.inp('PC'), syn.inp('ROM'), syn.inp('IRAM'), syn.inp('P0'), syn.inp('SP'), 
        syn.inp('DPL'), syn.inp('DPH'), syn.inp('PCON'), syn.inp('TCON'), syn.inp('TMOD'), 
        syn.inp('TL0'), syn.inp('TH0'), syn.inp('TL1'), syn.inp('TH1'), syn.inp('P1'), syn.inp('SCON'), 
        syn.inp('SBUF'), syn.inp('P2'), syn.inp('IE'), syn.inp('P3'), syn.inp('IP'), syn.inp('PSW'), 
        syn.inp('ACC'), syn.inp('B') )
