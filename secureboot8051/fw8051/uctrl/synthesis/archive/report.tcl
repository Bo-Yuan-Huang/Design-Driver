# This script file creates reports for all modules #

set maxpaths 15

check_design > "${log_path}/${rpt_file}"

report_area >> "${log_path}/${rpt_file}"
report_design >> "${log_path}/${rpt_file}"
report_cell >> "${log_path}/${rpt_file}"
report_reference >> "${log_path}/${rpt_file}"
report_port -verbose >> "${log_path}/${rpt_file}"
report_isolate_ports >> "${log_path}/${rpt_file}"
report_net >> "${log_path}/${rpt_file}"
report_compile_options >> "${log_path}/${rpt_file}"
report_constraint -all_violators -verbose >> "${log_path}/${rpt_file}"
report_timing -path end -delay min -max_path $maxpaths >> "${log_path}/${rpt_file}"
report_timing -path end -delay max -max_path $maxpaths >> "${log_path}/${rpt_file}"
report_timing -path full_clock -input_pins -nets -max_path $maxpaths -delay min >> "${log_path}/${rpt_file}"
report_timing -path full_clock -input_pins -nets -max_path $maxpaths -delay max >> "${log_path}/${rpt_file}"           
report_clock -skew >> "${log_path}/${rpt_file}"

