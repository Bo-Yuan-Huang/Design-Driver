from ast import *

def test_AST():
    v1 = BoolVar('b1')
    v2 = BitVecVar('b2', 16)
    v3 = BitVecVal(2, 16)
    assert str(v1) == 'bool(b1)'
    assert str(v2) == 'bitvec(b2, 16)'
    assert str(v3) == 'bitvec(2, 16)'
    v4 = Add(v2, v3)
    v5 = Sub(v2, v3)
    print v1.toZ3(), v2.toZ3(), v3.toZ3(), v4.toZ3(), v5.toZ3()

    S = z3.Solver()
    S.add(v4.toZ3() == v5.toZ3())
    assert S.check() == z3.unsat

    S = z3.Solver()
    v6 = Neg(v2)
    S.add(v2.toZ3() == v6.toZ3())
    assert S.check() == z3.sat
    m = S.model()
    print m

    c1 = Choice('choice', None, [v4, v5, v6])
    print c1.toZ3()

    S = z3.Solver()
    a = BoolVar('a')
    b = BoolVar('b')
    x = BitVecVar('x', 8)
    y = BitVecVar('y', 8)
    one = BitVecVal(1, 8)
    xp1 = Add(x, one)
    eqy = Equal(xp1, y)
    eqab = Equal(a, b)
    ands = And(a, eqab, eqy)
    S = Solver()
    S.add(ands.toZ3())
    print S.check()
    print S.model()

    print 'Var assertions passed.'

if __name__ == '__main__':
    test_AST()

