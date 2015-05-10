import re
import sys


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


print get_time(sys.argv[1])
