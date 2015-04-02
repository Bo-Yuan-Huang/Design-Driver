import sys
import subprocess
import tempfile
from collections import namedtuple

AesState = namedtuple('AesState', [
    'state', 'addr', 'length', 'num_op_bytes', 'block_ctr',
    'ctr', 'key', 'xram', 'op', 'addr_in', 'data_in'
])
    
def dump_aes_state(fileobject, s_in):
    hexstr = lambda x: hex(x)[2:]

    s1 = [hexstr(x) for x in [s_in.state, s_in.addr, s_in.length, s_in.num_op_bytes, s_in.block_ctr]]
    print >> fileobject, ' '.join(s1)

    s2 = [hexstr(x) for x in s_in.ctr]
    print >> fileobject, ' '.join(s2)

    s3 = [hexstr(x) for x in s_in.key]
    print >> fileobject, ' '.join(s3)

    xram = s_in.xram
    print >> fileobject, hexstr(len(xram[:-1])), hexstr(xram[-1])
    for [a,d] in xram[:-1]:
        print >> fileobject, hexstr(a), hexstr(d), 
    print

    s4 = [hexstr(x) for x in [s_in.op, s_in.addr_in, s_in.data_in]]
    print >> fileobject, ' '.join(s4)

    fileobject.flush()

def eval_aes(s_in):
    with tempfile.NamedTemporaryFile() as fileobject:
        dump_aes_state(fileobject, s_in)

        # print subprocess.check_output(['cat', fileobject.name])
        state = subprocess.check_output(['./simulate', 'aes', fileobject.name])
        # print 'output:', state

        hex_int = lambda x: int(x, 16)
        words = state.split()

        data_out = hex_int(words[0])
        state = hex_int(words[1])
        addr = hex_int(words[2])
        length = hex_int(words[3])
        num_op_bytes = hex_int(words[4])
        block_ctr = hex_int(words[5])

        ctr = [hex_int(x) for x in words[6:6+16]]
        key = [hex_int(x) for x in words[6+16:6+32]]

        sz = hex_int(words[38])
        defval = hex_int(words[39])

        mem = []
        assert len(words) == 40 + 2*sz
        for i in xrange(40, 40+2*sz, 2):
            a = hex_int(words[i])
            d = hex_int(words[i+1])
            mem.append([a, d])
        mem.append(defval)
        xram = mem
        s_out = AesState(state, addr, length, num_op_bytes, block_ctr, ctr, key, xram, 0, 0, 0)

        return data_out, s_out
    return None, None

AES_NOP = 0
AES_RD  = 1
AES_WR  = 2

def test_eval():
    state = 0
    addr = 0x1000
    length = 0x20
    num_op_bytes = 0
    block_ctr = 0
    ctr = range(16)
    key = [(i*i) & 0xFF for i in xrange(16)]
    xram = [0x33]
    op = AES_WR
    addr_in = 0xFF00
    data_in = 1
    s_in = AesState(state, addr,length, num_op_bytes, block_ctr, ctr, key, xram, op, addr_in, data_in)
    data_out, s_out = eval_aes(s_in)
    while True:
        s_in = s_out._replace(op=0)
        data_out, s_out = eval_aes(s_in)
        if s_out.state == 0:
            break
    print s_out.xram

    s_in = s_out._replace(op=2, addr_in=0xFF00, data_in=1)
    data_out, s_out = eval_aes(s_in)
    while True:
        s_in = s_out._replace(op=0)
        data_out, s_out = eval_aes(s_in)
        if s_out.state == 0:
            break
    print s_out.xram



if __name__ == '__main__':
    test_eval()
