import itertools
from z3 import *
from z3helper import *


# DSL feature set
#
# - thin layer over SMT
# - clean way of representing both variables and formulas
# - choice operator
# - bit-select-operator
# - what else?
# - Must extract the solution once the synthesis
#   is done. Means we need our own AST!


# How do we define our AST in Python?
# 
# What we want to write:
#
# Opcode = Input('Opcode', 24)
# Op0 = Extract(Opcode,  0,  7)
# Op1 = Extract(Opcode,  8, 15)
# Op2 = Extract(Opcode, 16, 23)
# PC = Input('PC', 16)
# A  = Input('ACC', 8)
# PSW = Input('PSW', 8)
# ...
# RAM = InputArray('RAM', 8, 256)
#
# PCp1 = Add(PC, 1)
# ...
# RPC1 = Add(PC, SignExt(Op1, 16))
# ...
# CarryBit = ChooseBit(PSW)
# JC_PC = If(CarryBit, Choice(Op0, RPC1, RPC2), Choice(Op0, PCp1, PCp2))
# ...
# Output = Choice(
#               Op0,
#               Choices(
#                   PCp1, 
#                   PCp2,
#                   PCp3,
#                   LJMP_PC,
#                   JC_PC,
#                   ...
#               )
#           )
# 

class Node(object):
    """Base class for nodes in the AST."""
    NODE_TYPE_MIN   = 0
    BOOL            = 0
    BITVEC          = 1
    CHOICE          = 2
    PLUS            = 3
    NODE_TYPE_MAX   = 3

    def __init__(self, nodetype):
        assert nodetype >= Node.NODE_TYPE_MIN
        assert nodetype <= Node.NODE_TYPE_MAX
        self.nodetype = nodetype

    def declare(self, prefix='', ctx=None):
        err_msg = 'Declare not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

class BoolVar(Node):
    """Boolean variables."""
    def __init__(self, name):
        Node.__init__(self, Node.BOOL)
        self.name = name

    def declare(self, prefix='', ctx=None):
        prefstr = prefix + '__' if len(prefix) > 0 else ''
        declname = prefstr + self.name
        if ctx == None:
            ctx = z3.main_ctx()
        return z3.Bool(declname, ctx)

    def __str__(self):
        return 'bool(%s)' % self.name

class BitVecVar(Node):
    """Bitvector variables."""

    def __init__(self, name, width):
        Node.__init__(self, Node.BITVEC)
        self.name = name
        self.width = width

    def declare(self, prefix='', ctx=None):
        prefstr = prefix + '__' if len(prefix) > 0 else ''
        declname = prefstr + self.name
        if ctx == None:
            ctx = z3.main_ctx()
        return z3.BitVec(declname, self.width, ctx)

    def __str__(self):
        return 'bitvec(%s, %d)' % (self.name, self.width)

def test_AST():
    v1 = BoolVar('b1')
    v2 = BitVecVar('b2', 16)
    assert str(v1) == 'bool(b1)'
    assert str(v2) == 'bitvec(b2, 16)'
    print 'Var assertions passed.'


if __name__ == '__main__':
    test_AST()

