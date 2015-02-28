from z3 import *

def _mkBVBinOp(op, *xs):
    assert len(xs) >= 2
    si = BitVecRef(op(xs[0].ctx_ref(), xs[0].as_ast(), xs[1].as_ast()), xs[0].ctx)
    for i in xrange(2, len(xs)):
        xi = xs[i]
        si = BitVecRef(op(si.ctx_ref(), si.as_ast(), xi.as_ast()), si.ctx)
    return si

def _mkBVUnOp(op, x):
    return BitVecRef(op(x.ctx_ref(), x.as_ast()), x.ctx)

def BVAdd(*xs):
    return _mkBVBinOp(Z3_mk_bvadd, *xs)

def BVSub(*xs):
    return _mkBVBinOp(Z3_mk_bvsub, *xs)

def BVNeg(x):
    return _mkBVUnOp(Z3_mk_bvneg, x)

def Z3Equal(a, b):
    return BoolRef(Z3_mk_eq(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)

def BVRedAnd(a):
    return BitVecRef(Z3_mk_bvredand(a.ctx_ref(), a.as_ast()), a.ctx)

def BVXnor(a, b):
    return BitVecRef(Z3_mk_bvxnor(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)
