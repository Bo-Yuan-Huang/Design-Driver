import sys
from z3 import *
from z3helper import *

def main(argv):
    a = Bool('a', z3.main_ctx())
    b = Bool('b', z3.main_ctx())

    y = Or(And(a, Not(b)), And(a, Not(b)))
    S = Solver()
    S.add(y)
    assert S.check() == sat
    m = S.model()
    print m[a], m[b]

if __name__ == '__main__':
    main(sys.argv)
