# Vivado Tcl Script for logtel_lab5_memories project recreation

set proj_name "logtel_lab5_memories"
set proj_dir "./logtel/$proj_name"

# Create project
create_project $proj_name $proj_dir -part xc7a100tcsg324-1 -force

# Set board part
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.2 [current_project]

# Add memory init file (.coe)
import_files -fileset sources_1 ./logtel/$proj_name/ips/data_simulation.coe

# Add IP block (.xci) — now in same folder as .coe
import_ip ./logtel/$proj_name/ips/blk_mem_gen_0.xci

# Add testbench file
import_files -fileset sim_1 ./logtel/$proj_name/sim/rom_tb.sv
set_property top rom_tb [get_filesets sim_1]

# Optional: run synthesis
# launch_runs synth_1
# wait_on_run synth_1

puts "Project '$proj_name' created successfully at: $proj_dir"
