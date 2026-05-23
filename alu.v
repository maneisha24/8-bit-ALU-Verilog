// 8-bit ALU using Verilog

module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] select,
    output reg [7:0] result,
    output reg carry
);

always @(*) begin
    carry = 0;

    case(select)

        3'b000: begin
            result = A + B;      // Addition
            carry = (A + B > 8'hFF);
        end

        3'b001: begin
            result = A - B;      // Subtraction
        end

        3'b010: begin
            result = A & B;      // AND
        end

        3'b011: begin
            result = A | B;      // OR
        end

        3'b100: begin
            result = A ^ B;      // XOR
        end

        3'b101: begin
            result = ~A;         // NOT
        end

        3'b110: begin
            result = A << 1;     // Left Shift
        end

        3'b111: begin
            result = A >> 1;     // Right Shift
        end

        default: begin
            result = 8'b00000000;
        end

    endcase
end

endmodule
