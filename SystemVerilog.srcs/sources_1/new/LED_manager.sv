`timescale 1ns / 1ps





module LED_manager_sv(
    input  logic [7:0] Channel_1_data,
    input  logic [7:0] Channel_2_data,
    input  logic       Channel_1_enable,
    input  logic       Channel_2_enable,
    input  logic       selector,
    input  logic       clock,
    input  logic       reset,
    output logic [7:0] data_out
);

    










// Internal signals for register outputs
    logic [7:0] Channel_1_register_data;
    logic [7:0] Channel_2_register_data;
    logic [7:0] mux_data_selected;

    // Instantiate register8 for Channel 1
    register8_sv regCh1_sv (
        .clock    (clock),
        .reset    (reset),
        .enable   (Channel_1_enable),
        .data_in  (Channel_1_data),
        .data_out (Channel_1_register_data)
    );

    // Instantiate register8 for Channel 2
    register8_sv regCh2_sv (
        .clock    (clock),
        .reset    (reset),
        .enable   (Channel_2_enable),
        .data_in  (Channel_2_data),
        .data_out (Channel_2_register_data)
    );

    // Combinational multiplexer
    always_comb begin
        case (selector)
            1'b0: mux_data_selected = Channel_1_register_data;
            1'b1: mux_data_selected = Channel_2_register_data;
            default: mux_data_selected = 8'b0;
        endcase
    end

    // Output register
    always_ff @(posedge clock) begin
        data_out <= mux_data_selected;
    end

endmodule
