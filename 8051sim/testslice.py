class C(object):
    def __init__(self, x):
        self.x = x

    def __getitem__(self, val):
        try:
            stop = val.start
            start = val.stop
            step = val.step
            if step:
                raise NotImplementedError, 'Slice steps are not supported.'
            if stop < start:
                raise ValueError, 'Slice end (%d) must be greater than start (%d).' % (stop, start)
            l = stop - start + 1
            mask = (1 << l) - 1
            return (self.x >> start) & mask
        except AttributeError:
            return (self.x >> val) & 1

n = C(0xAA)
print n[0], n[1], n[2], n[3]
print n[3:0], n[5:3]

