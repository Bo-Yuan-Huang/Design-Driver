#! /usr/bin/python2.7
import sys

def read_in(filename):
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line = line.strip()
            comment_start = line.find('//')
            if comment_start != -1:
                line = line[:comment_start].strip()
            if len(line) == 0:
                continue
            words = line.split()
            assert len(words) == 1
            byte = int(words[0], 16)
            data.append(byte)
    return data

def dump_assigns(data):
    N = len(data)
    print '  wire [7:0] buff [%d:0];' % (N-1)
    for i,b in enumerate(data):
        print '  assign buff[%d] = 8\'h%x;' % (i, b)
    print '  wire [15:0] addr0 = addr;'
    print '  wire [15:0] addr1 = addr+1;'
    print '  wire [15:0] addr2 = addr+2;'
    print '  wire [15:0] addr3 = addr+3;'
    print '  wire [7:0] data_o0 = (addr0 < %d) ? buff[addr0] : 8\'h0;' % N
    print '  wire [7:0] data_o1 = (addr1 < %d) ? buff[addr1] : 8\'h0;' % N
    print '  wire [7:0] data_o2 = (addr2 < %d) ? buff[addr2] : 8\'h0;' % N
    print '  wire [7:0] data_o3 = (addr3 < %d) ? buff[addr3] : 8\'h0;' % N
    print '  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};';

data = read_in(sys.argv[1])
dump_assigns(data)
