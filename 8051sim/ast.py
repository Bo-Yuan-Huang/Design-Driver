import itertools
import z3
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
    """Base class for nodes in the AST. When creating a subclass
    of Node, the methods that need to be implemented are:
    
    (a) the constructor which will call Node.__init__ with
        the appropriate nodetype.
    
    (b) _toZ3, this should convert the node into a Z3 expression.
    
    (c) __str__, this should pretty-print the node.
    
    (d) simplify, this looks at a model from Z3 and returns a simplified
    AST in which the choice variables have been assigned and eliminated
    according to this model. This need not be implemented for "leaf" nodes, 
    examples of leaf nodes being boolean and bitvector variables."""

    NODE_TYPE_MIN   = 0
    BOOLVAR         = 0
    BITVECVAR       = 1
    BITVECVAL       = 2
    CHOICE          = 3
    EXTRACT         = 4
    Z3OP            = 5
    NODE_TYPE_MAX   = 5

    def __init__(self, nodetype):
        """Constructor."""
        assert nodetype >= Node.NODE_TYPE_MIN
        assert nodetype <= Node.NODE_TYPE_MAX
        self.nodetype = nodetype
        self.z3obj = None
        self.z3prefix = ''
        self.name = 'UnnamedObject'
        self.is_input = False

    def _getName(self, prefix):
        """A private function called that prefixes names as required."""
        need_prefix = len(prefix) > 0 and (not self.is_input)
        prefstr = prefix + '__' if need_prefix else ''
        return prefstr + self.name

    def _toZ3(self, prefix):
        """This method is called by toZ3() to perform the actual conversion
        of a node into a Z3 expression."""
        err_msg = '_toZ3 not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def toZ3(self, prefix=''):
        """Convert this node into a Z3 expression."""
        if self.z3obj is None or self.z3prefix != prefix:
            self.z3obj = self._toZ3(prefix)
            self.z3prefix = prefix
        return self.z3obj

    def simplify(self, m):
        """Simplify this node according to the Z3 model m."""
        return self

class BoolVar(Node):
    """Boolean variables."""
    def __init__(self, name):
        Node.__init__(self, Node.BOOLVAR)
        self.name = name

    def _toZ3(self, prefix):
        return z3.Bool(self._getName(prefix))

    def __str__(self):
        return 'bool(%s)' % self.name

class BitVecVar(Node):
    """Bitvector variables."""

    def __init__(self, name, width):
        Node.__init__(self, Node.BITVECVAR)
        self.name = name
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVec(self._getName(prefix), self.width)

    def __str__(self):
        return 'bitvec(%s, %d)' % (self.name, self.width)

class BitVecVal(Node):
    """BitVector Constants."""
    def __init__(self, value, width):
        Node.__init__(self, Node.BITVECVAL)
        self.value = value
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVecVal(self.value, self.width)

    def __str__(self):
        return 'bitvec(%d, %d)' % (self.value, self.width)

class Choice(Node):
    """A choice between a set of options."""
    def __init__(self, name, choiceVar, choices):
        Node.__init__(self, Node.CHOICE)
        self.name = name
        self.choiceVar = choiceVar
        self.choices = choices

    def _toZ3(self, prefix):
        assert len(self.choices) > 1

        self.choiceBools = []
        for i in xrange(len(self.choices)-1):
            boolName = '%s__%s__choice__%d' % (prefix, self.name, i)
            self.choiceBools.append(z3.Bool(boolName))

        def createIf(i):
            if i < len(self.choiceBools):
                cvi = self.choiceBools[i]
                return z3.If(cvi, self.choices[i].toZ3(prefix), createIf(i+1))
            else:
                assert i == (len(self.choices) - 1)
                return self.choices[i].toZ3(prefix)
        return createIf(0)

    def simplify(self, m):
        assert len(self.choiceBools)
        for bi, ci in itertools.izip(self.choiceBools, self.choices):
            v = z3.is_true(m[bi])
            if v:
                ci_ = ci.simplify(m)
                return ci_
        ci_ = self.choices[-1].simplify(m)
        return ci_
        
    def __str__(self):
        return 'Choice(%s, [%s])' % (self.name, ', '.join(str(x) for x in self.choices))

class Extract(Node):
    """Extract bits from a bitvector."""

    def __init__(self, msb, lsb, bv):
        Node.__init__(self, Node.EXTRACT)
        self.bv = bv
        self.msb = msb
        self.lsb = lsb

    def _toZ3(self, prefix):
        return z3.Extract(self.msb, self.lsb, self.bv.toZ3(prefix))

    def simplify(self, m):
        obj_ = Extract(self.msb, self.lsb, self.bv.simplify(m))
        return obj_

    def __str__(self):
        return 'Extract(%d, %d, %s)' % (self.msb, self.lsb, str(self.bv))

class Z3Op(Node):
    """Binary operators from Z3."""
    def __init__(self, opname, op, operands):
        Node.__init__(self, Node.Z3OP)
        self.op = op
        self.opname = opname
        self.operands = operands

    def _toZ3(self, prefix):
        return self.op(*[x.toZ3(prefix) for x in self.operands])

    def simplify(self, m):
        obj_ = Z3Op(self.opname, self.op, [o.simplify(m) for o in self.operands])
        return obj_

    def __str__(self):
        return '%s(%s)' % (self.opname, ', '.join(str(x) for x in self.operands))

def And(*operands):
    return Z3Op('and', z3.And, operands)

def Or(*operands):
    return Z3Op('or', z3.Or, operands)

def Not(op):
    return Z3Op('not', z3.Not, [op])

def Xor(op):
    return Z3Op('xor', z3.Xor, operands)

def Add(*operands):
    return Z3Op('add', BVAdd, operands)

def Sub(*operands):
    return Z3Op('sub', BVSub, operands)

def Neg(operand):
    return Z3Op('neg', BVNeg, [operand])

def Distinct(op1, op2):
    return Z3Op('distinct', z3.Distinct, [op1, op2])

def Equal(op1, op2):
    return Z3Op('eq', Z3Equal, [op1, op2])

