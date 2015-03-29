#! /usr/bin/python2.7

import sys
import os
import stat
import argparse
from uc8051syn import auto_int

from string import Template

def find_files(d):
    files = os.listdir(d)
    return [os.path.join(d, f) for f in files if f.endswith('.bench')]


script = Template("""#PBS -l walltime=36:00:00
cd $curdir
./uc8051syn.py $op $state >& $out""")

def create_scripts(start, stop, name, state):
    for op in xrange(start, stop):
        script_name = 'syn51_%s_%02x.sh' % (name, op)
        output = 'syn51_%02x.%s' % (op, name)
        with open(script_name, 'wt') as fileobj:
            print >> fileobj, script.substitute(
                                curdir=os.getcwd(),
                                op='0x%02x' % op,
                                state=' '.join(state),
                                out=output)

        os.chmod(script_name, stat.S_IREAD + stat.S_IWRITE + stat.S_IEXEC)
    
def main():
    parser = argparse.ArgumentParser(description='8051 synthesis job script')
    parser.add_argument("start_opcode", help="start opcode", type=auto_int)
    parser.add_argument("stop_opcode", help="stop opcode", type=auto_int)
    parser.add_argument("name", help="job name")
    parser.add_argument("state", help="state", nargs="+")
    args = parser.parse_args()
    create_scripts(args.start_opcode, args.stop_opcode, args.name, args.state)

if __name__ == '__main__':
    main()

