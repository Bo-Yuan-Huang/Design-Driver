from ast import *
from cPickle import Pickler
import sys

from synthesizer import Synthesizer
from uc8051ast import Ctx8051, Ctx8051FromSyn, create8051Inputs, CtxChoice

with open('opcnst8051.ast', 'wb') as f:
    syn = Synthesizer()
    create8051Inputs(syn)
    ctx = Ctx8051FromSyn(syn)

    cnst = ReadMem(ctx.ROM, ctx.PC)
    pk = Pickler(f, -1)
    pk.dump(cnst)


