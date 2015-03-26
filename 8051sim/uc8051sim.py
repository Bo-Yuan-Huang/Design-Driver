from sim51 import evalState
from collections import defaultdict

def eval8051(inputs, outputs):
    # initialize input state.
    iram = inputs['IRAM']
    assert len(iram) >= 1
    default_iram = iram[-1]
    regs = ([default_iram]*256) + ([0]*128)
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
    outputs['IRAM'] = extractIRAM(newRegs)

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

def extractIRAM(regs):
    numCounts = defaultdict(int)
    for i in xrange(0, 256):
        numCounts[regs[i]] += 1

    maxCnt = 0
    maxKey = 0
    for k,c in numCounts.iteritems():
        if c > maxCnt:
            maxCnt = c
            maxKey = k

    ram = []
    for i in xrange(0, 256):
        if regs[i] != maxKey:
            ram.append([i,regs[i]])
    ram.append(maxKey)
    return ram


