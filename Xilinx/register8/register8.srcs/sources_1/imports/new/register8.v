`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2025 02:39:18 PM
// Design Name: 
// Module Name: register8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 8-bit register with reset and enable
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module register8(
    input clock,
    input reset,
    input enable,
    input [7:0] data_in,
    output reg [7:0] data_out
    );

    always @(posedge clock) begin
        if (reset) begin
            data_out <= 8'b0;
        end else if (enable) begin
            data_out <= data_in;
        end
    end

endmodule
