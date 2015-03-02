from ast import *
import z3

def test_AST():
    v1 = BoolVar('b1')
    v2 = BitVecVar('b2', 16)
    v3 = BitVecVal(2, 16)
    assert str(v1) == '(def-bool b1)'
    assert str(v2) == '(def-bitvec b2 16)'
    assert str(v3) == '(bitvecval 2 16)'
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

    c2 = ChooseConsecBits(4, v4)
    print c2, c2.toZ3()

    c3 = Concat(c1, c2)
    print c3, c3.toZ3()

    S = z3.Solver()
    a = BoolVar('a')
    b = BoolVar('b')
    x = BitVecVar('x', 8)
    y = BitVecVar('y', 8)
    one = BitVecVal(1, 8)
    xp1 = Add(x, one)
    eqy = Equal(xp1, y)
    eqab = Equal(a, b)
    ands = And(Not(a), eqab, eqy)

    S = z3.Solver()
    S.add(ands.toZ3())
    print S.check()
    m = S.model()
    print m
    print m[a.toZ3()], dir(m[a.toZ3()])
    if z3.is_true(m[a.toZ3()]):
        print 'true'
    else:
        print 'false'

    print 'Var assertions passed.'

if __name__ == '__main__':
    test_AST()

