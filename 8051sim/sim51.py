import subprocess
import tempfile
from random import randint

def dumpState(fileobject, pc, opcode, regs):
    print >> fileobject, '%x' % (pc)
    print >> fileobject, '%x %x %x' % ((opcode & 0xFF), (opcode & 0xFF00) >> 8, (opcode & 0xFF0000) >> 16)
    for i in xrange(0, 384, 32):
        for j in xrange(i, i+32):
                print >> fileobject, '%x' % (regs[j]),
        print >> fileobject

    fileobject.flush()

def evalState(pc, opcode, regs):
    "Create a temporary file with the input state, run 8051syn, collect the output and return."
    assert opcode >= 0 and opcode <= (1 << 24), opcode
    for i in regs:
        assert regs[i] >= 0 and regs[i] <= (1 << 8), regs[i]

    with tempfile.NamedTemporaryFile() as fileobject:
        dumpState(fileobject, pc, opcode, regs)

        # print subprocess.check_output(['cat', fileobject.name])
        # print subprocess.check_output(['wc', fileobject.name])
        # print subprocess.check_output(['./8051syn', fileobject.name])
        state = subprocess.check_output(['./8051syn', fileobject.name])
        words = state.split()
        if len(words) != 385:
            raise IOError("Invalid output from 8051syn.")

        pc = int(words[0], 16)
        regs = [int(x, 16) for x in words[1:]]
        return pc, regs
    
    raise IOError("Unable to execute command.")

def evalPC(pc, opcode, regs):
    "Evaluate the effect on the PC of the executed instruction."
    assert len(regs) == 384
    newPC, newRegs = evalState(pc, opcode, regs)
    return newPC

def testSim51():
    for i in xrange(0, 256):
        o1 = randint(0, 255)
        o2 = randint(0, 255)
        opcode = i | (o1 << 8) | (o2 << 16)
        print '%x %x %x' % (i, o1, o2)

        pc = randint(0, 65536)
        regs = [randint(0, 256) for i in xrange(384)]

        print '%4X %6X --> %4X' % (pc, opcode, evalPC(pc, opcode, regs))

# state = [0, 0xFF] + [0] * 382
# print evalState(0, 0x01A5, state)
# print hex(evalPC(0xABCD, 0x34c1, [0xFF]*384))
