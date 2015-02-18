###############################################################################
# Environment setup
###############################################################################

# Allow parameterized modules
set hdlin_auto_save_templates true;

# Naming rules
set bus_inference_style {%s[%d]};
set bus_naming_style {%s[%d]};
define_name_rules verilog -allowed "a-z 0-9 _" -case_insensitive;
define_name_rules sverilog -allowed "a-z 0-9 _" -case_insensitive;

# Use wires instead of tri signals in Verilog output
set verilogout_no_tri true;

set verilogout_show_unconnected_pins true;

set hdlout_internal_busses true;
define_design_lib work -path ./WORK;

# Allow the synthesis of adders with carry inputs
set hdlin_use_carry_in true;

# Report inferred latches, flip-flops, tri-states, and multiplexers
set hdlin_report_inferred_modules true;

# Write out top-level modules first when writing verilog files
#set verilogout_higher_designs_first true;

#set hdlin_redundancy_elimination true;
#set hdlin_share_all_operators true;

#set case_analysis_with_logic_constants true;

# Needed for forward SAIF file generation
#set power_preserve_rtl_hier_names true;

# Suppress useless warnings.
#
# VER-314: Warning: Starting with the 2000.11-1 release, the Presto Verilog
# reader treats Verilog 'integer' types as signed; synthesized result may not
# match earlier versions of HDL Compiler.
#suppress_message VER-314;
# OPT-170: Information: Changed wire load model for '<module>' from '<foo<' to
# '<bar>'.
#suppress_message OPT-170;
# OPT-1006: Warning: Pad '<foo>' connected to port '<bar>' is dont-touch. No 
# optimization done.
#suppress_message OPT-1006;

# Warning: Line 34175, Can't find object 'u996/Y'. (SAIF-16)
#suppress_message SAIF-16;
