from ast import *
from cPickle import Unpickler

x = BitVecVar('x', 16)
y = BitVecVar('y', 16)
xx = SignExt(x, 8)
yy = ZeroExt(y, 8)
a = BoolVar('a')
z = Equal(xx, yy)
w = And(a, z)
v = Or(a, z)

with open('test.pickle', 'rb') as f:
    pk = Unpickler(f)
    wp = pk.load()
    vp = pk.load()
    assert wp == w
    assert vp == v
    print wp
    print vp

    print w.toZ3()
    print v.toZ3()

