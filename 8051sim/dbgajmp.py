def ajmp(pc, opcode):
    op0 = opcode & 0xFF
    op1 = (opcode & 0xFF00) >> 8

    npc = (pc + 2) & 0xF800
    npc = npc | ((op0 >> 5) << 8)
    npc |= op1

    return npc

def ajmp_p(pc, opcode):
    op0 = opcode & 0xFF
    op1 = (opcode & 0xFF00) >> 8

    npc = (pc + 2) & 0xF800
    npc_p = npc | (((op0 & 0x7F) >> 4) << 8)
    npc_p |= op1
    return npc_p

PC=0xfffe
opcode=0x800401
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 4
PC=0x0
opcode=0xe02201
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 22
PC=0x0
opcode=0x820001
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 0
PC=0x0
opcode=0x800501
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 5
PC=0x0
opcode=0x60001
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 0
PC=0xff
opcode=0x10001
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 0
PC=0xff
opcode=0x100A1
print hex(PC), hex(opcode), hex(ajmp(PC, opcode)), hex(ajmp_p(PC, opcode)), 0

