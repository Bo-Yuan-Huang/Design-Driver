import os
import sys
import ast
import z3
from cPickle import Unpickler

def readCnst(filename):
    with open(filename, 'rb') as f:
        pk = Unpickler(f)
        cnst = pk.load()
        return cnst

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

class MemWrite(object):
    COND  = 0
    WRITE = 1
    def __init__(self, writetype, **args):
        assert writetype == MemWrite.COND or writetype == MemWrite.WRITE
        self.writetype = writetype
        if self.writetype == MemWrite.COND:
            self.cond = args['cond']
            self.etrue = args['etrue']
            self.efalse = args['efalse']
            assert self.etrue != None or self.efalse != None 
        else:
            self.mem = args['mem']
            self.addr = args['addr']
            self.data = args['data']

    def toVerilog(self):
        stmts = []
        if self.writetype == MemWrite.COND:
            if self.etrue == None:
                assert self.efalse != None
                stmts.append('if(!%s) begin' % self.cond)
                stmts += ['  ' + s for s in self.efalse.toVerilog()]
                stmts.append('end')
            elif self.efalse == None:
                assert self.etrue != None
                stmts.append('if(%s) begin' % self.cond)
                stmts += ['  ' + s for s in self.etrue.toVerilog()]
                stmts.append('end')
            else:
                stmts.append('if(%s) begin' % self.cond)
                stmts += ['  ' + s for s in self.etrue.toVerilog()]
                stmts.append('end')
                stmts.append('else begin')
                stmts += ['  ' + s for s in self.efalse.toVerilog()]
                stmts.append('end')
        else:
            stmts.append('%s[%s] <= %s;' % (self.mem.name, self.addr, self.data))
        return stmts

    def __str__(self):
        if self.writetype == MemWrite.COND:
            if self.etrue == None:
                assert self.efalse != None
                return 'if(!%s) %s; ' % (self.cond, str(self.efalse))
            elif self.efalse == None:
                assert self.etrue != None
                return 'if(%s) %s; ' % (self.cond, str(self.etrue))
            else:
                assert self.efalse != None
                assert self.etrue != None
                return 'if(%s) %s; else %s;' % (self.cond, str(self.etrue), str(self.efalse))
        else:
            return '%s[%s] <= %s' % (self.mem.name, self.addr, self.data)


class VerilogContext(object):
    def __init__(self):
        self.inputs     = []
        self.outputs    = []
        self.mems       = []
        self.wires      = []
        self.outputs    = []
        self.statements = []
        self.always_stmts = []
        self.objects    = {}
        self.nameCtr    = 0

        self.memwrites  = {}
        self.statechanges = {}


    def _getName(self):
        self.nameCtr += 1
        return 'n%04d' % self.nameCtr

    def addInput(self, node, width):
        if node not in self.objects:
            self.inputs.append((node.name, width))
            self.objects[node] = node.name

    def addNext(self, name):
        for iname, iwidth in self.inputs:
            if iname == name:
                nxtname = iname + '_next'
                self.wires.append((nxtname, iwidth))
                self.outputs.append((iname, iwidth))
                self.outputs.append((nxtname, iwidth))
                return nxtname
        raise KeyError, 'Input %s not found to create next variable!' % name

    def addStateChange(self, st, opcode, name):
        if st not in self.statechanges:
            self.statechanges[st] = []
        self.statechanges[st].append((opcode, name))

    def addMemWrite(self, st, opcode, mw):
        if st not in self.memwrites:
            self.memwrites[st] = []
        self.memwrites[st].append((opcode, mw))

    def addMem(self, node):
        sz = 1 << node.awidth
        self.mems.append(node)
        self.objects[node] = node.name

    def getMemWrite(self, outname, exp):
        assert exp.nodetype == ast.Node.IF or exp.nodetype == ast.Node.WRITEMEM or exp.nodetype == ast.Node.MEMVAR, (exp, exp.nodetype)
        if exp.nodetype == ast.Node.IF:
            cond = self.getExpr(exp.cond)
            etrue = self.getMemWrite(outname, exp.exptrue)
            efalse = self.getMemWrite(outname, exp.expfalse)
            mw = MemWrite(MemWrite.COND, cond=cond, etrue=etrue, efalse=efalse)
            return mw
        elif exp.nodetype == ast.Node.WRITEMEM:
            mem = self.getExpr(exp.mem)
            if mem.name != outname:
                raise NotImplementedError, 'Full memory write is not supported (yet).'
            addr = self.getExpr(exp.addr)
            data = self.getExpr(exp.data)
            mw = MemWrite(MemWrite.WRITE, mem=mem, addr=addr, data=data)
            return mw
        else:
            if exp.name != outname:
                raise NotImplementedError, 'Full memory write is not supported (yet).'
            return None

    def getWidth(self, node):
        try:
            w = node.width
            width = (w-1, 0)
        except AttributeError:
            width = None
        return width

    def addWire(self, node, name):
        assert node not in self.objects
        self.wires.append((name, self.getWidth(node)))

    def addComment(self, cmt):
        stmt = '// %s' % cmt
        self.statements.append(stmt)

    def addAssignment(self, node, exp, name = None):
        if name is None:
            name = self._getName()
            self.addWire(node, name)
        else:
            self.wires.append((name, self.getWidth(node)))
        stmt = 'assign %s = %s;' % (name, exp)
        self.statements.append(stmt)
        return name

    def getExpr(self, node):
        if node not in self.objects:
            obj = node2verilog(node, self)
            self.objects[node] = obj
        return self.objects[node]

    def dumpWire(self, f, name, width, wtype):
        if width:
            print >> f, '%s [%d:%d] %s;' % (wtype, width[0], width[1], name)
        else:
            print >> f, '%s %s;' % (wtype, name)

    def dump(self, f, name):
        self.inputs.sort()
        self.wires.sort()

        print >> f, 'module %s(' % name
        print >> f,'  clk,\n  rst,\n  step,';
        print >> f,',\n'.join(['  %s' % o for o,w in self.outputs])
        print >> f,');'

        for wire, width in self.outputs:
            self.dumpWire(f, wire, width, 'output')
        print >> f

        print >> f, 'input clk, rst, step;';
        for inp, width in self.inputs:
            self.dumpWire(f, inp, width, 'reg')
        print >> f

        for wire, width in self.wires:
            self.dumpWire(f, wire, width, 'wire')
        print >> f

        for m in self.mems:
            sz = 1 << m.awidth
            print >> f, 'reg [%d:0] %s[%d:0];' % (m.dwidth-1, m.name, sz-1)
        print >> f

        for s in self.statements:
            print >> f, s
        
        print >> f
        print >> f, 'always @(posedge clk) begin'
        print >> f, '  if (rst) begin'
        for inp, width in self.inputs:
            if width:
                print >> f, '    %s <= %d\'b0;' % (inp, width[0]-width[1]+1)
            else:
                print >> f, '    %s <= 0;' % inp
        print >> f, '  end'
        print >> f, '  else begin'
        print >> f, '    if (step) begin'
        for s in self.always_stmts:
            print >> f, '      ' + s
        print >> f, '    end'
        print >> f, '  end'
        print >> f, 'end'
        print >> f
        print >> f, 'endmodule'

    def setCnst(self, c):
        self.cnst = c

    def addOutputs(self):
        for out, exprs in self.statechanges.iteritems():
            outnext = self.addNext(out)
            expr = 'assign %s = \n' % outnext;
            for opcode, exp in exprs:
                opast = ast.BitVecVal(opcode, self.cnst.width)
                eqast = ast.Equal(self.cnst, opast)
                eqexp = self.getExpr(eqast)
                expr += '  ( %s ) ? %s : \n' % (eqexp, exp)
            expr += '  ( %s );' % out;
            self.statements.append(expr);
            self.always_stmts.append('%s <= %s;' % (out, outnext))

    def addMems(self):
        for st, mws in self.memwrites.iteritems():
            for opcode, mw in mws:
                opast = ast.BitVecVal(opcode, self.cnst.width)
                eqast = ast.Equal(self.cnst, opast)
                self.always_stmts.append('if ( %s ) begin' % self.getExpr(eqast))
                self.always_stmts += ['  '+ s for s in mw.toVerilog()]
                self.always_stmts.append('end')

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
    return "%d\'h%x" % (node.width, node.value)

def memvar2verilog(node, ctx):
    assert node.nodetype == ast.Node.MEMVAR
    ctx.addMem(node)
    return node

def readmem2verilog(node, ctx):
    assert node.nodetype == ast.Node.READMEM
    mem = ctx.getExpr(node.mem)
    addr = ctx.getExpr(node.addr)
    return ctx.addAssignment(node, '%s[%s]' % (mem.name, addr))

def writemem2verilog(node, ctx):
    assert node.nodetype == ast.Node.WRITEMEM
    assert node.mem.nodetype == ast.Node.MEMVAR

    assert False, 'This method should not be called.'

    #addr = ctx.getExpr(node.addr)
    #data = ctx.getExpr(node.data)
    #ctx.writeMem(node.mem, addr, data)

def extract2verilog(node, ctx):
    assert node.nodetype == ast.Node.EXTRACT
    bv = ctx.getExpr(node.bv)
    return ctx.addAssignment(node, '%s[%d:%d]' % (bv, node.msb, node.lsb))

def extractbit2verilog(node, ctx):
    assert node.nodetype == ast.Node.EXTRACTBIT
    word = ctx.getExpr(node.word)
    bit = ctx.getExpr(node.bit)
    return ctx.addAssignment(node, '%s[%s]' % (word, bit))

def if2verilog(node, ctx):
    assert node.nodetype == ast.Node.IF
    cond = ctx.getExpr(node.cond)
    et = ctx.getExpr(node.exptrue)
    ef = ctx.getExpr(node.expfalse)
    return ctx.addAssignment(node, '( %s ) ? ( %s ) : ( %s )' % (cond, et, ef))
    
def concat2verilog(node, ctx):
    assert node.nodetype == ast.Node.CONCAT
    bvs = ['( %s )' % ctx.getExpr(bv) for bv in node.bitvecs]
    return ctx.addAssignment(node, '{ %s }' % (', '.join(bvs)))

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
        return ctx.addAssignment(node, '( %s )' % (' && '.join(ops)))
    elif node.opname == 'or':
        return ctx.addAssignment(node, '( %s )' % (' || '.join(ops)))
    elif node.opname == 'not':
        assert len(ops) == 1
        return ctx.addAssignment(node, '!( %s )' % str(ops[0]))
    elif node.opname == 'xor':
        return ctx.addAssignment(node, '( %s )' % (' ^ '.join(ops)))
    elif node.opname == 'add':
        return ctx.addAssignment(node, '( %s )' % (' + '.join(ops)))
    elif node.opname == 'sub':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' - '.join(ops)))
    elif node.opname == 'distinct':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' != '.join(ops)))
    elif node.opname == 'eq':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' == '.join(ops)))
    elif node.opname == 'rr':
        assert len(ops) == 1
        w = node.width
        return ctx.addAssignment(node, '{ %s[0], %s[%d:1] }' % (ops[0], ops[0], w-1))
    elif node.opname == 'rl':
        assert len(ops) == 1
        w = node.width
        return ctx.addAssignment(node, '{ %s[%d:0], %s[%d] }' % (ops[0], w-2, ops[0], w-1))
    elif node.opname == 'slt':
        sops = ['$signed(%s)' % ctx.getExpr(op) for op in node.operands]
        assert len(sops) == 2
        return ctx.addAssignment(node, '( %s )' % (' < '.join(sops)))
    elif node.opname == 'sgt':
        sops = ['$signed(%s)' % ctx.getExpr(op) for op in node.operands]
        assert len(sops) == 2
        return ctx.addAssignment(node, '( %s )' % (' > '.join(sops)))
    elif node.opname == 'ult':
        return ctx.addAssignment(node, '( %s )' % (' < '.join(ops)))
    elif node.opname == 'ugt':
        return ctx.addAssignment(node, '( %s )' % (' > '.join(ops)))
    elif node.opname == 'zero-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        return ctx.addAssignment(node, '{ %s{1\'b0}, %s }' % (params[0], ops[0]))
    elif node.opname == 'sign-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        return ctx.addAssignment(node, '{ %s{%s}, %s }' % (params[0], ops[0], ops[0]))
    elif node.opname == 'lshift':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' << '.join(ops)))
    elif node.opname == 'rshift':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' >> '.join(ops)))
    elif node.opname == 'cpl':
        assert len(ops) == 1
        return ctx.addAssignment(node, '~( %s )' % str(ops[0]))
    elif node.opname == 'bvand':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' & '.join(ops)))
    elif node.opname == 'bvor':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' | '.join(ops)))
    elif node.opname == 'bvxor':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' ^ '.join(ops)))
    elif node.opname == 'bvxnor':
        assert len(ops) == 2
        return ctx.addAssignment(node, '~( %s )' % (' ^ '.join(ops)))
    elif node.opname == 'bvdiv':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' / '.join(ops)))
    elif node.opname == 'bvrem':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' % '.join(ops)))
    elif node.opname == 'bvmul':
        assert len(ops) == 2
        return ctx.addAssignment(node, '( %s )' % (' * '.join(ops)))


def main():
    asts = readAllASTs(sys.argv[1])
    cnst = readCnst(sys.argv[2])

    vctx = VerilogContext()
    assert len(asts) == 0x100
    opcodes_to_exclude = [0xF0, 0xF2, 0xF3, 0xE0, 0xE2, 0xE3]
    for opcode, astdict in enumerate(asts):
        assert len(astdict) == 24
        if opcode in opcodes_to_exclude: continue

        vctx.addComment('')
        vctx.addComment('Opcode: %02x' % opcode)
        vctx.addComment('')
        for st, v in astdict.iteritems():
            name = '%s_%02x' % (st, opcode)
            # ignore the case where nothing changes.
            if v.isVar() and v.name == st: continue

            if v.isMem(): 
                mw = vctx.getMemWrite(st, v)
                if mw != None: vctx.addMemWrite(st, opcode, mw)
            else:
                vctx.addAssignment(v, vctx.getExpr(v), name)
                vctx.addStateChange(st, opcode, name)

    vctx.setCnst(cnst)
    vctx.addOutputs()
    vctx.addMems()

    with open(sys.argv[3], 'wt') as f:
        vctx.dump(f, 'uc8051golden')


if __name__ == '__main__':
    main()
