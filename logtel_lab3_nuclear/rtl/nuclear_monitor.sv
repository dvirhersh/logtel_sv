module nuclear_monitor (
    input  logic CLOCK,
    input  logic RESET,
    input  logic RAD,
    output logic ALARM
);

    // 9-bit counter: max_rad = 500 clocks (20ns each = 10 µs)
    logic [8:0] count = 9'd0;
    localparam int max_rad = 500;

    // Counter process
    always_ff @(posedge CLOCK) begin
        if (RESET || ~RAD)
            count <= 9'd0;
        else if (count < max_rad)
            count <= count + 1;
        else
            count <= count;
    end

    // Alarm logic
    always_ff @(posedge CLOCK) begin
        if (RESET)
            ALARM <= 1'b0;
        else if (count == max_rad)
            ALARM <= 1'b1;
        else
            ALARM <= 1'b0;
    end

endmodule
