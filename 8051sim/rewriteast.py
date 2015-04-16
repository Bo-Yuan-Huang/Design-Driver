#! /usr/bin/python2.7

import ast
from cPickle import Pickler, Unpickler
import sys
import z3
import os


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

def rewriteAST(name, n):
    if 'width' in n.__dict__:
        inp = ast.BitVecVar(name, n.width)
        if inp == n:
            return n
        else:
            S = z3.Solver()
            y = z3.Bool('y')
            S.add(y == z3.Distinct(inp.toZ3(), n.toZ3()))
            if S.check(y) == z3.unsat:
                inp.clearCache()
                return inp
            else:
                n.clearCache()
                return n
    else:
        return n

def main(argv):
    files = [os.path.join(argv[1], f) for f in os.listdir(argv[1]) if f.startswith('syn8051_r1')]

    for f in files:
        opcode, name, ast = readAST(f)
        ast_p = rewriteAST(name, ast)
        if ast_p != ast:
            print hex(opcode), name
            print 'ast:', ast
            print 'ast\':', ast_p
            writeAST(f, opcode, name, ast_p)

if __name__ == '__main__':
    main(sys.argv)
