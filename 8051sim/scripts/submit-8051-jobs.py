import sys
import os
import subprocess
import time

files = [f for f in os.listdir('.') if (f.endswith('.sh') and f.startswith('syn8051'))]
files.sort()

#idx = -1
#for i, f in enumerate(files):
#    if 'IRAM' in f:
#        idx = i
#        break
#assert idx != -1
#
#files = files[idx:]
#print idx, len(files)
print 'total # of jobs: %d' % len(files)

cnt = 0
flag = 0
nodes = ['nodes=sat8', 'nodes=sat9']
LT = 16

for f in files:
    output = subprocess.check_output(['qsub', '-l', nodes[flag], f])
    print f, output.strip()

    if flag == 0: flag = 1
    else: flag = 0

    cnt += 1
    if cnt >= LT:
        while True:
            output  = subprocess.check_output(['qstat'])
            lines = [l.strip() for l in output.split('\n') if len(l.strip())]
            if len(lines) >= LT:
                print 'pausing (cnt=%d).' % len(lines)
                time.sleep(30)
            else:
                cnt = len(lines)
                break


