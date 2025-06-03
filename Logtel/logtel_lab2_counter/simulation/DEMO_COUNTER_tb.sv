`timescale 1ns / 1ps

module DEMO_COUNTER_tb_sv;

    // Inputs
    logic CLOCK = 0;
    logic RESET = 0;
    logic CE = 0;

    // Outputs
    logic [9:0] COUNTER;

    // Instantiate the Unit Under Test (UUT)
    demo_counter_sv uut (
        .CLOCK(CLOCK), 
        .RESET(RESET), 
        .CE(CE), 
        .COUNTER(COUNTER)
    );

    // Clock generation: 10ns period
    always #5 CLOCK = ~CLOCK;

    initial begin
        // Reset pulse
        RESET = 1;
        #100;
        RESET = 0;

        // Enable counting
        CE = 1;

        // Let the simulation run for a while
        #100000;

        $finish;
    end

endmodule
