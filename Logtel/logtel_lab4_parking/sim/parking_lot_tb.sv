module parking_lot_tb;

    // DUT signals
    logic        CLOCK  = 0;
    logic        RESET  = 0;
    logic        CI     = 0;
    logic        CO     = 0;
    logic [9:0]  PS;
    logic        Enable;

    // Clock period
    time CLOCK_period = 9ns;

    // Instantiate the DUT
    parking_lot uut (
        .CLOCK(CLOCK),
        .RESET(RESET),
        .CI(CI),
        .CO(CO),
        .PS(PS),
        .Enable(Enable)
    );

    // Clock generation
    always #5ns CLOCK = ~CLOCK;

    // Reset sequence
    initial begin
        RESET = 1;
        #(CLOCK_period * 10);
        RESET = 0;
    end

    // Stimulus
    initial begin
        // Wait for reset to complete
        #(CLOCK_period * 11);

        // Test car entering
        repeat (5) begin
            CI = 1;
            #(CLOCK_period * 2);
            CI = 0;
            #(CLOCK_period * 5);
        end

        // Test car leaving
        repeat (10) begin
            CO = 1;
            #(CLOCK_period * 2);
            CO = 0;
            #(CLOCK_period * 5);
        end

        // Test overflow condition
        repeat (1005) begin
            CI = 1;
            #(CLOCK_period * 2);
            CI = 0;
            #(CLOCK_period * 2);
        end

        // Test car leaving when full
        CO = 1;
        #(CLOCK_period * 2);
        CO = 0;
        #(CLOCK_period * 5);

        // Finish simulation
        $finish;
    end

endmodule
