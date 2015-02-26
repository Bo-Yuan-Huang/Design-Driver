#******************************************************************************
# Set the design paths
set rtl_path "../src/"

set netList_path "./netlist/"
set sdc_path "./temp/"
set log_path "./temp/"

lappend search_path $rtl_path


#******************************************************************************
# environment setup
#******************************************************************************
source setup_env.tcl


#******************************************************************************
# library setup 
#******************************************************************************

#set stdCell_path "/u/national/designPackages/cmos9/R7/libraries/std_cells/xlitehd_core/synopsys/C950.v180_t60_t"
#set stdCell_path "/fs/jalapeno/cad/national/designPackages/cmos9/R4.3/libraries/std_cells/xlitehd_core_01.5/synopsys/C950.v180_t60_t"
#set stdCell_path "../../../../usr/licensed/synopsys/syn_F-2011.09-SP1a/libraries/syn"
#added '../' ^ 6/25
set stdCell_path "/n/homeserver2/user2a/psubrama/synth_libs"
lappend search_path $stdCell_path


#set target_library "gtech.db"
#set target_library "sc12_soi12s0_base_rvt_tt_nominal_max_1p00v_25c_mxs.db"
#set target_library "sc12_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns.db"
set target_library "sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns.db"
#set target_library "sc12_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns.db"

#set link_library [concat "*" "gtech.db" "dw_foundation.sldb"]
#set link_library [concat "*" "sc12_soi12s0_base_rvt_tt_nominal_max_1p00v_25c_mxs.db" "dw_foundation.sldb"]
#set link_library [concat "*" "sc12_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns.db" "dw_foundation.sldb"]
set link_library [concat "*" "sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns.db" "dw_foundation.sldb"]
#set link_library [concat "*" "sc12_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns.db" "dw_foundation.sldb"]

#
# NSC library PP
#source "${stdCell_path}/xlitehd_core.add_synop_scr"

#
# Designware
#set synlib_wait_for_design_license "DesignWare-Foundation"

#
# Wire Load models
#lappend link_library /fs/jalapeno/cad/national/designPackages/cmos9/R4.3/libraries/std_cells/xlite9_core_08.5/synopsys/C950/ext_wireload.db

#
#Flatten?
#

#******************************************************************************
# read RTL
#******************************************************************************
read_file -f verilog "${rtl_path}/oc8051_top.v"
read_file -f verilog "${rtl_path}/oc8051_alu_src_sel.v"
read_file -f verilog "${rtl_path}/oc8051_alu.v"
read_file -f verilog "${rtl_path}/oc8051_decoder.v"
read_file -f verilog "${rtl_path}/oc8051_divide.v"
read_file -f verilog "${rtl_path}/oc8051_multiply.v"
read_file -f verilog "${rtl_path}/oc8051_memory_interface.v"
read_file -f verilog "${rtl_path}/oc8051_ram_top.v"
read_file -f verilog "${rtl_path}/oc8051_acc.v"
read_file -f verilog "${rtl_path}/oc8051_comp.v"
read_file -f verilog "${rtl_path}/oc8051_sp.v"
read_file -f verilog "${rtl_path}/oc8051_dptr.v"
read_file -f verilog "${rtl_path}/oc8051_cy_select.v"
read_file -f verilog "${rtl_path}/oc8051_psw.v"
read_file -f verilog "${rtl_path}/oc8051_indi_addr.v"
read_file -f verilog "${rtl_path}/oc8051_ports.v"
read_file -f verilog "${rtl_path}/oc8051_b_register.v"
read_file -f verilog "${rtl_path}/oc8051_uart.v"
read_file -f verilog "${rtl_path}/oc8051_int.v"
read_file -f verilog "${rtl_path}/oc8051_tc.v"
read_file -f verilog "${rtl_path}/oc8051_tc2.v"
read_file -f verilog "${rtl_path}/oc8051_icache.v"
read_file -f verilog "${rtl_path}/oc8051_wb_iinterface.v"
read_file -f verilog "${rtl_path}/oc8051_sfr.v"
read_file -f verilog "${rtl_path}/oc8051_cache_ram.v"
read_file -f verilog "${rtl_path}/oc8051_rom.v"
read_file -f verilog "${rtl_path}/oc8051_ram_256x8_two_bist.v"
read_file -f verilog "${rtl_path}/oc8051_ram_64x32_dual_bist.v"
read_file -f verilog "${rtl_path}/oc8051_cxrom.v"

set MODULE_NAME "oc8051_top"
#-------------------------------------------------------------

#------------------------------------------------------------------



# Set the name of the report file
set rpt_file "$MODULE_NAME.rpt"

# Set the current design
set design "$MODULE_NAME"
current_design "$MODULE_NAME"

#set design "FIR_Filter_Bank"
#current_design "FIR_Filter_Bank"

#******************************************************************************
# generate clocks
#******************************************************************************

#create_clock -name Clk600 -period 500 -waveform {0 250} Clk600
#create_generated_clock -name Clk75 -source Clk600 -edges {1 2 3} -edge_shift {0 0 0} Clk75

#set_input_delay 250 -clock Clk600 -max [all_inputs]
#set_input_delay 250 -clock Clk600 -min [all_inputs]
#remove_input_delay -clock Clk600 { Clk75 }
#!!! how do I set constraints between clock domains !!!

#set_output_delay 10 -clock Clk600 [all_outputs]

#set_load 0.1 [all_outputs]

#******************************************************************************
# precompile
#******************************************************************************

#
# cells to not use
#
#set_dont_use {xlitehd_core/NAND2D1X0_TAH0 xlitehd_core/NAND2D1X1_TAH0}

#set_dont_use {
#gtech/GTECH_AND2
#gtech/GTECH_FD1
#gtech/GTECH_NOR2
#gtech/GTECH_NOT
#    gtech/GTECH_FD1S gtech/GTECH_FD2 gtech/GTECH_FD2S gtech/GTECH_FD3 gtech/GTECH_FD3S gtech/GTECH_FD4 gtech/GTECH_FD4S
#    gtech/GTECH_FD14 gtech/GTECH_FD18 gtech/GTECH_FD24 gtech/GTECH_FD28
#    gtech/GTECH_FD34 gtech/GTECH_FD38 gtech/GTECH_FD44 gtech/GTECH_FD48
#}

##set_dont_use {
#    gtech/GTECH_ADD_AB gtech/GTECH_ADD_ABC 
#    gtech/GTECH_AND3 gtech/GTECH_AND4 gtech/GTECH_AND5 gtech/GTECH_AND8 gtech/GTECH_AND_NOT 
#    gtech/GTECH_AO21 gtech/GTECH_AO22 gtech/GTECH_AOI2N2 gtech/GTECH_AOI21 gtech/GTECH_AOI22 gtech/GTECH_AOI222 
#    gtech/GTECH_BUF 
#    gtech/GTECH_FJK1 gtech/GTECH_FJK1S gtech/GTECH_FJK2 gtech/GTECH_FJK2S gtech/GTECH_FJK3 gtech/GTECH_FJK3S 
#    gtech/GTECH_INBUF gtech/GTECH_INOUTBUF 
#    gtech/GTECH_ISO0_EN0 gtech/GTECH_ISO0_EN1 gtech/GTECH_ISO1_EN0 gtech/GTECH_ISO1_EN1
#    gtech/GTECH_ISOLATCH_EN0 gtech/GTECH_ISOLATCH_EN1 
#    gtech/GTECH_LD1 gtech/GTECH_LD2 gtech/GTECH_LD2_1 gtech/GTECH_LD3 gtech/GTECH_LD4 gtech/GTECH_LD4_1
#    gtech/GTECH_LSR0 gtech/GTECH_MAJ23
#    gtech/GTECH_MUX2 gtech/GTECH_MUX4 gtech/GTECH_MUX8 gtech/GTECH_MUXI2 gtech/GTECH_NAND2
#    gtech/GTECH_NAND3 gtech/GTECH_NAND4 gtech/GTECH_NAND5 gtech/GTECH_NAND8
#    gtech/GTECH_NOR3 gtech/GTECH_NOR4 gtech/GTECH_NOR5 gtech/GTECH_NOR8
#    gtech/GTECH_OA21 gtech/GTECH_OA22 gtech/GTECH_OAI2N2 gtech/GTECH_OAI21 gtech/GTECH_OAI22
#    gtech/GTECH_ONE 
#    gtech/GTECH_OR2 gtech/GTECH_OR3 gtech/GTECH_OR4 gtech/GTECH_OR5 gtech/GTECH_OR8   
#    gtech/GTECH_OR_NOT
#    gtech/GTECH_OUTBUF gtech/GTECH_TBUF
#    gtech/GTECH_XNOR2 gtech/GTECH_XNOR3 gtech/GTECH_XNOR4
#    gtech/GTECH_XOR2 gtech/GTECH_XOR3 gtech/GTECH_XOR4
#    gtech/GTECH_ZERO 

##}

#set_dont_use {
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDF_X1M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDH_X1M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFH_X1M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFCIN_X1M_A9TS
#
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFCIN_X1P4M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFH_X1P4M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDF_X1P4M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDH_X1P4M_A9TS
#
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDF_X2M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDH_X2M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFH_X2M_A9TS
#	sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns/ADDFCIN_X2M_A9TS
#	
#}

link
check_design
#write -f verilog -output "${netList_path}/${design}_interm.sv"
write -f verilog -hier -output "${netList_path}/${design}_interm.sv"
uniquify

#******************************************************************************
# compile
#******************************************************************************

source setup_compile.tcl

compile

#******************************************************************************
# generate output netlist
#******************************************************************************
set_flatten true -effort high
ungroup -all -flatten
uniquify

#change_names -rules verilog
change_names -rules verilog -hier
write -f verilog -hier -output "${netList_path}/${design}_flat.v"
#write -f ddc -hier -output "${netList_path}/${design}.ddc"
#write -f verilog -output "${netList_path}/${design}.v"
#write -f ddc -output "${netList_path}/${design}.ddc"


#******************************************************************************
# generate  reports
#******************************************************************************

#source report.tcl


#******************************************************************************
# generate constraints file
#******************************************************************************

#set_false_path -from [get_clocks {Clk600}] -to [get_clocks {Clk75}]
#set_false_path -from [get_clocks {Clk75}] -to [get_clocks {Clk600}]
#!!! how do I set constraints between clock domains !!!

#update_timing
#write_sdc "${sdc_path}/${design}.sdc"

exit


