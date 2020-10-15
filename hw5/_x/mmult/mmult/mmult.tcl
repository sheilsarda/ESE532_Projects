catch {::common::set_param -quiet hls.xocc.mode csynth};
catch {::common::set_param -quiet hls.enable_scout_hidden_option_error false};
# 
# Hls run script generated by the compiler
# 

set vpp_optimize_level 0
open_project mmult
set_top mmult
add_files "/home/centos/ESE532_Projects/hw5/hls/MatrixMultiplication.cpp" -cflags " -g -I /home/centos/ESE532_Projects/hw5/common -I /home/centos/ESE532_Projects/hw5/hls "
open_solution -flow_target vitis solution
set_part xcvu9p-flgb2104-2-i
create_clock -period 250.000000MHz -name default
config_rtl -kernel_profile
config_export -vivado_optimization_level $vpp_optimize_level
config_dataflow -strict_mode warning
config_debug -enable
set_clock_uncertainty 27.000000%
config_rtl -m_axi_conservative_mode=1
config_interface -m_axi_addr64
config_interface -default_slave_interface s_axilite
config_export -format ip_catalog -ipname mmult
catch {::common::set_param -quiet hls.enable_synthesis_check_sw_only true};
csynth_design -synthesis_check
close_project
puts "HLS completed successfully"
exit
