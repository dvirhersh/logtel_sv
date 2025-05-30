# Vivado Tcl Script for logtel_lab2_counter project recreation

set proj_name "logtel_lab2_counter"
set proj_dir "./$proj_name"

# Create project, overwrite if exists
create_project $proj_name $proj_dir -part xc7a100tcsg324-1 -force

# Set board part
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]

# Add RTL sources
add_files -fileset sources_1 ./$proj_name/rtl/counter.v
add_files -fileset sources_1 ./$proj_name/rtl/counter.sv

# Set top module for synthesis
set_property top demo_counter [get_filesets sources_1]

# Add simulation sources
add_files -fileset sim_1 ./$proj_name/simulation/DEMO_COUNTER_tb.v
add_files -fileset sim_1 ./$proj_name/simulation/DEMO_COUNTER_tb.sv

# Set top module for simulation
set_property top DEMO_COUNTER_tb_sv [get_filesets sim_1]

# Optional: run synthesis
# launch_runs synth_1
# wait_on_run synth_1

puts "Project '$proj_name' created successfully at: $proj_dir"
