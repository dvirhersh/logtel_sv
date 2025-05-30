module demo_counter (
    input  wire        CLOCK,
    input  wire        RESET,
    input  wire        CE,
    output reg  [9:0]  COUNTER
);

    always @(posedge CLOCK) begin
        if (RESET) begin
            COUNTER <= 10'b0;
        end else if (CE) begin
            COUNTER <= COUNTER + 1;
        end
    end

endmodule
