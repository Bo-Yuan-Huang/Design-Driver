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
    print '  assign const_zero = 0;'
    print '  assign const_one = 1;'
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
                assert v == '0' or v == '1' or v == '1\'b1' or v == '1\'b0'
                if v.startswith('1\'b'): v = v[3:]
                assert v == '0' or v == '1', v

                ports[p.portname] = v
            else:
                assert False, p.argname

    print_block(c.module, c.name, ports, instances, defs)


gate_name_map = {
    'AND2'  : 'and',
    'NAND2' : 'nand',
    'OR2'   : 'or',
    'NOR2'  : 'nor',
    'XOR2'  : 'xor',
    'XNOR2' : 'xnor',
    'INV'   : 'not',
    'BUF'   : 'buf'
}

def print_block(name, instance, ports, instances, defs):
    underscore_pos = name.find('_')
    assert underscore_pos != -1
    gate_name = name[:underscore_pos]

    if gate_name in gate_name_map:
        assert len(ports) == 2 or len(ports) == 3

        assert 'Y' in ports
        assert 'A' in ports
        port_str = [ports['Y'], ports['A']]
        if len(ports) == 3:
            assert 'B' in ports
            port_str += [ports['B']]
        
        instances.append('%s(%s)' % (gate_name_map[gate_name], ', '.join(port_str)))
    elif gate_name == 'DFFQ':
        assert len(ports) == 3
        assert 'Q' in ports
        assert 'D' in ports
        assert 'CK' in ports
        instances.append('dff(%s, %s)' % (ports['Q'], ports['D']))
    elif gate_name == 'DFFQN':
        assert len(ports) == 3
        assert 'QN' in ports
        assert 'D' in ports
        assert 'CK' in ports
        Qwire = '%s_%s_Q' % (ports['QN'], instance)
        instances.append('dff(%s, %s)' % (Qwire, ports['D']))
        instances.append('not(%s, %s)' % (ports['QN'], Qwire))
        defs.append(('wire', Qwire))
    elif gate_name == 'DFFSRPQ':
        pns = ['D', 'CK', 'R', 'SN', 'Q']
        for p in pns:
            assert p in ports
        assert len(pns) == len(ports)

        name = lambda n1, n2: '%s_%s_%s' % (ports[n1], instance, n2)
        constant = lambda n: n == '0' or n == '1'
        def fix_constant (n): 
            if n == '0':
                return 'const_zero'
            elif n == '1':
                return 'const_one'
            else:
                return n

        def invert(n): 
            assert n == '0' or n == '1'
            if n == '0': return '1'
            else: return '0'

        SNwire = ports['SN']
        Swire = invert(SNwire) if constant(SNwire) else name('SN', 'S') 

        Rwire = ports['R']
        RNwire = invert(Rwire) if constant(Rwire) else name('R', 'RN')

        Dwire = ports['D']
        if constant(Dwire):
            DRwire = '%s_%s' % (instance, 'DR')
            DSRwire = '%s_%s' % (instance, 'DSR')
        else:
            DRwire = name('D', 'DR')
            DSRwire = name('D', 'DSR')

        Qwire = ports['Q']

        if not constant(Swire): defs.append(('wire', Swire))
        if not constant(RNwire): defs.append(('wire', RNwire))
        defs.append(('wire', DRwire))
        defs.append(('wire', DSRwire))

        add_gate = lambda t, args: instances.append('%s(%s)' % (t, ', '.join(args)))
        if not constant(SNwire): add_gate('not', [Swire, SNwire])
        if not constant(RNwire): add_gate('not', [RNwire, Rwire])

        # return 0,1 -> const_zero, const_one
        Swire = fix_constant(Swire)
        SNwire = fix_constant(SNwire)
        Rwire = fix_constant(Rwire)
        RNwire = fix_constant(RNwire)
        Dwire = fix_constant(Dwire)

        add_gate('and', [DRwire, Dwire, RNwire])
        add_gate('or', [DSRwire, DRwire, Swire])
        add_gate('dff', [Qwire, DSRwire])

    else:
        assert False, 'not implemented gate type: %s' % gate_name

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Syntax Error.'
        print 'Usage: %s <filename>' % argv[0]
    else:
        rewrite(sys.argv[1])

