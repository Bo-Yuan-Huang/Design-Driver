from sim51 import evalPC, dumpState

# 107E  101B7 [ 1:20 11:fd fd: 1 150:10] --> 1082
pc = 0x107E
opcode = 0x101B7 
regs = [0] * 384
regs[0x1]   = 0x20
regs[0x11]  = 0xFD
regs[0xFD]  = 0x1
regs[0x150] = 0x10

print '%x' % evalPC(pc, opcode, regs)
with open('dbgstate', 'wt') as fileobject:
    dumpState(fileobject, pc, opcode, regs)

