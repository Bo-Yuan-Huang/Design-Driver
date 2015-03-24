from ast import *

def create8051Inputs(syn):
    syn.addInput(BitVecVar('PC', 16))
    syn.addInput(BitVecVar('opcode', 24))
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
    def __init__( self, PC, opcode, IRAM, P0, SP, DPL, DPH, PCON, TCON, TMOD, 
        TL0, TH0, TL1, TH1, P1, SCON, SBUF, P2, IE, P3, IP, PSW, ACC, B):

        self.PC = PC
        self.opcode = opcode
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
        self._Rbank = Extract(4, 3, self.PSW)
        self._RxAddr = [Concat(BitVecVal(0, 3), self._Rbank, BitVecVal(i, 3)) for i in xrange(8)]
        self._Rx = [ReadMem(self.IRAM, RxAddr_i) for RxAddr_i in self._RxAddr]

    def CY(self):
        return self._CY

    def RxAddr(self, i):
        return self._RxAddr[i]

    def RxAddrs(self):
        return self._RxAddr

    def Rx(self, i):
        return self._Rx[i]

    def Rxs(self):
        return self._Rx

    def readDirect(self, addr):
        msb0 = Equal(Extract(7, 7, addr), BitVecVal(0, 1))
        return If(msb0, ReadMem(self.IRAM, addr),
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

    def readBit(self, bitaddr):
        msb1 = Equal(Extract(7, 7, bitaddr), BitVecVal(1, 1))
        byteaddr = If(msb1, 
            Concat(Extract(7, 3, bitaddr), BitVecVal(0, 3)), 
            Add(ZeroExt(Extract(7, 3, bitaddr), 3), BitVecVal(32, 8)))
        bitindex = Extract(2, 0, bitaddr)
        byte = self.readDirect(byteaddr)
        bit = ExtractBit(byte, bitindex)
        return bit

def Ctx8051FromSyn(syn):
    return Ctx8051( syn.inp('PC'), syn.inp('opcode'), syn.inp('IRAM'), syn.inp('P0'), syn.inp('SP'), 
        syn.inp('DPL'), syn.inp('DPH'), syn.inp('PCON'), syn.inp('TCON'), syn.inp('TMOD'), 
        syn.inp('TL0'), syn.inp('TH0'), syn.inp('TL1'), syn.inp('TH1'), syn.inp('P1'), syn.inp('SCON'), 
        syn.inp('SBUF'), syn.inp('P2'), syn.inp('IE'), syn.inp('P3'), syn.inp('IP'), syn.inp('PSW'), 
        syn.inp('ACC'), syn.inp('B') )

class DirectIRAMWrite(Node):
    """Perform on a direct write from the 8051 IRAM. This might 
       modify one of the SFRs."""

    DIR_IRAM_WRITE = Node.NODE_TYPE_MAX+2
    
    def __init__(self, ctx, addr, data):
        if addr.width != 8:
            raise ValueError, "Address width must be 8."
        if ctx.IRAM.dwidth != 8:
            raise ValueError, "IRAM width must also be 8."

        Node.__init__(self, self.DIR_IRAM_WRITE)
        self.addr = addr
        self.data = data
        self.width = ctx.IRAM.dwidth
        self.ctx = ctx

         
    def _toZ3sHelper(self, prefix, rfun):
        mz3 = rfun(self.ctx.IRAM, prefix)
        az3 = rfun(self.addr, prefix)
        dz3 = rfun(self.data, prefix)

        msb0 = z3.Extract(7, 7, az3) == z3.BitVecVal(0, 1)
        self.ctx.IRAM = z3.If(msb0, Update(ctx.IRAM, az3, dz3), self.ctx.IRAM)
        self.ctx.P0   = z3.If(az3 == z3.BitVecVal(0x80, 8), dz3, self.ctx.P0)
        self.ctx.SP   = z3.If(az3 == z3.BitVecVal(0x81, 8), dz3, self.ctx.SP)
        self.ctx.DPL  = z3.If(az3 == z3.BitVecVal(0x82, 8), dz3, self.ctx.DPL)
        self.ctx.DPH  = z3.If(az3 == z3.BitVecVal(0x83, 8), dz3, self.ctx.DPH)
        self.ctx.PCON = z3.If(az3 == z3.BitVecVal(0x87, 8), dz3, self.ctx.PCON)
        self.ctx.TCON = z3.If(az3 == z3.BitVecVal(0x88, 8), dz3, self.ctx.TCON)
        self.ctx.TMOD = z3.If(az3 == z3.BitVecVal(0x89, 8), dz3, self.ctx.TMOD)
        self.ctx.TL0  = z3.If(az3 == z3.BitVecVal(0x8A, 8), dz3, self.ctx.TL0)
        self.ctx.TH0  = z3.If(az3 == z3.BitVecVal(0x8C, 8), dz3, self.ctx.TH0)
        self.ctx.TL1  = z3.If(az3 == z3.BitVecVal(0x8B, 8), dz3, self.ctx.TL1)
        self.ctx.TH1  = z3.If(az3 == z3.BitVecVal(0x8D, 8), dz3, self.ctx.TH1)
        self.ctx.P1   = z3.If(az3 == z3.BitVecVal(0x90, 8), dz3, self.ctx.P1)
        self.ctx.SCON = z3.If(az3 == z3.BitVecVal(0x98, 8), dz3, self.ctx.SCON)
        self.ctx.SBUF = z3.If(az3 == z3.BitVecVal(0x99, 8), dz3, self.ctx.SBUF)
        self.ctx.P2   = z3.If(az3 == z3.BitVecVal(0xA0, 8), dz3, self.ctx.P2)
        self.ctx.IE   = z3.If(az3 == z3.BitVecVal(0xA8, 8), dz3, self.ctx.IE)
        self.ctx.P3   = z3.If(az3 == z3.BitVecVal(0xB0, 8), dz3, self.ctx.P3)
        self.ctx.IP   = z3.If(az3 == z3.BitVecVal(0xB8, 8), dz3, self.ctx.IP)
        self.ctx.PSW  = z3.If(az3 == z3.BitVecVal(0xD0, 8), dz3, self.ctx.PSW)
        self.ctx.ACC  = z3.If(az3 == z3.BitVecVal(0xE0, 8), dz3, self.ctx.ACC)
        self.ctx.B    = z3.If(az3 == z3.BitVecVal(0xF0, 8), dz3, self.ctx.B)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def __str__(self):
        return '(write-direct %s %s %s)' % (str(self.ctx.IRAM), str(self.addr), str(self.data))

    def synthesize(self, m):
        return DirectIRAMRead(self.ctx, self.addr.synthesize(m))

    def childObjects(self):
        yield self.ctx.IRAM
        yield self.addr
        yield self.ctx.P0
        yield self.ctx.SP
        yield self.ctx.DPL
        yield self.ctx.DPH
        yield self.ctx.PCON
        yield self.ctx.TCON
        yield self.ctx.TMOD
        yield self.ctx.TL0
        yield self.ctx.TH0
        yield self.ctx.TL1
        yield self.ctx.TH1
        yield self.ctx.P1
        yield self.ctx.SCON
        yield self.ctx.SBUF
        yield self.ctx.P2
        yield self.ctx.IE
        yield self.ctx.P3
        yield self.ctx.IP
        yield self.ctx.PSW
        yield self.ctx.ACC
        yield self.ctx.B

