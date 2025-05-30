module MUX_sv (
    input  logic       IN1,
    input  logic       IN2,
    input  logic       IN3,
    input  logic       IN4,
    input  logic       IN5,
    input  logic       IN6,
    input  logic       IN7,
    input  logic       IN8,
    input  logic [2:0] Selector,
    output logic       RES
);

always_comb begin
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
