#! /usr/bin/python2.7

import sys
import os
import stat
import argparse

from string import Template

def find_files(d):
    files = os.listdir(d)
    return [os.path.join(d, f) for f in files if f.endswith('.bench')]


script = Template("""#PBS -l walltime=36:00:00
cd $curdir
time ./uc8051syn.py --output $ast $op $state >& $out""")

all_state = [
    'PC', 'ACC', 'IRAM', 'PSW', 'SP',
    'B', 'DPL', 'DPH', 'P0', 'P1', 'P2', 'P3',
    'PCON', 'TCON', 'TMOD', 'TL0', 'TH0', 'TL1',
    'TH1', 'SCON', 'SBUF', 'IE', 'IP', 
    'XRAM_ADDR', 'XRAM_DATA_OUT'
]

def create_scripts(start, stop, name, state):
    for op in xrange(start, stop):
        basename = 'syn8051_%s_%02x' % (name, op)
        script_name = 'scripts/%s.sh' % basename
        output = 'output/%s.out' % basename
        ast = 'output/%s.ast' % basename
        with open(script_name, 'wt') as fileobj:
            print >> fileobj, script.substitute(
                                curdir=os.getcwd(),
                                op='0x%02x' % op,
                                ast=ast,
                                state=' '.join(state),
                                out=output)

        os.chmod(script_name, stat.S_IREAD + stat.S_IWRITE + stat.S_IEXEC)
    
def auto_int(x):
    return int(x, 0)

def main():
    parser = argparse.ArgumentParser(description='8051 synthesis job script')
    parser.add_argument("start_opcode", help="start opcode", type=auto_int)
    parser.add_argument("stop_opcode", help="stop opcode", type=auto_int)
    parser.add_argument("name", help="job name")
    parser.add_argument("state", help="state (use '<all>' to synthesize everything", nargs="+")
    args = parser.parse_args()
    if args.state == ['<all>']:
        for s in all_state:
            name = args.name + '_' + s
            create_scripts(args.start_opcode, args.stop_opcode, name, [s])
    else:
        create_scripts(args.start_opcode, args.stop_opcode, args.name, args.state)

if __name__ == '__main__':
    main()

