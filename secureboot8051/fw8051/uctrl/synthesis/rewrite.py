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
    for s in mod.items:
        if isinstance(s, vast.Decl):
            for c in s.list:
                if isinstance(c, vast.Input):
                    print_input(c)
                elif isinstance(c, vast.Output):
                    print_output(c)
                elif isinstance(c, vast.Wire):
                    print_wire(c)
        elif isinstance(s, vast.Instance):
            print_instance(s)
        elif isinstance(s, vast.Assign):
            assert False, 'need to implement assigns'
        else:
            assert False, s

    print 'endmodule'
def print_item(c, type_prefix):
    zero = vast.IntConst('0')
    if c.width.msb == zero and c.width.lsb == zero:
        print '  %s %s;' % (type_prefix, c.name)
    else:
        print '  %s %s[%d:%d];' %(type_prefix, c.name, int(c.width.msb.value), int(c.width.lsb.value))

print_input = lambda c: print_item(c, 'input')
print_output = lambda c: print_item(c, 'output')
print_wire = lambda c: print_item(c, 'wire')

def print_instance(c):
    assert len(c.parameterlist) == 0

    ports = []
    for p in c.portlist:
        if isinstance(p.argname, vast.Pointer):
            ports.append('.%s(%s[%s])' % (p.portname, p.argname.var, p.argname.ptr))
        else:
            ports.append('.%s(%s)' % (p.portname, p.argname))

    s = '  %s %s(%s);' % (c.module, c.name, ', '.join(ports))
    print s


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Syntax Error.'
        print 'Usage: %s <filename>' % argv[0]
    else:
        rewrite(sys.argv[1])

