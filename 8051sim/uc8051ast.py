from ast import *

class Ctx8051(object):
    def __init__(self, syn):
        # Create the inputs.
        # These two are for the synthesis. 
        # Need to think about replacing this with a memory abstraction.
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

        # Create aliases for them.
        self.syn = syn
        self.PC = syn.inp('PC')
        self.opcode = syn.inp('opcode')
        self.IRAM = syn.inp('IRAM')
        self.P0 = syn.inp('P0')
        self.SP = syn.inp('SP')
        self.DPL = syn.inp('DPL')
        self.DPH = syn.inp('DPH')
        self.PCON = syn.inp('PCON')
        self.TCON = syn.inp('TCON')
        self.TMOD = syn.inp('TMOD')
        self.TL0 = syn.inp('TL0')
        self.TH0 = syn.inp('TH0')
        self.TL1 = syn.inp('TL1')
        self.TH1 = syn.inp('TH1')
        self.P1 = syn.inp('P1')
        self.SCON = syn.inp('SCON')
        self.SBUF = syn.inp('SBUF')
        self.P2 = syn.inp('P2')
        self.IE = syn.inp('IE')
        self.P3 = syn.inp('P3')
        self.IP = syn.inp('IP')
        self.PSW = syn.inp('PSW')
        self.ACC = syn.inp('ACC')
        self.B = syn.inp('B')

class DirectIRAMRead(Node):
    "Perform a direct read from the 8051 IRAM."
    DIR_IRAM_READ = Node.NODE_TYPE_MAX+1

    def __init__(self, ctx, addr):
        if addr.width != 8:
            raise ValueError, "Address width must be 8."
        assert ctx.IRAM.dwidth == 8

        Node.__init__(self, self.DIR_IRAM_READ)
        self.addr = addr
        self.width = ctx.IRAM.dwidth
        self.ctx = ctx
         
    def _toZ3sHelper(self, prefix, rfun):
        mz3 = rfun(self.ctx.IRAM, prefix)
        az3 = rfun(self.addr, prefix)

        msb0 = z3.Extract(7, 7, az3) == z3.BitVecVal(0, 1)
        return z3.If(msb0, mz3[az3],
            z3.If(az3 == z3.BitVecVal(0x80, 8), rfun(self.ctx.P0, prefix),
            z3.If(az3 == z3.BitVecVal(0x81, 8), rfun(self.ctx.SP, prefix),
            z3.If(az3 == z3.BitVecVal(0x82, 8), rfun(self.ctx.DPL, prefix),
            z3.If(az3 == z3.BitVecVal(0x83, 8), rfun(self.ctx.DPH, prefix),
            z3.If(az3 == z3.BitVecVal(0x87, 8), rfun(self.ctx.PCON, prefix),
            z3.If(az3 == z3.BitVecVal(0x88, 8), rfun(self.ctx.TCON, prefix),
            z3.If(az3 == z3.BitVecVal(0x89, 8), rfun(self.ctx.TMOD, prefix),
            z3.If(az3 == z3.BitVecVal(0x8A, 8), rfun(self.ctx.TL0, prefix),
            z3.If(az3 == z3.BitVecVal(0x8C, 8), rfun(self.ctx.TH0, prefix),
            z3.If(az3 == z3.BitVecVal(0x8B, 8), rfun(self.ctx.TL1, prefix),
            z3.If(az3 == z3.BitVecVal(0x8D, 8), rfun(self.ctx.TH1, prefix),
            z3.If(az3 == z3.BitVecVal(0x90, 8), rfun(self.ctx.P1, prefix),
            z3.If(az3 == z3.BitVecVal(0x98, 8), rfun(self.ctx.SCON, prefix),
            z3.If(az3 == z3.BitVecVal(0x99, 8), rfun(self.ctx.SBUF, prefix),
            z3.If(az3 == z3.BitVecVal(0xA0, 8), rfun(self.ctx.P2, prefix),
            z3.If(az3 == z3.BitVecVal(0xA8, 8), rfun(self.ctx.IE, prefix),
            z3.If(az3 == z3.BitVecVal(0xB0, 8), rfun(self.ctx.P3, prefix),
            z3.If(az3 == z3.BitVecVal(0xB8, 8), rfun(self.ctx.IP, prefix),
            z3.If(az3 == z3.BitVecVal(0xD0, 8), rfun(self.ctx.PSW, prefix),
            z3.If(az3 == z3.BitVecVal(0xE0, 8), rfun(self.ctx.ACC, prefix),
            z3.If(az3 == z3.BitVecVal(0xF0, 8), rfun(self.ctx.B, prefix),
            z3.BitVecVal(0, 8)))))))))))))))))))))))

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def __str__(self):
        return '(read-direct %s %s)' % (str(self.ctx.IRAM), str(self.addr))

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

