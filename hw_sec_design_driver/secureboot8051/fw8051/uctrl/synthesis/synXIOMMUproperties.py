from string import Template

properties = [
    'aes_state',
    'sha_state',
    'aes_addr',
    'aes_len',
    'sha_rdaddr',
    'sha_wraddr',
    'sha_len'
]

script=Template("""
read_verilog ../src/oc8051_xiommu_gm_top.v ../src/oc8051_xiommu_gm.v ../src/aes_128.v ../src/aes_round.v ../src/aes_table.v ../src/reg2byte.v ../src/reg16byte.v ../src/aes_top.v ../src/oc8051_memarbiter.v ../src/oc8051_xiommu.v ../src/sha1_core.v ../src/sha1_w_mem.v ../src/sha_top.v  ../src/oc8051_gm_xram.v

# abstract oc8051_xiommu_gm_top->oc8051_xiommu_impl_1->oc8051_xram_i
abstract oc8051_xiommu_gm_top->oc8051_xiommu_impl_1->aes_top_i->aes_128_i
abstract oc8051_xiommu_gm_top->oc8051_xiommu_impl_1->sha_top_i->sha1_core_i

cd oc8051_xiommu_gm_top
delexcept property_invalid_$prop
cd ..

hierarchy -check  -top oc8051_xiommu_gm_top
proc -global_arst rst 
techmap -map adff2dff.v 
memory
techmap
flatten 
opt
dfflibmap -liberty abcv2.lib
opt
abc -liberty abcv2.lib
opt_share
opt_clean
opt_const
opt_muxtree
opt_reduce
opt_rmdff
opt
write_verilog -bcd -noinst -noclk -nocmt netlist/oc8051_xiommu_gm_$prop.v
""")

for p in properties:
    filename = 'c51xiommu_%s.ys' % p
    with open(filename, 'wt') as f:
        print >> f, script.substitute(prop=p)

    
