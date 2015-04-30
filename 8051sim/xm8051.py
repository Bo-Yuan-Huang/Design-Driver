# A simple simulator for the external memory, AES and SHA modules.
import sys

class XMM(object):
    STEP = 0
    RD   = 1
    WR   = 2

    AES_IDLE = 0
    AES_RD   = 1
    AES_OP   = 2
    AES_WR   = 3

    SHA_IDLE = 0
    SHA_RD   = 1
    SHA_OP   = 2
    SHA_WR   = 3

    def __init__(self):
        self.regmap = {}
        self.regidx = {}
        self.addReg('aes_state', 0xff01, 1)
        self.addReg('aes_addr', 0xff02, 2)
        self.addReg('aes_len', 0xff04, 2)
        self.addReg('aes_ctr', 0xff10, 0x10)
        self.addReg('aes_key0', 0xff20, 0x10)
        self.addReg('aes_key1', 0xff30, 0x10)
        self.addReg('sha_state', 0xfe01, 1)
        self.addReg('sha_rdaddr', 0xfe02, 2)
        self.addReg('sha_wraddr', 0xfe04, 2)
        self.addReg('sha_len', 0xfe06, 2)
        self.addReg('sha_reserved', 0xfe08, 2, 1)

        self.xram = [0]*65536

    def addReg(self, name, addr, length, readonly=0, default=0):
        # make sure it doesn't overlap with anything.
        for (a0,a1) in self.regmap:
            assert addr < a0 or addr >= a1
        assert name not in self.regidx

        self.regmap[(addr, addr+length)] = (name, length, readonly, [default]*length)
        self.regidx[name] = (addr, addr+length)

    def read(self, addr):
        assert addr >= 0 and addr <= 65536
        for (a0, a1) in self.regmap:
            if addr >= a0 and addr < a1:
                (name, length, readonly, data) = self.regmap[(a0, a1)]
                offset = addr-a0
                return data[offset]
        
        return self.xram[addr]

    def getRegB(self, name):
        (a0, a1) = self.regidx[name]
        (name, length, readonly, data) = self.regmap[(a0, a1)]
        return data

    def getRegI(self, name):
        (a0, a1) = self.regidx[name]
        (name, length, readonly, data) = self.regmap[(a0, a1)]
        m, v = 1, 0
        for i in xrange(length):
            v = v + m * data[i]
            m = m * 0x100
        return v

    def setRegI(self, name, datain):
        (a0, a1) = self.regidx[name]
        (name, length, readonly, data) = self.regmap[(a0, a1)]
        data = []
        for i in xrange(length):
            data.append(datain & 0xFF)
            datain = datain >> 8 
        self.regmap[(a0, a1)] = (name, length, readonly, data)

    def setRegB(self, name, datain):
        (a0, a1) = self.regidx[name]
        (name, length, readonly, data) = self.regmap[(a0, a1)]
        assert len(datain) == length
        self.regmap[(a0, a1)] = (name, length, readonly, datain)

    def write(self, addr, datain):
        assert addr >= 0 and addr <= 65536
        for (a0, a1) in self.regmap:
            if addr >= a0 and addr < a1:
                (name, length, readonly, data) = self.regmap[(a0, a1)]
                if readonly: 
                    return
                else:
                    offset = addr-a0
                    data[offset] = datain
                    self.regmap[(a0, a1)] = (name, length, readonly, data)
        self.xram[addr] = datain

    def operate(self, op, addr, datain):
        if op == XMM.RD:
            return self.read(addr)
        elif op == XMM.WR:
            self.write(addr, datain)
            return 0
        else:
            pass


def test(argv):
    xmm = XMM()
    xmm.operate(XMM.WR, 0xfe03, 0x10)
    xmm.setRegB('aes_ctr', range(16))
    xmm.setRegI('sha_len', 0x100)
    assert xmm.getRegB('sha_rdaddr') == [0, 0x10]
    assert xmm.getRegI('sha_rdaddr') == 0x1000
    assert xmm.operate(XMM.RD, 0xfe03, 0) == 0x10
    assert xmm.getRegB('aes_ctr') == range(16)
    for i in xrange(16):
        assert xmm.operate(XMM.RD, 0xff10+i, 1) == i
    assert xmm.operate(XMM.RD, 0xfe06, 0) == 0
    assert xmm.operate(XMM.RD, 0xfe07, 0) == 1


if __name__ == '__main__':
    test(sys.argv)












##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################
##################

