import re
import os
import sys

from collections import defaultdict
import matplotlib.pyplot as plt
import numpy as np

user_re = re.compile(r'(\d+\.\d+)user')
system_re = re.compile(r'(\d+\.\d+)system')

def get_time(filename):
    with open(filename, 'rt') as f:
        for line in f:
            words = line.split()
            if len(words) >= 2:
                m1 = user_re.match(words[0])
                m2 = system_re.match(words[1])

                if m1 and m2:
                    t1 = float(m1.group(1))
                    t2 = float(m2.group(1))
                    return t1+t2
    assert False


def get_times(prefix, directory):
    files = [f for f in os.listdir(directory) if f.endswith('.out')]
    times = defaultdict(list)
    for f in files:
        assert f.startswith(prefix), f
        t = f[len(prefix):-7]
        times[t].append(get_time(os.path.join(directory, f)))

    f = 0
    for t in sorted(times.iterkeys()):
        f = (f + 1) % 2
        vec = np.array(times[t])
        s = '%s & %.1f/%.1f' % (t, np.average(vec), max(vec))
        if f == 1:
            print s + ' & '
        else:
            print s + ' \\\\ '


# prefix = 'syn8051_r2_'
if __name__ == '__main__':
    get_times(sys.argv[1], sys.argv[2])


