import itertools
import z3
import pdb
import z3helper

class Node(object):
    """Base class for nodes in the AST. When creating a subclass of Node, the
    methods that need to be implemented are:
    
    (a) the constructor which will call Node.__init__ with the appropriate
    nodetype.
    
    (b) _toZ3, this should convert the node into a Z3 expression. 

    (c) _toZ3Constraints(m), is a function that uses the input values to encode 
    the constraints using the distinguishing input values 'm'.
    
    (d) __str__, this should pretty-print the node.
    
    (e) _synthesize, this is an AST pass that looks at a model from Z3 and returns
    a simplified AST in which the choice variables have been assigned and
    eliminated according to this model. It also gets a set of Z3 clauses which
    are the conditions under which node is being evaluated.

    (f) childObjects() should be a generator that yields each of the "child" objects
    of this AST node.

    (g) rewrite() must be implemented to replace one of the child objects with
    an equivalent node.
    

    Additionally the following elements are also part of the "contract" for AST
    Nodes. 
        
    (a) obj.width must be defined for BitVector or BitVector like result types.
    (E.g., Z3Op on bitvectors, Extract and so on.) obj.awidth and obj.dwidth
    must be defined on Memory like types.

    (b) Make sure to clear the cache of Z3 objects (clearCache) before calling
    toZ3Constraints with different models.

    (c) Nodes are IMMUTABLE. Don't change their fields after they are created,
    instead create new nodes.

    (d) Override __eq__ and __hash__ as appropriate.
    """

    BOOLVAR         = 0
    BITVECVAR       = 1
    FUNCVAR         = 2
    BOOLVAL         = 3
    BITVECVAL       = 4
    MEMVAR          = 5
    BVINRANGE       = 6
    CHOICE          = 7
    CHOOSECONSEC    = 8
    READMEM         = 9
    WRITEMEM        = 10
    EXTRACT         = 11
    IF              = 12
    EXTRACTBIT      = 13
    CONCAT          = 14
    Z3OP            = 15
    MACRO           = 16
    APPLY           = 17
    NODE_TYPE_MAX   = 17

    def __init__(self, nodetype):
        """Constructor."""
        self.nodetype = nodetype
        self.z3objs = {}
        self.z3clauses = {}
        self.z3cnsts = {}
        self.z3clausesWCnsts = {}
        self.synMemo = None
        self.name = '_UnnamedObject'
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

    def isMem(self):
        "Predicate that returns true if the node is a memory."
        # This seems a bit ugly but is apparently the Python way
        try:
            w = self.awidth
            return True
        except AttributeError:
            return False

    def isFuncVar(self):
        "Predicate that returns true if the node is a FuncVar."
        return self.nodetype == Node.FUNCVAR

    def isBoolVal(self):
        "Predicate that returns true if the node is a BoolVal."
        return self.nodetype == Node.BOOLVAL

    def isBoolFalse(self):
        "Similar to isBoolVal but also checks if the value is true."
        return self.isBoolVal() and (not self.value)

    def isBoolTrue(self):
        "Similar to isBoolVal but also checks if the value is false."
        return self.isBoolVal() and (self.value)

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

    def _toZ3Constraints(self, prefix, m):
        """This method is called by toZ3() to perform the actual conversion
        of a node into a Z3 expression where the inputs are forced to be
        constants according to the model m."""
        err_msg = '_toZ3Constraints not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def toZ3(self, prefix=''):
        """Convert this node into a Z3 expression."""
        if prefix not in self.z3objs:
            self.z3objs[prefix] = self._toZ3(prefix)
        return self.z3objs[prefix]

    def toZ3Constraints(self, prefix, m):
        """Convert this node into a Z3 expression where the inputs are forced to
        be the constant values specified in the model m."""
        if prefix not in self.z3cnsts:
            self.z3cnsts[prefix] = self._toZ3Constraints(prefix, m)
        return self.z3cnsts[prefix]

    def z3Clauses(self, prefix):
        """Extra clauses that may need to be added to the SMT problem."""
        if prefix not in self.z3clauses:
            self.z3clauses[prefix] = self._z3Clauses(prefix)
        return self.z3clauses[prefix]

    def z3ClausesWithConstraints(self, prefix, m):
        """Extra clauses that may need to be added to the SMT problem."""
        if prefix not in self.z3clausesWCnsts:
            self.z3clausesWCnsts[prefix] = self._z3ClausesWithConstraints(prefix, m)
        return self.z3clausesWCnsts[prefix]

    def _z3Clauses(self, prefix):
        """Most AST nodes don't have anything special to be added."""
        exprs = []
        for c in self.childObjects():
            cz3 = c.z3Clauses(prefix)
            if cz3:
                exprs.append(cz3)

        if len(exprs) == 0:
            return None
        elif len(exprs) == 1:
            return exprs[0]
        else:
            assert len(exprs) >= 2
            return z3.And(*exprs)

    def _z3ClausesWithConstraints(self, prefix, m):
        exprs = []
        for c in self.childObjects():
            cz3 = c.z3ClausesWithConstraints(prefix, m)
            if cz3:
                exprs.append(cz3)

        if len(exprs) == 0:
            return None
        elif len(exprs) == 1:
            return exprs[0]
        else:
            assert len(exprs) >= 2
            return z3.And(*exprs)

    def synthesize(self, m):
        if self.synMemo is None:
            self.synMemo = self._synthesize(m)
        return self.synMemo
        
    def clearCache(self):
        """Clears the cache of Z3 objects maintained in this node."""
        self.z3objs = {}
        self.z3cnsts = {}
        self.synMemo = None
        self.z3clausesWCnsts = {}
        self.z3clauses = {}

        for c in self.childObjects():
            c.clearCache()

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            for c1, c2 in itertools.izip(self.childObjects(), other.childObjects()):
                if c1 != c2:
                    return False
            return True
        return NotImplemented

    def __ne__(self, other):
        if isinstance(other, self.__class__):
            return not self.__eq__(other)
        return NotImplemented

    def __hash__(self):
        return hash( (self.nodetype, self.name) + tuple(hash(ci) for ci in self.childObjects()))

    def childObjects(self):
        """Returns a generator that walks through each of the child objects of 
        this AST node."""
        err_msg = 'childObjects not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def apply(self, f):
        "Apply transformation f to this node and all its children."
        err_msg = 'apply not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def substitute(self, n, n_p):
        def f(n_x):
            if n_x == n:
                return n_p
            else:
                return n_x
        return self.apply(f)

    def rewrite(self, child, replacement):
        "Replace child node child with replacement."
        err_msg = 'rewrite not implemented in %s' % self.__class__.__name__
        raise NotImplementedError, err_msg

    def _synthesize(self, m):
        """Simplify this node according to the Z3 model m."""
        err_msg = '_synthesize not implemented in %s' % self.__class__.__name__
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

def _determineMemWidth(args):
    try:
        awidth = args[0].awidth
        dwidth = args[0].dwidth

        for a in args[1:]:
            try: 
                if a.awidth != awidth:
                    raise ValueError, 'Mismatch in address widths: %s' % ('; '.join([str(m) for m in args]))
                if a.dwidth != dwidth:
                    raise ValueError, 'Mismatch in data widths.'
            except AttributeError:
                raise ValueError, 'Could not find awidth and dwidth!'
        return awidth, dwidth
    except AttributeError:
        return -1, -1

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

    def _toZ3Constraints(self, prefix, m):
        value = m[self.name]
        return z3.BoolVal(value)

    def __str__(self):
        return '%s' % self.name

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            return self.name == other.name
        return NotImplemented

    def _synthesize(self, m):
        return BoolVar(self.name)

    def apply(self, f):
        return f(BoolVar(self.name))

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

class BitVecVar(Node):
    """Bitvector variables."""

    def __init__(self, name, width):
        Node.__init__(self, Node.BITVECVAR)
        self.name = name
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVec(self._getName(prefix), self.width)

    def _toZ3Constraints(self, prefix, m):
        value = m[self.name]
        return z3.BitVecVal(value, self.width)

    def __str__(self):
        return '%s' % (self.name)

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            return self.name == other.name and self.width == other.width
        return NotImplemented

    def _synthesize(self, m):
        return BitVecVar(self.name, self.width)

    def apply(self, f):
        return f(BitVecVar(self.name, self.width))

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

class FuncVar(Node):
    """Uninterpreted functions."""
    def __init__(self, name, iwidth, owidth):
        Node.__init__(self, Node.FUNCVAR)
        self.name = name
        self.iwidth = iwidth
        self.owidth = owidth

    def _toZ3sHelper(self, prefix, rfun):
        isort = z3.BitVecSort(self.iwidth)
        osort = z3.BitVecSort(self.owidth)
        return z3.Function(self._getName(prefix), isort, osort)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            return self.name == other.name and self.iwidth == other.iwidth and self.owidth == other.width
        return NotImplemented

    def __str__(self):
        return '(func %d %d)' % (self.iwidth, self.owidth)

    def _synthesize(self, m):
        return FuncVar(self.name, self.iwidth, self.owidth)

    def apply(self, f):
        return f(FuncVar(self.name, self.iwidth, self.owidth))

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

class BoolVal(Node):
    """Boolean constants."""
    def __init__(self, value):
        Node.__init__(self, Node.BOOLVAL)
        self.value = value
        self.width = -1

    def _toZ3(self, prefix):
        return z3.BoolVal(self.value)

    def _toZ3Constraints(self, prefix, m):
        return self._toZ3(prefix)

    def __str__(self):
        return 'true' if self.value else 'false'

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            return self.value == other.value
        return NotImplemented

    def __hash__(self):
        return hash((self.nodetype, self.value))

    def _synthesize(self, m):
        return BoolVal(self.value)
                
    def apply(self, f):
        return f(BoolVal(self.value))

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

class BitVecVal(Node):
    """BitVector Constants."""
    def __init__(self, value, width):
        Node.__init__(self, Node.BITVECVAL)
        self.value = value
        self.width = width

    def _toZ3(self, prefix):
        return z3.BitVecVal(self.value, self.width)

    def _toZ3Constraints(self, prefix, m):
        return self._toZ3(prefix)

    def __str__(self):
        return '(bv %d %d)' % (self.value, self.width)

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            return self.value == other.value and self.width == other.width
        return NotImplemented

    def __hash__(self):
        return hash((self.nodetype, self.value, self.width))

    def _synthesize(self, m):
        return BitVecVal(self.value, self.width)

    def apply(self, f):
        return f(BitVecVal(self.value, self.width))

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

def createConstantArray(awidth, dwidth, mem_values):
    asize = z3.BitVecSort(awidth)
    arr = z3.K(asize, z3.BitVecVal(mem_values[-1], dwidth))

    for [a, d] in mem_values[:-1]:
        az3 = z3.BitVecVal(a, awidth)
        dz3 = z3.BitVecVal(d, dwidth)
        arr = z3.Update(arr, az3, dz3)
    return arr

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
    
    def _toZ3Constraints(self, prefix, m):
        return createConstantArray(self.awidth, self.dwidth, m[self.name])

    def _synthesize(self, m):
        return MemVar(self.name, self.awidth, self.dwidth)

    def apply(self, f):
        return f(MemVar(self.name, self.awidth, self.dwidth))

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.name != other.name:
                return False
            if self.awidth != other.awidth:
                return False
            if self.dwidth != other.dwidth:
                return False
            return True
        return NotImplemented

    def __str__(self):
        return '%s' % (self.name)

    def childObjects(self):
        return
        yield

    def rewrite(self, child, replacement):
        # Nothing to replace.
        return

def _choiceBoolName(obj, prefix, i):
    return '_choice_%s_%s_%d_' % (prefix, obj.name, i)

class BVInRange(Node):
    """Select a bitvector within a range lo <= bv <= hi."""
    def __init__(self, name, lo, hi):
        assert lo.width == hi.width
        Node.__init__(self, Node.BVINRANGE)
        self.name = name
        self.lo = lo
        self.hi = hi
        self.width = lo.width

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.name != other.name:
                return False
            if self.lo != other.lo:
                return False
            if self.hi != other.hi:
                return False
            return True
        return NotImplemented

    def _toZ3sHelper(self, prefix, rfun):
        self.bitvec = z3.BitVec('_bv_in_range_%s_%s_' % (prefix, self.name), self.width)
        return self.bitvec
    
    def _z3Clauses(self, prefix):
        self.bitvec = z3.BitVec('_bv_in_range_%s_%s_' % (prefix, self.name), self.width)
        exprs = []

        loz3 = self.lo.toZ3(prefix)
        hiz3 = self.hi.toZ3(prefix)

        r1 = self.lo.z3Clauses(prefix)
        r2 = self.hi.z3Clauses(prefix)
        if r1: exprs.append(r1)
        if r2: exprs.append(r2)

        exprs.append(z3.ULE(loz3, self.bitvec))
        exprs.append(z3.ULE(self.bitvec, hiz3))

        return z3.And(*exprs)

    def _z3ClausesWithConstraints(self, prefix, m):
        self.bitvec = z3.BitVec('_bv_in_range_%s_%s_' % (prefix, self.name), self.width)
        exprs = []

        loz3 = self.lo.toZ3Constraints(prefix, m)
        hiz3 = self.hi.toZ3Constraints(prefix, m)

        r1 = self.lo.z3ClausesWithConstraints(prefix, m)
        r2 = self.hi.z3ClausesWithConstraints(prefix, m)
        if r1: exprs.append(r1)
        if r2: exprs.append(r2)

        exprs.append(z3.ULE(loz3, self.bitvec))
        exprs.append(z3.ULT(self.bitvec, hiz3))

        return z3.And(*exprs)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        vi = m[self.bitvec].as_long()
        return BitVecVal(vi, self.width)

    def apply(self, f):
        lo_ = self.lo.apply(f)
        hi_ = self.hi.apply(f)
        return f(BVInRange(self.name, lo_, hi_))


    def __str__(self):
        return '(bv-in-range %s %s %s)' % (self.name, str(self.lo), str(self.hi))

    def childObjects(self):
        yield self.lo
        yield self.hi

    def rewrite(self, child, replacement):
        if self.lo == child:
            self.lo = replacement
        if self.hi == child:
            self.hi = replacement

class Choice(Node):
    """A choice between a set of options."""
    def __init__(self, name, choiceVar, choices):
        # this bit of code eliminates spurious choices.
        # apparently it's not very useful.
        #if len(choices_) == 0:
        #    raise ValueError, 'Must have at least one choice!'
        #
        #choices = []
        #for c in choices_:
        #    if c not in choices:
        #        choices.append(c)
        
        Node.__init__(self, Node.CHOICE)
        self.name = name
        self.choiceVar = choiceVar
        self.choices = choices[:]
        width = _determineOpWidth(self.choices)
        if width != -1:
            self.width = width

        awidth, dwidth = _determineMemWidth(self.choices)
        if awidth != -1:
            self.awidth = awidth
            self.dwidth = dwidth

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.name != other.name:
                return False
            if self.choiceVar != other.choiceVar:
                return False
            if self.choices != other.choices:
                return False
            return True
        return NotImplemented

    def _toZ3sHelper(self, prefix, rfun):
        assert len(self.choices) >= 1

        self.choiceBools = []
        for i in xrange(len(self.choices)-1):
            # FIXME: names will repeat
            self.choiceBools.append(z3.Bool(_choiceBoolName(self, prefix, i)))

        def createIf(i):
            if i < len(self.choiceBools):
                cvi = self.choiceBools[i]
                return z3.If(cvi, rfun(self.choices[i], prefix), createIf(i+1))
            else:
                assert i == (len(self.choices) - 1)
                return rfun(self.choices[i], prefix)
        return createIf(0)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        for bi, ci in itertools.izip(self.choiceBools, self.choices):
            v = z3.is_true(m[bi])
            if v:
                ci_ = ci.synthesize(m)
                return ci_
        ci_ = self.choices[-1].synthesize(m)
        return ci_
        
    def apply(self, f):
        f_choices = [c.apply(f) for c in self.choices]
        return f(Choice(self.name, self.choiceVar, f_choices))

    def __str__(self):
        return '(choice %s [%s])' % (self.name, ' '.join(str(x) for x in self.choices))

    def childObjects(self):
        for c in self.choices:
            yield c

    def rewrite(self, child, replacement):
        choices = []
        for c in self.choices:
            if c == child:
                c = replacement
            choices.append(c)
        self.choices = choices

class Apply(Node):
    def __init__(self, fun, arg):
        Node.__init__(self, Node.APPLY)
        self.fun = fun
        self.arg = arg
        self.width = self.fun.owidth
    
    def _toZ3sHelper(self, prefix, rfun):
        fz3 = rfun(self.fun, prefix)
        az3 = rfun(self.arg, prefix)
        return fz3(az3)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def __str__(self):
        return '(apply %s %s)' % (str(self.fun), str(self.arg))

    def _synthesize(self, m):
        return Apply(self.fun.synthesize(m), self.arg.synthesize(m))

    def apply(self, f):
        return f(Apply(self.fun.apply(f), self.arg.apply(f)))

    def childObjects(self):
        yield self.fun
        yield self.arg

    def rewrite(self, child, replacement):
        if self.fun == child:
            self.fun = replacement
        if self.arg == child:
            self.arg = replacement

class ReadMem(Node):
    VALIDATE_SIZE = True

    """Read data from a memory."""
    def __init__(self, mem, addr):
        if ReadMem.VALIDATE_SIZE and addr.width != mem.awidth:
            err_msg = "Address width must be %d. Got %d instead." % (mem.awidth, addr.width)
            raise ValueError, err_msg

        Node.__init__(self, Node.READMEM)
        self.mem = mem
        self.addr = addr
        self.width = mem.dwidth

    def _toZ3sHelper(self, prefix, rfun):
        mz3 = rfun(self.mem, prefix)
        az3 = rfun(self.addr, prefix)
        return mz3[az3]

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def __str__(self):
        return '(read-mem %s %s)' % (str(self.mem), str(self.addr))

    def _synthesize(self, m):
        return ReadMem(self.mem.synthesize(m), self.addr.synthesize(m))

    def apply(self, f):
        m_f = self.mem.apply(f)
        a_f = self.addr.apply(f)
        return f(ReadMem(m_f, a_f))

    def childObjects(self):
        yield self.mem
        yield self.addr

    def rewrite(self, child, replacement):
        if self.mem == child:
            self.mem = replacement
        if self.addr == child:
            self.addr = replacement

class WriteMem(Node):
    """Write data to a memory."""
    def __init__(self, mem, addr, data):
        if ReadMem.VALIDATE_SIZE and addr.width != mem.awidth:
            err_msg = "Address width must be %d. Got %d instead." % (mem.awidth, addr.width)
            raise ValueError, err_msg
        if data.width != mem.dwidth:
            err_msg = "Data width must be %d. Got %d instead." % (mem.dwidth, data.width)
            raise ValueError, err_msg
        
        Node.__init__(self, Node.WRITEMEM)
        self.mem = mem
        self.name = mem.name
        self.addr = addr
        self.data = data
        self.awidth = self.mem.awidth
        self.dwidth = self.mem.dwidth

    def _toZ3sHelper(self, prefix, rfun):
        mz3 = rfun(self.mem, prefix)
        az3 = rfun(self.addr, prefix)
        dz3 = rfun(self.data, prefix)

        return z3.Update(mz3, az3, dz3)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        mem = self.mem.synthesize(m)
        addr = self.addr.synthesize(m)
        data = self.data.synthesize(m)
        return WriteMem(mem, addr, data)

    def apply(self, f):
        return f(WriteMem(self.mem.apply(f), self.addr.apply(f), self.data.apply(f)))


    def __str__(self):
        return '(write-mem %s %s %s)' % (self.mem, self.addr, self.data)

    def childObjects(self):
        yield self.mem
        yield self.addr
        yield self.data

    def rewrite(self, child, replacement):
        if self.mem == child:
            self.mem = replacement
        if self.addr == child:
            self.addr = replacement
        if self.data == child:
            self.data = replacement

class ChooseConsecBits(Node):
    """Choose k consecutive bits from a bitvector. """
    def __init__(self, name, numBits, bitvec):
        if bitvec.width <= numBits:
            raise ValueError, 'Bitvector too small!' 

        Node.__init__(self, Node.CHOOSECONSEC)
        self.name = name
        self.bitvec = bitvec
        self.width = numBits

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.name != other.name:
                return False
            if self.bitvec != other.bitvec:
                return False
            if self.width != other.width:
                return False
            return True
        return NotImplemented

    def _toZ3sHelper(self, prefix, rfun):
        self.choiceBools = []
        self.rangeStarts = []

        start = self.bitvec.width - 1
        stop = self.width - 1

        for bi in xrange(start, stop, -1):
            start_i = bi
            stop_i = bi - self.width + 1
            assert start_i <= self.bitvec.width
            assert stop_i >= 0

            boolName = '_chooseconsec_%s_%s_%d_' % (prefix, self.name, start_i)
            # FIXME: names will repeat
            self.choiceBools.append(z3.Bool(boolName))
            self.rangeStarts.append(start_i)

        def createIf(i):
            if i < len(self.choiceBools):
                cvi = self.choiceBools[i]
                starti = self.rangeStarts[i]
                stopi = starti - self.width + 1
                assert starti >= stopi
                expri = z3.Extract(starti, stopi, rfun(self.bitvec, prefix))
                return z3.If(cvi, expri, createIf(i+1))
            else:
                starti = self.width - 1
                stopi = 0
                assert starti >= stopi
                expri = z3.Extract(starti, stopi, rfun(self.bitvec, prefix))
                return expri
        return createIf(0)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
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

    def apply(self, f):
        return f(ChooseConsecBits(self.name, self.width, self.bitvec.apply(f)))

    def __str__(self):
        return '(choose-consec-bits %d %s)' % (self.width, str(self.bitvec))

    def childObjects(self):
        yield self.bitvec

    def rewrite(self, child, replacement):
        if self.bitvec == child:
            self.bitvec = replacement

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

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.bv != other.bv:
                return False
            if self.msb != other.msb:
                return False
            if self.lsb != other.lsb:
                return False
            return True
        return NotImplemented

    def _toZ3sHelper(self, prefix, rfun):
        return z3.Extract(self.msb, self.lsb, rfun(self.bv, prefix))

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        obj_ = Extract(self.msb, self.lsb, self.bv.synthesize(m))
        return obj_

    def apply(self, f):
        return f(Extract(self.msb, self.lsb, self.bv.apply(f)))

    def __str__(self):
        return '(extract %d %d %s)' % (self.msb, self.lsb, str(self.bv))

    def childObjects(self):
        yield self.bv


    def rewrite(self, child, replacement):
        if self.bv == child:
            self.bv = replacement

class If(Node):
    """Conditional."""

    def __init__(self, cond, exptrue, expfalse):
        Node.__init__(self, Node.IF)
        self.cond = cond
        self.exptrue = exptrue
        self.expfalse = expfalse
        width = _determineOpWidth([exptrue, expfalse])
        if width != -1:
            self.width = width
        awidth, dwidth = _determineMemWidth([exptrue, expfalse])
        if awidth != -1:
            self.awidth = awidth
            self.dwidth = dwidth

    def _toZ3sHelper(self, prefix, rfun):
        cz3 = rfun(self.cond, prefix)
        tz3 = rfun(self.exptrue, prefix)
        fz3 = rfun(self.expfalse, prefix)
        return z3.If(cz3, tz3, fz3)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        cm = self.cond.synthesize(m)
        tm = self.exptrue.synthesize(m)
        fm = self.expfalse.synthesize(m)

        cm.clearCache()
        cz3 = cm.toZ3()

        S = z3.Solver()
        S.add(cz3)
        if S.check() == z3.unsat:
            fm.clearCache()
            return fm

        S = z3.Solver()
        S.add(z3.Not(cz3))
        if S.check() == z3.unsat:
            tm.clearCache()
            return tm

        S = z3.Solver()
        tm.clearCache()
        fm.clearCache()
        tz3 = tm.toZ3()
        fz3 = fm.toZ3()
        S.add(z3.Distinct(tz3, fz3))
        if S.check() == z3.unsat:
            tm.clearCache()
            return tm

        obj_ = If(cm, tm, fm)
        return obj_

    def apply(self, f):
        return f(If(self.cond.apply(f), self.exptrue.apply(f), self.expfalse.apply(f)))

    def __str__(self):
        return '(if %s %s %s)' % (str(self.cond), str(self.exptrue), str(self.expfalse))

    def childObjects(self):
        yield self.cond
        yield self.exptrue
        yield self.expfalse

    def rewrite(self, child, replacement):
        if self.cond == child:
            self.cond = replacement
        if self.exptrue == child:
            self.exptrue = replacement
        if self.expfalse == child:
            self.expfalse = replacement


class ExtractBit(Node):
    """Extract a particular bit from a word."""
    def __init__(self, word, bit):

        msb = word.width - 1
        bsz = ilog2(word.width)
        if bit.width != bsz:
            raise ValueError, 'Bit-index width must be %d, is %d instead.' % (bsz, bit.width)

        Node.__init__(self, Node.EXTRACTBIT)
        self.word = word
        self.bit = bit
        self.width = 1
        self.bsz = bsz

    def _toZ3sHelper(self, prefix, rfun):
        msb = self.word.width - 1
        wz3 = rfun(self.word, prefix)
        bz3 = rfun(self.bit, prefix)

        def createIf(index):
            if index == msb:
                return z3.Extract(msb, msb, wz3)
            else:
                return z3.If(
                    bz3 == z3.BitVecVal(index, self.bsz), 
                    z3.Extract(index, index, wz3), 
                    createIf(index+1))
        return createIf(0)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        word_ = self.word.synthesize(m)
        bit_ = self.bit.synthesize(m)
        return ExtractBit(word_, bit_)

    def apply(self, f):
        return f(ExtractBit(self.word.apply(f), self.bit.apply(f)))

    def __str__(self):
        return '(extract-bit %s %s)' % (str(self.word), str(self.bit))

    def childObjects(self):
        yield self.word
        yield self.bit

    def rewrite(self, child, replacement):
        if self.word == child:
            self.word = replacement
        if self.bit == child:
            self.bit = replacement

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

    def _toZ3sHelper(self, prefix, rfun):
        return z3.Concat(*[rfun(bv, prefix) for bv in self.bitvecs])

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        bitvecs_ = [bv.synthesize(m) for bv in self.bitvecs]
        return Concat(*bitvecs_)

    def apply(self, f):
        f_bvs = [bv.apply(f) for bv in self.bitvecs]
        return f(Concat(*f_bvs))

    def __str__(self):
        return '(concat %s)' % (' '.join(str(bv) for bv in self.bitvecs))

    def childObjects(self):
        for bv in self.bitvecs:
            yield bv

    def rewrite(self, child, replacement):
        bitvecs = []
        for bv in self.bitvecs:
            if bv == child:
                bitvecs.append(replacement)
            else:
                bitvecs.append(bv)
        self.bitvecs = bitvecs


class Macro(Node):
    """This is a wrapper node that enhances readability when the AST's are
    pretty printed."""
    def __init__(self, typename, expr, inputs):
        Node.__init__(self, Node.MACRO)
        self.typename = typename
        self.expr = expr
        self.inputs = inputs[:]
        try:
            self.width = expr.width
            self.awidth = expr.awidth
            self.dwidth = expr.dwidth
        except AttributeError:
            pass

    def _toZ3(self, prefix):
        return self.expr.toZ3(prefix)

    def _toZ3Constraints(self, prefix, m):
        return self.expr.toZ3Constraints(prefix, m)

    def _synthesize(self, m):
        syn_inputs = [inp.synthesize(m) for inp in self.inputs]
        return Macro(self.typename, self.expr.synthesize(m), syn_inputs)

    def apply(self, f):
        return f(Macro(self.typename, self.expr.apply(f), self.inputs))

    def __str__(self):
        args = ' '.join(str(i) for i in self.inputs)
        return '(%s %s)' % (self.typename, args)

    def childObjects(self):
        yield self.expr

    def rewrite(self, child, replacement):
        if self.expr == child:
            self.expr = replacement

class Z3Op(Node):
    """Binary operators from Z3."""
    def __init__(self, opname, op, operands, rwidthFun, mwidthFun = None, params = None):
        """Constructor.
        
        - opname is the name of this operation (used for pretty-printing).
        - op is the (Z3 or wrapper over Z3) function that performs this 
          operation.
        - params are parameters passed to the function op before the
          real operands. (see below for an explanation of the difference
          between params and operands).
        - operands should be self-explanatory. 
        - rwidthFun is the function is used to compute the result-width
          of this operation.
        
        DIFFERENCE between params and operands:   
         
          - when defining a function like Add(op1, op2): op1 and op2 are
          operands and there are no parameters.
          - but suppose we want to define SignExt(5, op1); 5 is a parameter
            while op1 is the operand. 
          """

        Node.__init__(self, Node.Z3OP)
        self.op = op
        self.opname = opname
        self.params = params
        self.operands = operands[:]
        self.rwidthFun = rwidthFun
        self.mwidthFun = mwidthFun

        if self.params:
            width = self.rwidthFun(self.params, self.operands)
        else:
            width = self.rwidthFun(self.operands)

        if width != -1:
            self.width = width

        if self.mwidthFun:
            awidth, dwidth = self.mwidthFun(self.operands)
            if awidth != -1:
                self.awidth = awidth
                self.dwidth = dwidth

    def _toZ3sHelper(self, prefix, rfun):
        args = [rfun(x, prefix) for x in self.operands]
        if self.params:
            return self.op(*(self.params + args))
        else:
            return self.op(*args)

    def _toZ3(self, prefix):
        rfun = lambda n, prefix : n.toZ3(prefix)
        return self._toZ3sHelper(prefix, rfun)

    def _toZ3Constraints(self, prefix, m):
        rfun = lambda n, prefix : n.toZ3Constraints(prefix, m)
        return self._toZ3sHelper(prefix, rfun)

    def _synthesize(self, m):
        obj_ = Z3Op(self.opname, self.op, [o.synthesize(m) for o in self.operands], self.rwidthFun, self.mwidthFun, self.params)
        return obj_

    def apply(self, f):
        f_ops = [op.apply(f) for op in self.operands]
        return Z3Op(self.opname, self.op, f_ops, self.rwidthFun, self.mwidthFun, self.params)


    def __eq__(self, other):
        if isinstance(other, self.__class__):
            if self.nodetype != other.nodetype:
                return False
            if self.opname != other.opname:
                return False
            if self.params != other.params:
                return False
            if self.operands != other.operands:
                return False
            return True
        return NotImplemented

    def __str__(self):
        argstr = ' '.join(str(x) for x in self.operands)
        if self.params:
            paramstr = ' '.join(str(x) for x in self.params)
            return '(%s %s %s)' % (self.opname, paramstr, argstr)
        else:
            return '(%s %s)' % (self.opname, argstr)

    def childObjects(self):
        for op in self.operands:
            yield op

    def rewrite(self, child, replacement):
        operands = []
        for op in self.operands:
            if op == child:
                operands.append(replacement)
            else:
                operands.append(op)

def And(*operands):
    return Z3Op('and', z3.And, operands, _noWidth)

def Or(*operands):
    return Z3Op('or', z3.Or, operands, _noWidth)

def Not(op):
    return Z3Op('not', z3.Not, [op], _noWidth)

def Xor(op):
    return Z3Op('xor', z3.Xor, operands, _noWidth)

def Add(op1, op2):
    return Z3Op('add', z3helper.z3Add, [op1, op2], _determineOpWidth)

def Sub(op1, op2):
    return Z3Op('sub', z3helper.z3Sub, [op1, op2], _determineOpWidth)

def Neg(op):
    return Z3Op('neg', z3helper.z3Neg, [op], _determineOpWidth)

def Distinct(op1, op2):
    return Z3Op('distinct', z3.Distinct, [op1, op2], _determineOpWidth)

def Equal(op1, op2):
    return Z3Op('eq', z3helper.z3Eq, [op1, op2], _noWidth)

def RotateRight(op):
    return Z3Op('rr', z3helper.z3RR, [op], _determineOpWidth)

def RotateLeft(op):
    return Z3Op('rl', z3helper.z3RL, [op], _determineOpWidth)

def SLT(op1, op2):
    return Z3Op('slt', z3helper.z3SLT, [op1, op2], _noWidth)

def SGT(op1, op2):
    return Z3Op('sgt', z3helper.z3SGT, [op1, op2], _noWidth)

def ULT(op1, op2):
    return Z3Op('ult', z3.ULT, [op1, op2], _noWidth)

def UGT(op1, op2):
    return Z3Op('ugt', z3.UGT, [op1, op2], _noWidth)

def ULE(op1, op2):
    return Z3Op('ule', z3.ULE, [op1, op2], _noWidth)

def UGE(op1, op2):
    return Z3Op('uge', z3.UGE, [op1, op2], _noWidth)

def _extendWidth(params, ops):
    assert len(params) == 1
    assert len(ops) == 1
    [n], [op] = params, ops
    return op.width + n

def ZeroExt(op, n):
    return Z3Op('zero-ext', z3.ZeroExt, [op], _extendWidth, params=[n])

def SignExt(op, n):
    return Z3Op('sign-ext', z3.SignExt, [op], _extendWidth, params=[n])

def LShift(op1, op2):
    return Z3Op('lshift', z3helper.z3LShift, [op1, op2], _determineOpWidth)

def RShift(op1, op2):
    return Z3Op('rshift', z3helper.z3RShift, [op1, op2], _determineOpWidth)

def Complement(op):
    return Z3Op('cpl', z3helper.z3Complement, [op], _determineOpWidth)

def BVAnd(op1, op2):
    return Z3Op('bvand', z3helper.z3BVAnd, [op1, op2], _determineOpWidth)

def BVOr(op1, op2):
    return Z3Op('bvor', z3helper.z3BVOr, [op1, op2], _determineOpWidth)

def BVXor(op1, op2):
    return Z3Op('bvxor', z3helper.z3BVXor, [op1, op2], _determineOpWidth)

def BVXnor(op1, op2):
    return Z3Op('bvxnor', z3helper.z3BVXnor, [op1, op2], _determineOpWidth)

def BVDiv(op1, op2):
    return Z3Op('bvdiv', z3.UDiv, [op1, op2], _determineOpWidth)

def BVRem(op1, op2):
    return Z3Op('bvrem', z3.URem, [op1, op2], _determineOpWidth)

def BVMul(op1, op2):
    return Z3Op('bvmul', z3helper.z3Mul, [op1, op2], _determineOpWidth);

# Utility function.
def ilog2(x):
    lg = 0
    while True:
        x = x >> 1
        if x == 0: 
            break
        lg += 1
    return lg
