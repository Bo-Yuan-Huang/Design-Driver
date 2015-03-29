import z3

def BVRedAnd(a):
    return z3.BitVecRef(z3.Z3_mk_bvredand(a.ctx_ref(), a.as_ast()), a.ctx)

def BVXnor(a, b):
    return z3.BitVecRef(z3.Z3_mk_bvxnor(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)
