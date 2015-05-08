import ast
import sys
from synthesizer import Synthesizer

def eval(op, inputs, outputs):
    a = inputs['a']
    b = inputs['b']
    c = inputs['c']

    if op == 0:
        outputs['r'] = ((a + b) & 0xFF) if c == 227 else 0
    else:
        outputs['r'] = (a + op) & 0xFF


syn = Synthesizer()

a = syn.addInput(ast.BitVecVar('a', 8))
b = syn.addInput(ast.BitVecVar('b', 8))
c = syn.addInput(ast.BitVecVar('c', 8))

r_add = ast.If(ast.Equal(c, ast.BVInRange('c', ast.BitVecVal(220, 8), ast.BitVecVal(230, 8))), ast.Add(a, b), ast.BitVecVal(0, 8))
r_inc = ast.Add(a, ast.BVInRange('inc', ast.BitVecVal(1, 8), ast.BitVecVal(11, 8)))
r = ast.Choice('r', None, [r_add, r_inc])

syn.addOutput('r', r, Synthesizer.BITVEC)

syn.VERBOSITY = 2
syn.logfile = sys.stdout

[rsyn] = syn.synthesize(['r'], [ast.BoolVal(1)], lambda inp, out: eval(0, inp, out))
print rsyn

