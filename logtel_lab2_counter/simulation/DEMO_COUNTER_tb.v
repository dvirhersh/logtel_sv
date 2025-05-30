`timescale 1ns / 1ps

module DEMO_COUNTER_tb;

    // Inputs
    reg CLOCK = 0;
    reg RESET = 0;
    reg CE = 0;

    // Outputs
    wire [9:0] COUNTER;

    // Instantiate the Unit Under Test (UUT)
    demo_counter uut (
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
        #1000;
        
        $finish;
    end

endmodule
