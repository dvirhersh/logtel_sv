module MUX (
    input wire IN1,
    input wire IN2,
    input wire IN3,
    input wire IN4,
    input wire IN5,
    input wire IN6,
    input wire IN7,
    input wire IN8,
    input wire [2:0] Selector,
    output reg RES
);

always @(*) begin
    case (Selector)
        3'b000: RES = IN1;
        3'b001: RES = IN2;
        3'b010: RES = IN3;
        3'b011: RES = IN4;
        3'b100: RES = IN5;
        3'b101: RES = IN6;
        3'b110: RES = IN7;
        3'b111: RES = IN8;
        default: RES = IN1;
    endcase
end

endmodule
