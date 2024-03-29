import subprocess
import tempfile
from random import randint

def dumpState(fileobject, pc, xram_data_in, rom, xram, regs):
    print >> fileobject, '%x' % (pc)
    print >> fileobject, '%x' % (xram_data_in)
    dumpMem(fileobject, rom)
    dumpMem(fileobject, xram)
    for i in xrange(0, 384, 32):
        for j in xrange(i, i+32):
                print >> fileobject, '%x' % (regs[j]),
        print >> fileobject

    fileobject.flush()

def dumpMem(fileobject, mem):
    l = len(mem) - 1
    assert l >= 0
    nums = [mem[-1]]
    for [a,v] in mem[:-1]:
        nums.append(a)
        nums.append(v)
    assert len(nums) == 2*l + 1
    print >> fileobject, l, ' '.join('%x' % n for n in nums)

def evalState(pc, xram_data_in, rom, xram, regs):
    "Create a temporary file with the input state, run 8051syn, collect the output and return."
    for i in regs:
        assert regs[i] >= 0 and regs[i] <= (1 << 8), regs[i]

    with tempfile.NamedTemporaryFile() as fileobject:
        dumpState(fileobject, pc, xram_data_in, rom, xram, regs)

        # print subprocess.check_output(['cat', fileobject.name])
        # print subprocess.check_output(['wc', fileobject.name])
        # print subprocess.check_output(['./8051syn', fileobject.name])
        state = subprocess.check_output(['./8051syn', fileobject.name])
        # print state
        words = state.split()
        pc = int(words[0], 16)
        xram_addr = int(words[1], 16)
        xram_data_out = int(words[2], 16)

        xram_def_size = int(words[3], 10)
        xram = []
        last = 4+2*xram_def_size
        for i in xrange(4, last, 2):
            xram.append([int(words[i], 16), int(words[i+1], 16)])
        xram.append(int(words[last], 16))
        regs = [int(x, 16) for x in words[last+1:]]
        assert len(regs) == 384
        return pc, xram_addr, xram_data_out, regs, xram
    
    raise IOError("Unable to execute command.")

