import sys

def read_espresso(filename):
    expr = []
    with open(filename, 'rt') as fileobj:
        for line in fileobj:
            line = line.strip()
            if len(line) == 0:
                continue
            elif line.startswith('.'):
                continue
            else:
                words = line.split()
                assert len(words) == 2
                assert len(words[0]) == 8
                assert words[1] == '1'

                cube = words[0][::-1]
                s = []
                for i, ci in enumerate(cube):
                    if ci == '0':
                        s.append('!op_out[%d]' % i)
                    elif ci == '1':
                        s.append('op_out[%d]' % i)
                    else:
                        assert ci == '-'

                expr.append( '(%s)' % (' && '.join(s)) )
        print ' || '.join(expr)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Usage: %s <filename>' % (sys.argv[0])
    else:
        read_espresso(sys.argv[1])



