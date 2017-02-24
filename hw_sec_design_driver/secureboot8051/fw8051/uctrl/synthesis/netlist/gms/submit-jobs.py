import sys
import os
import subprocess
import time

def count_jobs():
    output  = subprocess.check_output(['qstat'])
    lines = [l.strip() for l in output.split('\n') if len(l.strip())]
    return len(lines)

files = [f for f in os.listdir('.') if f.endswith('acc_gla.avy.sh')]
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
cnt = count_jobs()

print 'total # of jobs: %d' % len(files)
print 'running jobs: %d' % cnt

LT = 60
for f in files:
    output = subprocess.check_output(['qsub', f])
    print f, output.strip()

    cnt += 1
    if cnt >= LT:
        while True:
            time.sleep(240)
            cnt = count_jobs()
            if cnt >= LT:
                print 'pausing (cnt=%d).' % cnt
            else:
                break


