from sim51 import evalPC

pc = 0x800
opcode = 0x21
regs = [0] * 384

print '%x' % evalPC(pc, opcode, regs)
