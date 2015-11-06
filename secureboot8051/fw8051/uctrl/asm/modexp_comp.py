m = 0
n = 0
e = 0
for i in xrange(256,-1,-1):
    m = m << 8 | i & 0xFF
    n = n << 8 | (i|i<<4)&0xFF
    e = e << 8 | (i*i*i)&0xFF

c = pow(m,e,n)

with open('../src/pass.v' ,'wt') as f:
    print >> f, "assign pass = oc8051_xiommu1.modexp_top_i.modexp_i.c == 2048'h%x;" %c

with open('comparr', 'wt') as f:
    for i in xrange(64):
        print >> f, "    comp[%d] = 0x%08x;" %(i,(c >> i*32) & 0xFFFFFFFF)
