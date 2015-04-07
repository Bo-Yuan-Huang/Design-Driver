from ast import *
from cPickle import Pickler

x = BitVecVar('x', 16)
y = BitVecVar('y', 16)
xx = SignExt(x, 8)
yy = ZeroExt(y, 8)
a = BoolVar('a')
z = Equal(xx, yy)
w = And(a, z)
v = Or(a, z)

with open('test.pickle', 'wb') as f:
    pk = Pickler(f, -1)
    pk.dump(w)
    pk.dump(v)

