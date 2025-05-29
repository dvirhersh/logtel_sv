`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 03:39:16 PM
// Design Name: 
// Module Name: LED_manager
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Verilog version of LED_manager with 2 register8 instances and mux
// 
//////////////////////////////////////////////////////////////////////////////////

module LED_manager(
    input  wire [7:0] Channel_1_data,
    input  wire [7:0] Channel_2_data,
    input  wire       Channel_1_enable,
    input  wire       Channel_2_enable,
    input  wire       selector,
    input  wire       clock,
    input  wire       reset,
    output reg  [7:0] data_out
);

    // Internal signals for register outputs
    wire [7:0] Channel_1_register_data;
    wire [7:0] Channel_2_register_data;
    reg  [7:0] mux_data_selected;

    // Instantiate register8 for Channel 1
    register8 regCh1 (
        .clock(clock),
        .reset(reset),
        .enable(Channel_1_enable),
        .data_in(Channel_1_data),
        .data_out(Channel_1_register_data)
    );

    // Instantiate register8 for Channel 2
    register8 regCh2 (
        .clock(clock),
        .reset(reset),
        .enable(Channel_2_enable),
        .data_in(Channel_2_data),
        .data_out(Channel_2_register_data)
    );

    // Combinational multiplexer
    always @(*) begin
        case (selector)
            1'b0: mux_data_selected = Channel_1_register_data;
            1'b1: mux_data_selected = Channel_2_register_data;
            default: mux_data_selected = 8'b0;
        endcase
    end

    // Output register
    always @(posedge clock) begin
        data_out <= mux_data_selected;
    end

endmodule
