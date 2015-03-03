import itertools
import z3
import pdb
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
    """Base class for nodes in the AST. When creating a subclass of Node, the
    methods that need to be implemented are:
    
    (a) the constructor which will call Node.__init__ with the appropriate
    nodetype.
    
    (b) _toZ3, this should convert the node into a Z3 expression. The argument
    recToZ3() is the function that is called on recursive calls. This layer of
    indirection makes it easier to implement _toZ3() _toZ3Clauses(m) using the
    same code.

    (c) _toZ3Constraints(m), is a function that uses the input values to encode 
    the constraints using the distinguishing input values 'm'.
    
    (d) __str__, this should pretty-print the node.
    
    (e) synthesize, this is an AST pass that looks at a model from Z3 and returns
    a simplified AST in which the choice variables have been assigned and
    eliminated according to this model. 

    Additionally the following elements are also part of the "contract" for AST
    Nodes. 
        
    (a) obj.width must be defined for BitVector or BitVector like result types.
    (E.g., Z3Op on bitvectors, Extract and so on.)"""

    NODE_TYPE_MIN   = 0
    BOOLVAR         = 0
    BITVECVAR       = 1
    BITVECVAL       = 2
    MEMVAR          = 3
    CHOICE          = 4
    CHOOSECONSEC    = 5
    READMEM         = 6
    WRITEMEM        = 7
    EXTRACT         = 8
    CONCAT          = 9
    Z3OP            = 10
    NODE_TYPE_MAX   = 10

    def __init__(self, nodetype):
        """Constructor."""
        assert nodetype >= Node.NODE_TYPE_MIN
        assert nodetype <= Node.NODE_TYPE_MAX
        self.nodetype = nodetype
        self.z3obj = None
        self.z3prefix = ''
        self.name = '$UnnamedObject'
        self.is_input = False

    def isVar(self):
        """This is a predicate that returns true if the node is
        of type variable (BoolVar, BitVecVar etc.)"""
        return (
            self.nodetype == Node.BOOLVAR       or 
            self.nodetype == Node.BITVECVAR     or
            self.nodetype == Node.MEMVAR
        )

    def isBitVecVar(self):
        "Predicate that returns true if the node is a BitVecVar."
        return self.nodetype == Node.BITVECVAR

    def isBoolVar(self):
        "Predicate that returns true if the node is a BoolVar."
        return self.nodetype == Node.BOOLVAR

    def isMemVar(self):
        "Predicate that returns true if the node is a MemVar."
        return self.nodetype == Node.MEMVAR

    def _getName(self, prefix):
        """A private function called that prefixes names as required."""
        need_prefix = len(prefix) > 0 and (not self.is_input)
        prefstr = prefix + '__' if need_prefix else ''
        return prefstr + self.name

    def _toZ3(self, rfun):
        """This method is called by toZ3() to perform the actual conversion
        of a node into a Z3 expression."""
        err_msg = '_toZ3 not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def toZ3(self, prefix=''):
        """Convert this node into a Z3 expression."""
        if self.z3obj is None or (self.z3prefix != prefix and (not self.is_input)):
            self.z3obj = self._toZ3(prefix)
            self.z3prefix = prefix
        return self.z3obj

    def synthesize(self, m):
        """Simplify this node according to the Z3 model m."""
        err_msg = 'synthesize not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

def _determineOpWidth(ops):
    """This helper function walks through the array 'ops' and 
    returns the width of each element in the array. If all the 
    elements do not have a width attribute, it will just return
    -1. It raises an exception if all the elements do not have
    the same width. """
    width = -1
    first = True
    for op in ops:
        try:
            wi = op.width
            if first:
                width = wi
            else:
                if width != wi:
                    msg ='Operands have differing widths: %d and %d.' % (width, wi) 
                    raise ValueError, msg
        except AttributeError:
            if width != -1:
                msg ='Operands have differing widths: %d and no width.' % (width) 
                raise ValueError, msg
        first = False
    return width

def _noWidth(ops):
    """Helper function that is used when the result of an operation has
    "no" width (i.e., it is a boolean)."""
    return -1

class BoolVar(Node):
    """Boolean variables."""
    def __init__(self, name):
        Node.__init__(self, Node.BOOLVAR)
        self.name = name

    def _toZ3(self, prefix):
        return z3.Bool(self._getName(prefix))

    def __str__(self):
        return '(def-bool %s)' % self.name

    def synthesize(self, m):
        return self

class BitVecVar(Node):
    """Bitvector variables."""

    def __init__(self, name, width):
        Node.__init__(self, Node.BITVECVAR)
        self.name = name
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVec(self._getName(prefix), self.width)

    def __str__(self):
        return '(def-bitvec %s %d)' % (self.name, self.width)

    def synthesize(self, m):
        return self

class BitVecVal(Node):
    """BitVector Constants."""
    def __init__(self, value, width):
        Node.__init__(self, Node.BITVECVAL)
        self.value = value
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVecVal(self.value, self.width)

    def __str__(self):
        return '(bitvecval %d %d)' % (self.value, self.width)

    def synthesize(self, m):
        return self

class MemVar(Node):
    """A memory abstraction."""
    def __init__(self, name, awidth, dwidth):
        """Constructor.

        awidth is the width of the address lines.
        dwidth is the width of the data lines."""
        Node.__init__(self, Node.MEMVAR)
        self.name = name
        self.awidth = awidth
        self.dwidth = dwidth

    def _toZ3(self, prefix):
        asize = z3.BitVecSort(self.awidth)
        dsize = z3.BitVecSort(self.dwidth)
        return z3.Array(self._getName(prefix), asize, dsize)
    
    def synthesize(self, m):
        return self

    def __str__(self):
        return '(def-mem %s %d %d)' % (self.name, self.awidth, self.dwidth)

class Choice(Node):
    """A choice between a set of options."""
    def __init__(self, name, choiceVar, choices):
        Node.__init__(self, Node.CHOICE)
        self.name = name
        self.choiceVar = choiceVar
        self.choices = choices[:]
        width = _determineOpWidth(self.choices)
        if width != -1:
            self.width = width

    def _toZ3(self, prefix):
        assert len(self.choices) > 1

        self.choiceBools = []
        for i in xrange(len(self.choices)-1):
            # FIXME: names will repeat
            boolName = '$choice_%s_%s_%d_' % (prefix, self.name, i)
            self.choiceBools.append(z3.Bool(boolName))

        def createIf(i):
            if i < len(self.choiceBools):
                cvi = self.choiceBools[i]
                return z3.If(cvi, self.choices[i].toZ3(prefix), createIf(i+1))
            else:
                assert i == (len(self.choices) - 1)
                return self.choices[i].toZ3(prefix)
        return createIf(0)

    def synthesize(self, m):
        assert len(self.choiceBools) > 0
        for bi, ci in itertools.izip(self.choiceBools, self.choices):
            v = z3.is_true(m[bi])
            if v:
                ci_ = ci.synthesize(m)
                return ci_
        ci_ = self.choices[-1].synthesize(m)
        return ci_
        
    def __str__(self):
        return '(choice %s [%s])' % (self.name, ' '.join(str(x) for x in self.choices))

class ReadMem(Node):
    """Read data from a memory."""
    def __init__(self, mem, addr):
        if addr.width != mem.dwidth:
            err_msg = "Address width must be %d. Got %d instead." % (mem.awidth, addr.width)
            raise ValueError, err_msg

        Node.__init__(self, Node.READMEM)
        self.mem = mem
        self.addr = addr
        self.width = mem.dwidth

    def _toZ3(self, prefix):
        mz3 = self.mem.toZ3(prefix)
        az3 = self.addr.toZ3(prefix)
        return mz3[az3]

    def __str__(self):
        return '(read-mem %s %s)' % (str(self.mem), str(self.addr))

    def synthesize(self, m):
        return ReadMem(self.mem.synthesize(m), self.addr.synthesize(m))

class ChooseConsecBits(Node):
    """Choose k consecutive bits from a bitvector. """
    def __init__(self, name, numBits, bitvec):
        if bitvec.width <= numBits:
            raise ValueError, 'Bitvector too small!' 

        Node.__init__(self, Node.CHOOSECONSEC)
        self.name = name
        self.bitvec = bitvec
        self.width = numBits

    def _toZ3(self, prefix):
        self.choiceBools = []
        self.rangeStarts = []

        start = self.bitvec.width - 1
        stop = self.width - 1

        for bi in xrange(start, stop, -1):
            start_i = bi
            stop_i = bi - self.width + 1
            assert start_i <= self.bitvec.width
            assert stop_i >= 0

            boolName = '$chooseconsec_%s_%s_%d_' % (prefix, self.name, start_i)
            # FIXME: names will repeat
            self.choiceBools.append(z3.Bool(boolName))
            self.rangeStarts.append(start_i)

        def createIf(i):
            if i < len(self.choiceBools):
                cvi = self.choiceBools[i]
                starti = self.rangeStarts[i]
                stopi = starti - self.width + 1
                assert starti >= stopi
                expri = z3.Extract(starti, stopi, self.bitvec.toZ3(prefix))
                return z3.If(cvi, expri, createIf(i+1))
            else:
                starti = self.width - 1
                stopi = 0
                assert starti >= stopi
                expri = z3.Extract(starti, stopi, self.bitvec.toZ3(prefix))
                return expri
        return createIf(0)

    def synthesize(self, m):
        # we have to evaluate the choice bits and then return th
        # appropriate extracted subpart.
        assert len(self.choiceBools) > 0
        for bi, start_i in itertools.izip(self.choiceBools, self.rangeStarts):
            v = z3.is_true(m[bi])
            if v:
                stop_i = start_i - self.width + 1
                extr_i = Extract(start_i, stop_i, self.bitvec.synthesize(m))
                return extr_i
        extr = Extract(self.width - 1, 0, self.bitvec.synthesize(m))
        return extr

    def __str__(self):
        return '(choose-consec-bits %d %s)' % (self.width, str(self.bitvec))

class Extract(Node):
    """Extract bits from a bitvector."""

    def __init__(self, msb, lsb, bv):
        if msb < lsb:
            raise ValueError, 'MSB must be greater than or equal to LSB.'

        Node.__init__(self, Node.EXTRACT)
        self.bv = bv
        self.msb = msb
        self.lsb = lsb
        self.width = self.msb - self.lsb + 1

    def _toZ3(self, prefix):
        return z3.Extract(self.msb, self.lsb, self.bv.toZ3(prefix))

    def synthesize(self, m):
        obj_ = Extract(self.msb, self.lsb, self.bv.synthesize(m))
        return obj_

    def __str__(self):
        return '(extract %d %d %s)' % (self.msb, self.lsb, str(self.bv))

class Concat(Node):
    """Concatenate bitvectors."""
    def __init__(self, *bitvecs):
        if len(bitvecs) <= 1:
            raise ValueError, "Must have at least 2 bitvectors when concatenating."
        Node.__init__(self, Node.CONCAT)
        self.bitvecs = bitvecs[:]
        self.width = 0
        for bv in self.bitvecs:
            try:
                self.width += bv.width
            except AttributeError:
                raise AttributeError, 'Expect bitvector-like objects as arguments to Concat. Got %s instead.' % str(bv)

    def _toZ3(self, prefix):
        return z3.Concat(*[bv.toZ3(prefix) for bv in self.bitvecs])

    def synthesize(self, m):
        bitvecs_ = [bv.synthesize(m) for bv in self.bitvecs]
        return Concat(*bitvecs_)

    def __str__(self):
        return '(concat %s)' % (' '.join(str(bv) for bv in self.bitvecs))

class Z3Op(Node):
    """Binary operators from Z3."""
    def __init__(self, opname, op, operands, rwidthFun):
        """Constructor.
        
        - opname is the name of this operation (used for pretty-printing).
        - op is the (Z3 or wrapper over Z3) function that performs this 
          operation.
        - operands should be self-explanatory.
        - rwidthFun is the function is used to compute the result-width
          of this operation."""


        Node.__init__(self, Node.Z3OP)
        self.op = op
        self.opname = opname
        self.operands = operands[:]
        self.rwidthFun = rwidthFun

        width = self.rwidthFun(self.operands)
        if width != -1:
            self.width = width

    def _toZ3(self, prefix):
        return self.op(*[x.toZ3(prefix) for x in self.operands])

    def synthesize(self, m):
        obj_ = Z3Op(self.opname, self.op, [o.synthesize(m) for o in self.operands], self.rwidthFun)
        return obj_

    def __str__(self):
        return '(%s %s)' % (self.opname, ' '.join(str(x) for x in self.operands))

def And(*operands):
    return Z3Op('and', z3.And, operands, _noWidth)

def Or(*operands):
    return Z3Op('or', z3.Or, operands, _noWidth)

def Not(op):
    return Z3Op('not', z3.Not, [op], _noWidth)

def Xor(op):
    return Z3Op('xor', z3.Xor, operands, _noWidth)

def Add(*operands):
    return Z3Op('add', BVAdd, operands, _determineOpWidth)

def Sub(*operands):
    return Z3Op('sub', BVSub, operands, _determineOpWidth)

def Neg(operand):
    return Z3Op('neg', BVNeg, [operand], _determineOpWidth)

def Distinct(op1, op2):
    return Z3Op('distinct', z3.Distinct, [op1, op2], _determineOpWidth)

def Equal(op1, op2):
    return Z3Op('eq', Z3Equal, [op1, op2], _determineOpWidth)

