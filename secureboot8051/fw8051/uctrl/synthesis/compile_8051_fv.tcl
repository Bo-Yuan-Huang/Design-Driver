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
read_file -f verilog "${rtl_path}/oc8051_fv_top.v"
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
read_file -f verilog "${rtl_path}/oc8051_rom.v"
read_file -f verilog "${rtl_path}/oc8051_cache_ram.v"
read_file -f verilog "${rtl_path}/oc8051_ram_256x8_two_bist.v"
read_file -f verilog "${rtl_path}/oc8051_ram_64x32_dual_bist.v"

set MODULE_NAME "oc8051_fv_top"
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


set_dont_use {
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/A2SDFFQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFCIN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFCIN_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFCIN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFH_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFH_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDFH_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDF_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDF_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDF_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDH_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDH_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ADDH_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X11M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND3_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AND4_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO1B2_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21A1AI2_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO21_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AO22_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI211_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21B_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI21_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI221_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI222_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI22_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI2XB1_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI31_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/AOI32_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X11M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X16M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BENC_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BITIE6_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BITIE6_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXIT_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXIT_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXIT_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXIT_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXT_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXT_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXT_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BMXT_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X0P8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X11M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X13M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X16M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X1P2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X1P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X2P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X3P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X7P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFH_X9M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X11M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X16M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/BUFZ_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCIN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCIN_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCIN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCON_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCON_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENCON_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENI_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENI_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGENI_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGEN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGEN_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CGEN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CMPR42_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CMPR42_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/CMPR42_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNSRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNSRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFNSRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFRPQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DFFSQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S1_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2S4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/DLY4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/ESDFFQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL16_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL16_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL1_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL1_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL2_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL2_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL4_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL4_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL8_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILL8_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP16_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP16_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP2_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP2_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP32_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP32_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP4_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP4_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP64_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP64_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP8_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLCAP8_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP16_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP16_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP32_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP32_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP64_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP64_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP8_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FILLDGCAP8_A12TS;
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X0P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X0P6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X0P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X0P8B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X11B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X13B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X16B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X1B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X1P2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X1P4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X1P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X2P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X3B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X3P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X7P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/FRICG_X9B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRPQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRPQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRPQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRPQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRPQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNRQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSPQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATNSQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRPQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRPQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRPQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRPQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRPQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATRQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSPQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/LATSQN_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/M2SDFFQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X0P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X0P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X1B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X1P4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X3B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MX2_X8B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXIT4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT2_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/MXT4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2B_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND2XB_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X0P5A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X0P7A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X1A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X1P4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X2A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X3A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X6A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND3XXB_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X0P5A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X0P7A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X1A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X1P4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X2A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X3A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NAND4XXXB_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2B_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR2XB_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X0P5A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X0P7A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X1A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X1P4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X2A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X3A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X4A_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/NOR3_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA211_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21A1OI2_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA21_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OA22_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI211_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21B_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI21_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI221_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI222_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI22_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI2XB1_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OAI31_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR3_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR4_X8M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/OR6_X6M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X0P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X0P6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X0P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X0P8B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X11B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X13B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X16B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X1B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X1P2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X1P4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X1P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X2P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X3B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X3P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X7P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/POSTICG_X9B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X0P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X0P6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X0P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X0P8B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X11B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X13B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X16B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X1B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X1P2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X1P4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X1P7B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X2B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X2P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X3B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X3P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X4B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X6B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X7P5B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/PREICG_X9B_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R1WS_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R1WS_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R1WS_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R2WS_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R2WS_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF1R2WS_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R1WS_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R1WS_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R1WS_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R2WS_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R2WS_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/RF2R2WS_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFNSRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFRPQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQN_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQN_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQN_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQN_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSRPQ_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSRPQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSRPQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSRPQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFSRPQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFYQ_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFYQ_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFYQ_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/SDFFYQ_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/TIEHI_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/TIELO_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XNOR3_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR2_X4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X0P5M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X0P7M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X1M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X1P4M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X2M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X3M_A12TS
    sc12_soi12s0_base_svt_ff_nominal_min_0p99v_m40c_mns/XOR3_X4M_A12TS
}

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

update_timing
#write_sdc "${sdc_path}/${design}.sdc"
report_timing -loop

exit


