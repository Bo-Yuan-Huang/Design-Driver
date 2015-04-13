#! /usr/bin/python2.7

from ast import *
from cPickle import Pickler, Unpickler
import sys

def readAST(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        opcode = pk.load()
        while True:
            try:
                name = pk.load()
                ast = pk.load()
            except EOFError:
                break

        return opcode, name, ast

def writeAST(filename, opcode, name, ast):
    with open(filename, 'wb') as f:
        pk = Pickler(f, -1)
        pk.dump(opcode)
        pk.dump(name)
        pk.dump(ast)

def rewriteAST(n):
    if isinstance(n, WriteMem):
        n.nodetype = Node.WRITEMEM
    for c in n.childObjects():        
        rewriteAST(c)

if __name__ == '__main__':
    opcode, name, ast = readAST(sys.argv[1])
    rewriteAST(ast)
    writeAST(sys.argv[1], opcode, name, ast)
