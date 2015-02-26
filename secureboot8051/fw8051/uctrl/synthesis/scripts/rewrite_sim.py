import sys
import re

def readstate(statefile):
    states = {}
    with open(statefile, 'rt') as fobj:
        for line in fobj:
            line = line.strip()
            if len(line) == 0:
                continue

            words = line.split()
            assert len(words) == 2;
            assert int(words[1]) in [0,1,-1]
            states[words[0]] = int(words[1])

    return states


dff_re = re.compile(r'dff\(([A-Za-z0-9_\[\]$]+),\s*([A-Za-z0-9_\[\]$]+)\);')

def rewrite(filein, statein, fileout):
    states = readstate(statein)
    cnt = 0

    namectr = 1
    with open(filein, 'rt') as infile:
        with open(fileout, 'wt') as outfile:
            for line_orig in infile:
                line = line_orig.strip()
                if line.startswith('dff'):
                    mat = dff_re.match(line)
                    assert mat
                    q,d = mat.group(1), mat.group(2)
                    if q in states:
                        cnt += 1
                        ld = str(states[q]) if states[q] in [0,1] else "0"
                        print >> outfile, '  dff dff_i%d(%s, %s, clk, ld, 1\'b%s);' % (namectr, q, d, ld)
                    else:
                        print >> outfile, '  dff dff_i%d(%s, %s, clk, ld, 1\'b0);' % (namectr, q, d)
                    namectr += 1
                else:
                    print >> outfile, line_orig,

    assert cnt == len(states)
    print cnt

def main(argv):
    if len(argv) != 4:
        print 'Syntax error. '
        print 'Usage %s <input-file> <state-file> <output-file>' % argv[0]
    else:
        rewrite(argv[1], argv[2], argv[3])

if __name__ == '__main__':
    main(sys.argv)


