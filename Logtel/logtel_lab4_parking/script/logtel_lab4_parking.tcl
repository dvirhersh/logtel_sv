# Vivado Tcl Script for logtel_lab4_parking project recreation

set proj_name "logtel_lab4_parking"
set proj_dir "./logtel/$proj_name"

# Create project, overwrite if exists
create_project $proj_name $proj_dir -part xc7a100tcsg324-1 -force

# Set board part
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.2 [current_project]

# Add RTL sources
add_files -fileset sources_1 ./logtel/$proj_name/rtl/parking_lot.sv

# Set top module for synthesis
set_property top parking_lot [get_filesets sources_1]

# Add sim sources
add_files -fileset sim_1 ./logtel/$proj_name/sim/parking_lot_tb.sv

# Set top module for sim
set_property top parking_lot_tb [get_filesets sim_1]

# Optional: run synthesis
# launch_runs synth_1
# wait_on_run synth_1

puts "Project '$proj_name' created successfully at: $proj_dir"
