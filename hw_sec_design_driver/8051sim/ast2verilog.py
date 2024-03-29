#! /usr/bin/python2.7

import ast

class MemWrite(object):
    COND  = 0
    WRITE = 1
    LIST  = 2
    def __init__(self, writetype, **args):
        assert writetype == MemWrite.COND or writetype == MemWrite.WRITE or writetype == MemWrite.LIST
        self.writetype = writetype
        if self.writetype == MemWrite.COND:
            self.cond = args['cond']
            self.etrue = args['etrue']
            self.efalse = args['efalse']
            assert self.etrue != None or self.efalse != None 
        elif self.writetype == MemWrite.WRITE:
            self.mem = args['mem']
            self.addr = args['addr']
            self.data = args['data']
        elif self.writetype == MemWrite.LIST:
            self.mem = args['mem']
            self.addrs = args['addrs']
            self.datas = args['datas']
            assert len(self.addrs) == len(self.datas)

    def toVerilog(self, cond):
        stmts = []
        if self.writetype == MemWrite.COND:
            if self.etrue == None:
                assert self.efalse != None
                ncond = '(%s) && (!%s)' % (cond, self.cond)
                stmts = self.efalse.toVerilog(ncond)
            elif self.efalse == None:
                assert self.etrue != None
                ncond = '(%s) && (%s)' % (cond, self.cond)
                stmts = self.etrue.toVerilog(ncond)
            else:
                # true
                ncond = '(%s) && (%s)' % (cond, self.cond)
                stmts = self.etrue.toVerilog(ncond)
                # false
                ncond = '(%s) && (!%s)' % (cond, self.cond)
                stmts += self.efalse.toVerilog(ncond)
        elif self.writetype == MemWrite.WRITE:
            stmts.append((cond, self.mem, self.addr, self.data))
        else:
            for i in xrange(len(self.addrs)):
                arest = self.addrs[i+1:]
                ai = self.addrs[i]
                if len(arest):
                    cond_i = ' && '.join(['((%s) != (%s))' % (ai, aj) for aj in arest])
                    ncond = '(%s) && (%s)' % (cond, cond_i)
                    stmts.append((ncond, self.mem, ai, self.datas[i]))
                else:
                    stmts.append((cond, self.mem, ai, self.datas[i]))
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
        elif self.writeype == MemWrite.WRITE:
            return '%s[%s] <= %s;' % (self.mem.name, self.addr, self.data)
        else:
            stmts = []
            for i in xrange(len(self.addrs)):
                arest = self.addrs[i+1:]
                ai = self.addrs[i]
                if len(arest):
                    condition = ' && '.join(['((%s) != (%s))' % (ai, aj) for aj in arest])
                    stmts += 'if (%s) %s[%s] <= %s;' % (self.mem.name, ai, self.datas[i])
                else:
                    stmts += '%s[%s] <= %s;' % (self.mem.name, ai, self.datas[i])
            return '; '.join(stmts)

def getBaseMemory(n):
    if n.nodetype == ast.Node.MEMVAR:
        return n
    elif n.nodetype == ast.Node.WRITEMEM:
        return getBaseMemory(n.mem)
    elif n.nodetype == ast.Node.IF:
        m1 = getBaseMemory(n.exptrue)
        m2 = getBaseMemory(n.expfalse)
        assert m1 == m2
        return m1
    else:
        assert False, n.nodetype

class VerilogContext(object):
    def __init__(self):
        self.inputs     = []
        self.cinputs    = []
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
        self.rsts = {}
        self.init_mem_guard = ''

    def _getName(self):
        self.nameCtr += 1
        return 'n%04d' % self.nameCtr

    def addInput(self, node, width):
        if node not in self.objects:
            self.inputs.append((node.name, width))
            self.objects[node] = node.name

    def createWire(self, node):
        assert node not in self.objects
        self.addWire(node, node.name)
        self.objects[node] = node.name

    def addAbstractInput(self, name):
        for iname, iwidth in self.inputs:
            if iname == name:
                ndname = iname + '_abstr'
                self.cinputs.append((ndname, iwidth))
                return ndname
        raise KeyError, 'Input %s not found to create abstract input!' % name

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

    def getMemWriteAddrs(self, cond, outname, exp, addrs):
        assert exp.nodetype == ast.Node.IF or exp.nodetype == ast.Node.WRITEMEM or exp.nodetype == ast.Node.MEMVAR, (exp, exp.nodetype)
        if exp.nodetype == ast.Node.IF:
            c1 = ast.And(cond, exp.cond)
            c2 = ast.And(cond, ast.Not(exp.cond))

            self.getMemWriteAddrs(c1, outname, exp.exptrue, addrs)
            self.getMemWriteAddrs(c2, outname, exp.expfalse, addrs)
        elif exp.nodetype == ast.Node.WRITEMEM:
            if exp.mem.isMemVar():
                new_addr = (cond, exp.mem, exp.addr)
                addrs.append(new_addr)
            else:
                mem = getBaseMemory(exp)
                new_addr = (cond, mem, exp.addr)
                addrs.append(new_addr)
                self.getMemWriteAddrs(cond, outname, exp.mem, addrs)
        elif exp.nodetype == ast.Node.MEMVAR:
            pass
        else:
            assert False

    def getMemWrite(self, outname, exp):
        assert exp.nodetype == ast.Node.IF or exp.nodetype == ast.Node.WRITEMEM or exp.nodetype == ast.Node.MEMVAR, (exp, exp.nodetype)
        if exp.nodetype == ast.Node.IF:
            cond = self.getExpr(exp.cond)
            etrue = self.getMemWrite(outname, exp.exptrue)
            efalse = self.getMemWrite(outname, exp.expfalse)
            mw = MemWrite(MemWrite.COND, cond=cond, etrue=etrue, efalse=efalse)
            return mw
        elif exp.nodetype == ast.Node.WRITEMEM:
            if exp.mem.isMemVar():
                mem = self.getExpr(exp.mem)
                if mem.name != outname:
                    raise NotImplementedError, 'Full memory write is not supported (yet).'
                addr = self.getExpr(exp.addr)
                data = self.getExpr(exp.data)
                mw = MemWrite(MemWrite.WRITE, mem=mem, addr=addr, data=data)
                return mw
            else:
                assert exp.mem.nodetype == ast.Node.WRITEMEM, (str(exp), exp.mem.nodetype)
                mvs = self.getMemWrite(outname, exp.mem)
                addr = self.getExpr(exp.addr)
                data = self.getExpr(exp.data)
                if mvs.writetype == MemWrite.WRITE:
                    addrs = [mvs.addr, addr]
                    datas = [mvs.data, data]
                else:
                    addrs = mvs.addrs + [addr]
                    datas = mvs.datas + [data]
                mw = MemWrite(MemWrite.LIST, mem=mvs.mem, addrs=addrs, datas=datas)
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
        w = self.getWidth(node)
        if (name, w) not in self.wires: self.wires.append((name, w))

    def addComment(self, cmt):
        stmt = '// %s' % cmt
        self.statements.append(stmt)

    def addAssignment(self, node, exp, name = None):
        if name is None:
            name = self._getName()
            self.addWire(node, name)
        else:
            w = self.getWidth(node)
            if (name, w) not in self.wires: self.wires.append((name, w))
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
        print >> f,',\n'.join(['  %s' % o for o,w in self.outputs + self.cinputs])
        print >> f,');'

        for wire, width in self.outputs:
            self.dumpWire(f, wire, width, 'output')
        print >> f

        print >> f, 'input clk, rst, step;';

        for inp, width in self.cinputs:
            self.dumpWire(f, inp, width, 'input')
        print >> f

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
                print >> f, '    %s <= %d\'h%s;' % (inp, width[0]-width[1]+1, self.getRst(inp))
            else:
                print >> f, '    %s <= %s;' % (inp, self.getRst(inp))
        for m in self.mems:
            sz = 1 << m.awidth
            if len(self.init_mem_guard): print >> f, '`ifdef %s' % self.init_mem_guard
            for i in xrange(sz):
                print >> f,'    %s[%d] = %d\'b0;' % (m.name, i, m.dwidth)
            if len(self.init_mem_guard): print >> f, '`endif'

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

    def getRst(self, n):
        if n in self.rsts:
            return self.rsts[n]
        else:
            return '0'

    def setRst(self, n, v):
        self.rsts[n] = v

    def setCnst(self, c):
        self.cnst = c

    def addOutputsSingleOp(self, this_opcode):
        for out, exprs in self.statechanges.iteritems():
            outnext = self.addNext(out)
            ndnext = self.addAbstractInput(out)
            expr = 'assign %s = ' % outnext
            found = False
            for opcode, exp in exprs:
                if opcode == this_opcode:
                    opast = ast.BitVecVal(opcode, self.cnst.width)
                    eqast = ast.Equal(self.cnst, opast)
                    eqexp = self.getExpr(eqast)
                    expr += '  ( %s ) ? ( %s ) : ' % (eqexp, exp)
                    found = True
            expr += ' ( %s );' % ndnext                
            self.statements.append(expr)
            self.always_stmts.append('%s <= %s;' % (out, outnext))
            
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

    def addMems(self, this_opcode=None):
        writes = {}
        for st, mws in self.memwrites.iteritems():
            for i, (opcode, mw) in enumerate(mws):
                opast = ast.BitVecVal(opcode, self.cnst.width)
                eqast = ast.Equal(self.cnst, opast)
                cond = self.getExpr(eqast)
                stmts = mw.toVerilog(cond)

                mem = None 
                for s in stmts:
                    [c, m, a, d] = s
                    if mem == None:
                        mem = m
                    else:
                        assert mem == m
                    # print '%02x: if (%s) %s[%s] <= %s' % (opcode, c, m.name, a, d)
                if mem not in writes:
                    writes[mem] = {}
                if opcode not in writes[mem]:
                    writes[mem][opcode] = []
                writes[mem][opcode] += stmts

        for mem, memwrites in writes.iteritems():
            self.writeMem(mem, memwrites, this_opcode)

    def writeMem(self, mem, writes, this_opcode):
        wrports = WritePorts()

        if this_opcode:
            maxports = 0
            for opcode, stmts in writes.iteritems():
                if maxports < len(stmts):
                    maxports = len(stmts)

            a_conds, a_addrs, a_datas = [], [], []
            for i in xrange(maxports):
                ca_i = 'WR_COND_ABSTR_%s_%d' % (mem.name, i)
                aa_i = 'WR_ADDR_ABSTR_%s_%d' % (mem.name, i)
                da_i = 'WR_DATA_ABSTR_%s_%d' % (mem.name, i)

                cond_i = '(%s && !(%s))' % (ca_i, self.getExpr(ast.Equal(self.cnst, ast.BitVecVal(this_opcode, self.cnst.width))))
                a_conds.append(cond_i)
                a_addrs.append(aa_i)
                a_datas.append(da_i)

                self.cinputs.append((ca_i, None))
                self.cinputs.append((aa_i, (mem.awidth-1, 0)))
                self.cinputs.append((da_i, (mem.dwidth-1, 0)))

        for opcode, stmts in writes.iteritems():
            if this_opcode:
                for i, [c, m, a, d] in enumerate(stmts):
                    assert m == mem
                    if opcode == this_opcode:
                        wrports.addWrite(i, c, a, d)
            else:
                for i, [c, m, a, d] in enumerate(stmts):
                    assert m == mem
                    wrports.addWrite(i, c, a, d)

        if this_opcode:
            for i in xrange(maxports):
                wrports.addWrite(i, a_conds[i], a_addrs[i], a_datas[i])
        # print mem.name, 'num ports:', wrports.numPorts
        for i in xrange(wrports.numPorts):
            addrport = 'WR_ADDR_%d_%s' % (i, mem.name)
            dataport = 'WR_DATA_%d_%s' % (i, mem.name)
            condport = 'WR_COND_%d_%s' % (i, mem.name)
            addr = ast.BitVecVar(addrport, mem.awidth)
            self.createWire(addr)
            data = ast.BitVecVar(dataport, mem.dwidth)
            self.createWire(data)
            cond = ast.BoolVar(condport)
            self.createWire(cond)

            self.addAssignment(addr, wrports.addrExpr(i), addr.name)
            self.addAssignment(data, wrports.dataExpr(i), data.name)
            self.addAssignment(cond, wrports.condExpr(i), cond.name)

            self.always_stmts.append('if (%s) %s[%s] <= %s;' % (condport, mem.name, addrport, dataport))


class WritePorts(object):
    def __init__(self):
        self.numPorts = 0
        self.conds = []
        self.addrs = []
        self.datas = []

    def addWrite(self, i, c, a, d):
        if i >= self.numPorts:
            self.conds.append([c])
            self.addrs.append([a])
            self.datas.append([d])
            self.numPorts += 1
        else:
            self.conds[i].append(c)
            self.addrs[i].append(a)
            self.datas[i].append(d)

        assert len(self.conds) == self.numPorts
        assert len(self.addrs) == self.numPorts
        assert len(self.datas) == self.numPorts
    
    def condExpr(self, i):
        return ' || '.join('(%s)' % c for c in self.conds[i])

    def addrExpr(self, i):
        conds = self.conds[i]
        addrs = self.addrs[i]
        assert len(conds) == len(addrs)

        def createIf(i):
            if i == len(conds) - 1:
                return addrs[i]
            else:
                return '(%s) ? (%s) : (%s)' % (conds[i], addrs[i], createIf(i+1))
        return createIf(0)

    def dataExpr(self, i):
        conds = self.conds[i]
        datas = self.datas[i]
        assert len(conds) == len(datas)

        def createIf(i):
            if i == len(conds) - 1:
                return datas[i]
            else:
                return '(%s) ? (%s) : (%s)' % (conds[i], datas[i], createIf(i+1))
        return createIf(0)

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

def boolval2verilog(node, ctx):
    assert node.nodetype == ast.Node.BOOLVAL
    return str(node.value)

def bitvecval2verilog(node, ctx):
    s = "%d\'h%x" % (node.width, node.value)
    return ctx.addAssignment(node, s)
    

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
    elif node.opname == 'ule':
        return ctx.addAssignment(node, '( %s )' % (' <= '.join(ops)))
    elif node.opname == 'uge':
        return ctx.addAssignment(node, '( %s )' % (' >= '.join(ops)))
    elif node.opname == 'zero-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        return ctx.addAssignment(node, '{ %s\'b0, %s }' % (params[0], ops[0]))
    elif node.opname == 'sign-ext':
        assert len(ops) == 1
        assert len(params) == 1
        w = node.operands[0].width
        p = int(params[0])
        onestr = ', '.join(['%s[%d]' % (ops[0], w-1)] * p)
        return ctx.addAssignment(node, '{ %s, %s }' % (onestr, ops[0]))
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
    else:
        raise NotImplementedError, 'Unknown operator: %s' % node.opname


class AddrSubs(object):
    def __init__(self):
        self.subs = []

    def count(self, param, mem):
        cnt = 0
        for p, m, a, s in self.subs:
            if (p == param or p == -1) and m == mem:
                cnt += 1
        return cnt

    def getSub(self, param, mem, addr):
        for p, m, a, s in self.subs:
            if (p == param or p == -1) and m == mem and a == addr:
                return s
        return None

    def addSub(self, param, mem, addr, v):
        assert self.getSub(param, mem, addr) == None
        self.subs.append((param, mem, addr, v))

    def getReadPorts(self):
        ports = []
        for p, m, a, s in self.subs:
            port = (m, s)
            if port not in ports:
                ports.append(port)
        ports.sort(key=lambda p: p[0].name)
        return ports

    def getExpr(self, cnst, mem, sub, this_opcode=None, vctx=None):
        exprs = []
        all_same = False
        for p, m, a, s in self.subs:
            if mem == m and sub == s:
                exprs.append((p, a))
                if p == -1:
                    all_same = True

        assert len(exprs) >= 1
        if all_same: assert len(exprs) == 1

        if this_opcode and not all_same:
            assert vctx != None

            abstr_addr_name = sub.name + '_ABSTR_ADDR'
            vctx.cinputs.append((abstr_addr_name, (mem.awidth-1, 0)))
            abstr_addr = ast.BitVecVar(abstr_addr_name, mem.awidth)
            vctx.objects[abstr_addr] = abstr_addr_name

            addr = None
            for p, a in exprs:
                if p == this_opcode:
                    addr = a
                    break
            if addr:
                return ast.If(ast.Equal(cnst, ast.BitVecVal(p, cnst.width)), addr, abstr_addr)
            else:
                return abstr_addr

        def createIf(i):
            [p, a] = exprs[i]
            if i == len(exprs) - 1:
                return a
            else:
                return ast.If(ast.Equal(cnst, ast.BitVecVal(p, mem.awidth)), a, createIf(i+1))
        return createIf(0)

    def dump(self):
        for p, m, a, s in self.subs:
            print '%2x/%s/%s/%s' % (p, m.name, str(a), str(s))

    def sort(self):
        self.subs.sort()

    def __len__(self):
        return len(self.subs)

def rewriteMemReads(param, n_top, subs):
    def f(n):
        if n.nodetype == ast.Node.READMEM:
            if not n.mem.isMemVar():
                err_msg = 'Reading from modified memories not supported yet.'
                raise NotImplementedError, err_msg
            s = subs.getSub(param, n.mem, n.addr)
            if not s:
                name = 'RD_%s_%d' % (n.mem.name, subs.count(param, n.mem))
                s = ast.BitVecVar(name, n.mem.dwidth)
                subs.addSub(param, n.mem, n.addr, s)
            return s
        else:
            return n
    return n_top.apply(f)


def stripMacros(top):
    def f(n):
        if n.nodetype == ast.Node.MACRO:
            return n.expr
        else:
            return n
    return top.apply(f)

def replaceFunctions(top, inputs):
    def f(n):
        if n.nodetype == ast.Node.APPLY:
            width = n.width
            nchunks = width // 64
            chunksizes = [64] * nchunks
            assert sum(chunksizes) <= width
            if (nchunks * 64) < width:
                chunksizes.append(width % 64)
            assert sum(chunksizes) == width
            assert 0 not in chunksizes

            these_inputs = []
            for cs in chunksizes:
                name = 'input_%s_%d' % (n.fun.name, len(inputs))
                var = ast.BitVecVar(name, cs)
                inp = (var, name, (cs-1, 0))
                inputs.append(inp)
                these_inputs.append(var)
            return ast.Concat(*these_inputs)
        else:
            return n
    return top.apply(f)

def resizeMem(top, name, sz):
    ast.ReadMem.VALIDATE_SIZE = 0
    def f(n):
        if n.nodetype == ast.Node.MEMVAR and n.name == name:
            return ast.MemVar(n.name, sz, n.dwidth)
        elif n.nodetype == ast.Node.READMEM and n.mem.name == name:
            return ast.ReadMem(n.mem, ast.Extract(sz-1, 0, n.addr))
        elif n.nodetype == ast.Node.WRITEMEM and n.mem.name == name:
            return ast.WriteMem(n.mem, ast.Extract(sz-1, 0, n.addr), n.data)
        else:
            return n
    top_ = top.apply(f)
    ast.ReadMem.VALIDATE_SIZE = 1
    return top_

