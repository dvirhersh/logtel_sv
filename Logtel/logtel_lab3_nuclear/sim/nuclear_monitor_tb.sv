`timescale 1ns / 1ps

module nuclear_monitor_tb;

    logic CLOCK = 0;
    logic RESET = 0;
    logic RAD   = 0;
    logic ALARM;

    // Clock generation: 20ns period
    always #10 CLOCK = ~CLOCK;

    // Instantiate the Unit Under Test (UUT)
    nuclear_monitor uut (
        .CLOCK(CLOCK),
        .RESET(RESET),
        .RAD(RAD),
        .ALARM(ALARM)
    );

    initial begin
        // Apply reset
        RESET = 1;
        #200;
        RESET = 0;

        // Stimulus sequence
        RAD = 1;
        #40000; // 40 us

        RAD = 0;
        #60000; // 60 us

        RAD = 1;
        #7000;  // 7 us

        RAD = 0;
        #93000; // 93 us

        RAD = 1;
        #15000; // 15 us

        RAD = 0;
        #85000; // 85 us

        $finish;
    end

endmodule
