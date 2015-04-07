#! /usr/bin/python2.7

from ast import *
from cPickle import Unpickler
import sys

def readAST(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        opcode = pk.load()
        print 'opcode: %02x' % opcode
        while True:
            try:
                name = pk.load()
                ast = pk.load()
                print '%s\n%s\n' % (name, str(ast))
            except EOFError:
                break

if __name__ == '__main__':
    readAST(sys.argv[1])
