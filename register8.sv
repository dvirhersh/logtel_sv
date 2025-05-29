`timescale 1ns / 1ps

module register8_sv (
    input  logic        clock,
    input  logic        reset,
    input  logic        enable,
    input  logic [7:0]  data_in,
    output logic [7:0]  data_out
);

    always_ff @(posedge clock) begin
        if (reset)
            data_out <= 8'b0;
        else if (enable)
            data_out <= data_in;
    end

endmodule
