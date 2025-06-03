module parking_lot (
    input  logic        CLOCK,
    input  logic        RESET,
    input  logic        CI,
    input  logic        CO,
    output logic [9:0]  PS,
    output logic        Enable
);

    // Parameters
    localparam int max_capacity = 1000;

    // Internal signals
    logic CI_in_sync, CO_in_sync;
    logic previous_ci, previous_co;
    logic [9:0] counter;

    // Synchronize inputs
    always_ff @(posedge CLOCK) begin
        CI_in_sync <= CI;
        CO_in_sync <= CO;
    end

    // Counter logic
    always_ff @(posedge CLOCK) begin
        if (RESET) begin
            counter     <= 10'd0;
            previous_ci <= 1'b0;
            previous_co <= 1'b0;
        end else begin
            previous_ci <= CI_in_sync;
            previous_co <= CO_in_sync;

            // Car entering (detect rising edge on CI)
            if (CI_in_sync && !previous_ci && counter < max_capacity)
                counter <= counter + 1;

            // Car exiting (detect rising edge on CO)
            if (CO_in_sync && !previous_co && counter > 0)
                counter <= counter - 1;
        end
    end

    // Outputs
    assign PS     = counter;
    assign Enable = (counter < max_capacity);

endmodule
