import itertools
from z3 import *
from z3helper import *


# DSL feature set
#
# - thin layer over SMT
# - clean way of representing both variables and formulas
# - choice operator
# - bit-select-operator
# - what else?
# - Must extract the solution once the synthesis
#   is done. Means we need our own AST!


# How do we define our AST in Python?
# 
# What we want to write:
#
# Opcode = Input('Opcode', 24)
# Op0 = Extract(Opcode,  0,  7)
# Op1 = Extract(Opcode,  8, 15)
# Op2 = Extract(Opcode, 16, 23)
# PC = Input('PC', 16)
# A  = Input('ACC', 8)
# PSW = Input('PSW', 8)
# ...
# RAM = InputArray('RAM', 8, 256)
#
# PCp1 = Add(PC, 1)
# ...
# RPC1 = Add(PC, SignExt(Op1, 16))
# ...
# CarryBit = ChooseBit(PSW)
# JC_PC = If(CarryBit, Choice(Op0, RPC1, RPC2), Choice(Op0, PCp1, PCp2))
# ...
# Output = Choice(
#               Op0,
#               Choices(
#                   PCp1, 
#                   PCp2,
#                   PCp3,
#                   LJMP_PC,
#                   JC_PC,
#                   ...
#               )
#           )
# 
