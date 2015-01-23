import sys
import pyverilog.vparser.parser as vp
import pyverilog.vparser.ast as vast

def rewrite(filename):
    codeparser = vp.VerilogCodeParser([filename])
    ast = codeparser.parse()
    modules = ast.description.children()
    assert len(modules) == 1

    rewrite_module(modules[0])

def rewrite_module(mod):
    print 'module %s(' % mod.name
    assert len(mod.paramlist.children()) == 0
    pref = ' '*2
    print pref + (',\n'+pref).join(c.name for c in mod.portlist.children())
    print ');'

    defs = []
    instances = []
    for s in mod.items:
        if isinstance(s, vast.Decl):
            for c in s.list:
                if isinstance(c, vast.Input):
                    print_input(c, defs)
                elif isinstance(c, vast.Output):
                    print_output(c, defs)
                elif isinstance(c, vast.Wire):
                    print_wire(c, defs)
        elif isinstance(s, vast.Instance):
            print_instance(s, instances, defs)
        elif isinstance(s, vast.Assign):
            assert False, 'need to implement assigns'
        else:
            assert False, s

    defs.append(('wire', 'const_zero'))
    defs.append(('wire', 'const_one'))
    for d in defs:
        print '  %s %s;' % d
    print 
    print '  TIELO_X1M_A12TS uconst0 (.Y(const_zero));'
    print '  TIEHI_X1M_A12TS uconst1 (.Y(const_one));'
    print
    for i in instances:
        print '  %s;' % i

    print 'endmodule'

def print_item(c, defs, type_prefix):
    zero = vast.IntConst('0')
    if c.width.msb == zero and c.width.lsb == zero:
        defs.append((type_prefix, c.name))
    else:
        defs.append((type_prefix, '[%d:%d] %s' %(int(c.width.msb.value), int(c.width.lsb.value), c.name)))

print_input = lambda c, defs: print_item(c, defs, 'input')
print_output = lambda c, defs: print_item(c, defs, 'output')
print_wire = lambda c, defs: print_item(c, defs, 'wire')

def print_instance(c, instances, defs):
    assert len(c.parameterlist) == 0

    ports = {}
    for p in c.portlist:
        if isinstance(p.argname, vast.Pointer):
            ports[p.portname] = '%s[%s]' % (p.argname.var.name, p.argname.ptr)
        else:
            if isinstance(p.argname, vast.Identifier):
                ports[p.portname] = p.argname.name
            elif isinstance(p.argname, vast.IntConst):
                v = p.argname.value
                if v.startswith("1'b"): 
                    v = v[3:]
                assert v == '0' or v == '1', v
                if v == 0:
                    ports[p.portname] = 'const_zero';
                else:
                    ports[p.portname] = 'const_one';
            else:
                assert False, p.argname

    port_strs = ['.%s(%s)' % (x,ports[x]) for x in ports]
    s = '%s %s (%s)' % (c.module, c.name, ', '.join(port_strs))
    instances.append(s)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Syntax Error.'
        print 'Usage: %s <filename>' % sys.argv[0]
    else:
        rewrite(sys.argv[1])

