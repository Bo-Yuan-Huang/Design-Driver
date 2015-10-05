import os
from string import Template
from subprocess import Popen, PIPE, STDOUT
import stat

properties = [
#    'pc',
#    'acc',
#    'b_reg',
#    'dpl',
#    'dph',
#    'iram',
#    'p0',
#    'p1',
#    'p2',
#    'p3',
    'psw',
#    '// sp',
#    'xram_addr',
#    'xram_data_out'
]


synthesis_script = Template("""
read_verilog ../src/ind-models/oc8051_gm_ind_top_${opcode}.v ../src/golden-models/oc8051_gm_${opcode}.v ../src/oc8051_top.v ../src/oc8051_alu_src_sel.v ../src/oc8051_alu.v ../src/oc8051_decoder.v ../src/oc8051_divide.v ../src/oc8051_multiply.v ../src/oc8051_memory_interface.v ../src/oc8051_gm_ram_top.v ../src/oc8051_acc.v ../src/oc8051_comp.v ../src/oc8051_sp.v ../src/oc8051_dptr.v ../src/oc8051_cy_select.v ../src/oc8051_psw.v ../src/oc8051_gm_indi_addr.v ../src/oc8051_ports.v ../src/oc8051_b_register.v ../src/oc8051_uart.v ../src/oc8051_int.v ../src/oc8051_tc.v ../src/oc8051_tc2.v ../src/oc8051_wb_iinterface.v ../src/oc8051_sfr.v ../src/oc8051_rom.v ../src/oc8051_cache_ram.v ../src/oc8051_gm_ram_256x8_two_bist.v ../src/oc8051_gm_cxrom.v 

cd oc8051_gm_top
delexcept property_invalid_${prop}
cd ..
hierarchy -check  -top oc8051_gm_top
proc -global_arst rst 
techmap -map adff2dff.v 
memory
techmap
flatten
dfflibmap -liberty abcv2.lib
abc -liberty abcv2.lib
opt
write_verilog -bcd -noinst -noclk -nocmt netlist/gms/oc8051_gm_${opcode}_${prop}.v
""")


bash_script = Template("""#PBS -l walltime=36:00:00
cd $curdir
yosys $yoscript >& $out""")

bad_ops = [
    0xc2,0xc3,0xb2,0xb3,0xa2,0x82,0xb0,0x92,0x72,0xa0,0xd2,0xd3,0xd4,0xd0,0x10,0x20,0x30
]

print len(bad_ops)
for op in xrange(0x100):
    if op in bad_ops:
        continue

    opcode = '%02x' % op
    for p in properties:
        print opcode, p

        script = synthesis_script.substitute(opcode=opcode, prop=p)
        yoscript = 'gmscript/c51gm_ind_%s_%s.ys' % (opcode, p)
        with open(yoscript, 'wt') as f:
            print >> f, script























########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
########
        
