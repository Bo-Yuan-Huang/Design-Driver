import z3

# These functions are used in the definition all the operators defined using
# ast.Z3Op. Ideally we would've just used lambda's define them but
# unfortunately this does not work, because pickle cannot handle lambdas!
# So we are forced to define each function individually.

def BVRedAnd(a):
    return z3.BitVecRef(z3.Z3_mk_bvredand(a.ctx_ref(), a.as_ast()), a.ctx)

def BVXnor(a, b):
    return z3.BitVecRef(z3.Z3_mk_bvxnor(a.ctx_ref(), a.as_ast(), b.as_ast()), a.ctx)
    
def z3Add(op1, op2): 
    return op1 + op2

def z3Sub(op1, op2): 
    return op1 - op2

def z3Neg(op): 
    return -op

def z3Eq(op1, op2): 
    return op1 == op2

def z3RR(op): 
    return z3.RotateRight(op, 1)

def z3RL(op): 
    return z3.RotateLeft(op, 1)

def z3SLT(op1, op2): 
    return op1 < op2

def z3SGT(op1, op2):
    return op1 > op2

def z3LShift(op1, op2):
    return op1 << op2

def z3RShift(op1, op2):
    return op1 >> op2

def z3Complement(op):
    return ~op

def z3BVAnd(op1, op2):
    return op1 & op2

def z3BVOr(op1, op2):
    return op1 | op2

def z3BVXor(op1, op2):
    return op1 ^ op2

def z3BVXnor(op1, op2):
    return ~(op1 ^ op2)

def z3Mul(op1, op2):
    return op1 * op2

