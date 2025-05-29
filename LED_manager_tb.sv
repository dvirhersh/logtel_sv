`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 04:03:31 PM
// Design Name: 
// Module Name: LED_manager_tb
// Description: SystemVerilog Testbench for LED_manager
//
//////////////////////////////////////////////////////////////////////////////////

module LED_manager_tb;

    // Signals
    logic [7:0] Channel_1_data   = 8'd0;
    logic [7:0] Channel_2_data   = 8'd0;
    logic       Channel_1_enable = 1'b0;
    logic       Channel_2_enable = 1'b0;
    logic       selector         = 1'b0;
    logic       clock            = 1'b0;
    logic       reset            = 1'b0;
    logic [7:0] data_out;

    // Clock period constant
    localparam time clock_period = 10ns;

    // Instantiate DUT (Device Under Test)
    LED_manager_sv uut (
        .Channel_1_data   (Channel_1_data),
        .Channel_2_data   (Channel_2_data),
        .Channel_1_enable (Channel_1_enable),
        .Channel_2_enable (Channel_2_enable),
        .selector         (selector),
        .clock            (clock),
        .reset            (reset),
        .data_out         (data_out)
    );


    // Clock generation
    always #(clock_period / 2) clock = ~clock;

    // Stimulus
    initial begin
        // Reset pulse
        reset = 1'b1;
        #(clock_period * 10);
        reset = 1'b0;

        // Enable channels
        Channel_1_enable = 1'b1;
        Channel_2_enable = 1'b1;


        // Drive data changes over time
        repeat (30) begin
            #(clock_period * 2);
            Channel_1_data += 8'h03;

            #(clock_period);
            Channel_2_data += 8'h04;
        end

        // Finish simulation
        #(clock_period * 100);
        $finish;
    end

    initial begin
        // Stimulate selector changes
        selector = 1'b0;
        #(clock_period * 20);
        selector = 1'b1;
        #(clock_period * 30);
        selector = 1'b0;
        #(clock_period * 50);
        selector = 1'b1;
    end

endmodule
