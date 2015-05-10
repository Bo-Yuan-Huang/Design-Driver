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
/usr/bin/time ./xm8051syn.py --output $ast $op $state >& $out""")

all_state = [
    'dataout', 'xram', 'aes_addr', 'aes_len',
    'aes_state', 'aes_ctr', 'aes_key0', 'aes_key1', 
    'aes_bytes_processed', 'aes_read_data', 'aes_enc_data',
    'sha_state', 'sha_rdaddr', 'sha_wraddr', 'sha_len', 
    'sha_bytes_processed', 'sha_read_data', 'sha_digest', 
]

def create_scripts(start, stop, name, state):
    for op in xrange(start, stop):
        basename = 'synXMEM_%s_%02x' % (name, op)
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
    parser = argparse.ArgumentParser(description='XMEM+crypto synthesis job script')
    parser.add_argument("name", help="job name")
    args = parser.parse_args()
    for s in all_state:
        name = args.name + '_' + s
        create_scripts(0, 16, name, [s])

if __name__ == '__main__':
    main()

