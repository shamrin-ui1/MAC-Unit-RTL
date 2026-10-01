module MAC (
    input [7:0] A,
    input [7:0] B,
    input clk,
    input reset,
    input enable,
    output [31:0] result
);

    logic [15:0] product;
    logic [31:0] accumulator;

    assign product = A * B;
    assign result = accumulator;

    always @(posedge clk) begin
        if (reset)
            accumulator <= 32'b0;
        else if (enable)
            accumulator <= accumulator + {16'b0, product};
    end

endmodule