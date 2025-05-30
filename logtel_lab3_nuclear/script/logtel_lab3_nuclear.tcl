# Vivado Tcl Script for logtel_lab3_nuclear project recreation

set proj_name "logtel_lab3_nuclear"
set proj_dir "./$proj_name"

# Create project, overwrite if exists
create_project $proj_name $proj_dir -part xc7a100tcsg324-1 -force

# Set board part
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]

# Add RTL sources
add_files -fileset sources_1 ./$proj_name/rtl/nuclear_monitor.sv

# Set top module for synthesis
set_property top nuclear_monitor [get_filesets sources_1]

# Add simulation sources
add_files -fileset sim_1 ./$proj_name/simulation/nuclear_monitor_tb.sv

# Set top module for simulation
set_property top nuclear_monitor_tb [get_filesets sim_1]

# Optional: run synthesis
# launch_runs synth_1
# wait_on_run synth_1

puts "Project '$proj_name' created successfully at: $proj_dir"
