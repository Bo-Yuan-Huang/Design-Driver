from sim51 import evalPC

#pc = 0x800
#opcode = 0x21
#regs = [0] * 384

# 7FFD  79A20 [103: 4]
pc = 0x7FFD
opcode = 0x79A30
regs = [0] * 384
regs[0x118] = 0x4

print '%x' % evalPC(pc, opcode, regs)

