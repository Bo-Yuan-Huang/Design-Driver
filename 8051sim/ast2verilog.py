import os
import sys
import ast
import z3
from cPickle import Unpickler

def readAST(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        opcode = pk.load()
        asts = {}
        while True:
            try:
                name = pk.load()
                ast = pk.load()
                asts[(name, opcode)] = ast
            except EOFError:
                break
        return asts

def readAllASTs(d):
    astfiles = [os.path.join(d, f) for f in os.listdir(d) if f.endswith('.ast')]

    asts = []
    for i in xrange(0x100): asts.append({})

    for f in astfiles:
        ast = readAST(f)
        for (name, opcode), tree in ast.iteritems():
            assert opcode < 0x100 and opcode >= 0
            asts[opcode][name] = tree

    return asts

class VerilogContext(object):
    def __init__(self):
        self.inputs     = []
        self.mems       = []
        self.wires      = []
        self.outputs    = []
        self.memwrites  = []
        self.statements = []
        self.objects    = {}
        self.nameCtr    = 0


    def _getName(self):
        self.nameCtr += 1
        return 'n%05d' % self.nameCtr

    def addInput(self, node, width):
        if node not in self.objects:
            self.inputs.append((name, width))
            self.objects[node] = name
    
    def addMem(self, node):
        sz = 1 << node.awidth
        self.mems.append(node)
        self.objects[node] = node.name

    def writeMem(self, mem, addr, data):
        assert mem in self.objects
        self.memwrites.append((mem, addr, data))

    def addWire(self, node, name, width):
        assert node not in self.objects
        self.wires.append((name, width))
        self.objects[node] = name

    def getExpr(self, node):
        if node not in self.objects:
            try:
                w = node.width
                width = (w-1, 0)
            except AttributeError:
                width = None

            name = self._getName()
            self.addWire(node, name, width)
            obj = node2verilog(node, self)
            self.objects[node] = obj
        return self.objects[node]

    def dump(self, f):
        pass

def node2verilog(node, ctx):
    if node.nodetype == ast.Node.BOOLVAR:
        return boolvar2verilog(node, ctx)
    elif node.nodetype == ast.Node.BITVECVAR:
        return bitvecvar2verilog(node, ctx)
    elif node.nodetype == ast.Node.BOOLVAL:
        return boolval2verilog(node, ctx)
    elif node.nodetype == ast.Node.BITVECVAL:
        return bitvecval2verilog(node, ctx)
    elif node.nodetype == ast.Node.MEMVAR:
        return memvar2verilog(node, ctx)
    elif node.nodetype == ast.Node.READMEM:
        return readmem2verilog(node, ctx)
    elif node.nodetype == ast.Node.WRITEMEM:
        return writemem2verilog(node, ctx)
    elif node.nodetype == ast.Node.EXTRACT:
        return extract2verilog(node, ctx)
    elif node.nodetype == ast.Node.EXTRACTBIT:
        return extractbit2verilog(node, ctx)
    elif node.nodetype == ast.Node.IF:
        return if2verilog(node, ctx)
    elif node.nodetype == ast.Node.CONCAT:
        return concat2verilog(node, ctx)
    elif node.nodetype == ast.Node.Z3OP:
        return z3op2verilog(node, ctx)
    elif node.nodetype == ast.Node.MACRO:
        return macro2verilog(node, ctx)
    else:
        raise NotImplementedError, 'Unknown nodetype: %d' % node.nodetype

def boolvar2verilog(node, ctx):
    assert node.nodetype == ast.Node.BOOLVAR
    ctx.addInput(node, None)
    return node.name

def bitvecvar2verilog(node, ctx):
    assert node.nodetype == ast.Node.BITVECVAR
    ctx.addInput(node, (node.width-1, 0))
    return node.name

def boolvar2verilog(node, ctx):
    assert node.nodetype == ast.Node.BOOLVAL
    return str(node.value)

def bitvecval2verilog(node, ctx):
    assert node.nodetype == ast.Node.BITVECVAL
    return "%d\'x%x" % (node.width, node.value)

def memvar2verilog(node, ctx):
    assert node.nodetype == ast.Node.MEMVAR
    ctx.addMem(node)
    return node

def readmem2verilog(node, ctx):
    assert node.nodetype == ast.Node.READMEM
    mem = ctx.getExpr(node.mem)
    addr = ctx.getExpr(node.addr)
    return '%s[%s]' % (mem, addr)

def writemem2verilog(node, ctx):
    assert node.nodetype == ast.Node.WRITEMEM
    assert node.mem.nodetype == ast.Node.MEMVAR

    addr = ctx.getExpr(node.addr)
    data = ctx.getExpr(node.data)
    ctx.writeMem(node.mem, addr, data)

def extract2verilog(node, ctx):
    assert node.nodetype == ast.Node.EXTRACT
    bv = ctx.getExpr(node.bv)
    return '%s[%d:%d]' % (bv, node.msb, node.lsb)

def extractbit2verilog(node, ctx):
    assert node.nodetype == ast.Node.EXTRACTBIT
    word = ctx.getExpr(node.word)
    bit = ctx.getExpr(node.bit)
    return '%s[%s]' % (word, bit)

def if2verilog(node, ctx):
    assert node.nodetype == ast.Node.IF
    cond = ctx.getExpr(node.cond)
    et = ctx.getExpr(node.exptrue)
    ef = ctx.getExpr(node.expfalse)
    return '%s ? %s : %s' % (cond, et, ef)
    
def concat2verilog(node, ctx):
    assert node.nodetype == ast.Node.CONCAT
    bvs = ['( %s )' % ctx.getExpr(bv) for bv in node.bitvecs]
    return '{ %s }' % (', '.join(bvs))

def macro2verilog(node, ctx):
    assert node.nodetype == ast.Node.MACRO
    return ctx.getExpr(node.expr)

def z3op2verilog(node, ctx):
    assert node.nodetype == ast.Node.Z3OP
    ops = [ctx.getExpr(op) for op in node.operands]
    if node.params:
        params = [str(p) for p in node.params]
    else:
        params = []

    if node.opname == 'and':
        return '( %s )' % (' && '.join(ops))
    elif node.opname == 'or':
        return '( %s )' % (' || '.join(ops))
    elif node.opname == 'not':
        assert len(ops) == 1
        return '!( %s )' % str(ops[0])
    elif node.opname == 'xor':
        return '( %s )' % (' ^ '.join(ops))
    elif node.opname == 'add':
        return '( %s )' % (' + '.join(ops))
    elif node.opname == 'sub':
        assert len(ops) == 2
        return '( %s )' % (' - '.join(ops))
    elif node.opname == 'distinct':
        assert len(ops) == 2
        return '( %s )' % (' != '.join(ops))
    elif node.opname == 'eq':
        assert len(ops) == 2
        return '( %s )' % (' == '.join(ops))
    elif node.opname == 'rr':
        assert len(ops) == 1
        w = node.width
        return '{ %s[0], %s[%d:1] }' % (ops[0], ops[0], w-1)
    elif node.opname == 'rl':
        assert len(ops) == 1
        w = node.width
        return '{ %s[%d:0], %s[%d] }' % (ops[0], w-2, ops[0], w-1)
    elif node.opname == 'slt':
        sops = ['$signed(%s)' % ctx.getExpr(op) for op in node.operands]
        assert len(sops) == 2
        return '( %s )' % (' < '.join(sops))
    elif node.opname == 'sgt':
        sops = ['$signed(%s)' % ctx.getExpr(op) for op in node.operands]
        assert len(sops) == 2
        return '( %s )' % (' > '.join(sops))
    elif node.opname == 'ult':
        return '( %s )' % (' < '.join(ops))
    elif node.opname == 'ugt':
        return '( %s )' % (' > '.join(ops))
    elif node.opname == 'zero-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        return '{ %s{1\'b0}, %s }' % (params[0], ops[0])
    elif node.opname == 'sign-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        return '{ %s{%s}, %s }' % (params[0], ops[0], ops[0])
    elif node.opname == 'lshift':
        assert len(ops) == 2
        return '( %s )' % (' << '.join(ops))
    elif node.opname == 'rshift':
        assert len(ops) == 2
        return '( %s )' % (' >> '.join(ops))
    elif node.opname == 'cpl':
        assert len(ops) == 1
        return '~( %s )' % str(ops[0])
    elif node.opname == 'bvand':
        assert len(ops) == 2
        return '( %s )' % (' & '.join(ops))
    elif node.opname == 'bvor':
        assert len(ops) == 2
        return '( %s )' % (' | '.join(ops))
    elif node.opname == 'bvxor':
        assert len(ops) == 2
        return '( %s )' % (' ^ '.join(ops))
    elif node.opname == 'bvxnor':
        assert len(ops) == 2
        return '~( %s )' % (' ^ '.join(ops))
    elif node.opname == 'bvdiv':
        assert len(ops) == 2
        return '( %s )' % (' / '.join(ops))
    elif node.opname == 'bvrem':
        assert len(ops) == 2
        return '( %s )' % (' % '.join(ops))
    elif node.opname == 'bvmul':
        assert len(ops) == 2
        return '( %s )' % (' * '.join(ops))


if __name__ == '__main__':
    asts = readAllASTs(sys.argv[1])
    vctx = VerilogContext()
    assert len(asts) == 0x100
    for astdict in asts:
        assert len(astdict) == 24
        for k, v in astdict.iteritems():
            vctx.getExpr(v)


    print 'all good!'
