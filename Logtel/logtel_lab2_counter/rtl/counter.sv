module demo_counter_sv (
    input  logic       CLOCK,
    input  logic       RESET,
    input  logic       CE,
    output logic [9:0] COUNTER
);

    always_ff @(posedge CLOCK) begin
        if (RESET) begin
            COUNTER <= 10'd0;
        end else if (CE) begin
            COUNTER <= COUNTER + 1;
        end
    end

endmodule
