module MAC_tb;

    logic [7:0] A;
    logic [7:0] B;
    logic clk;
    logic reset;
    logic enable;

    logic [31:0] result;

    MAC dut (
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .result(result)
    );

    always #5 clk = ~clk;

    initial begin
    $display("============================================");
    $display("   MAC UNIT      VERIFICATION ");
    $display("============================================");


        $dumpfile("simulation.vcd");
        $dumpvars(0, MAC_tb);

        clk = 0;
        reset = 1;
        enable = 0;
        A = 0;
        B = 0;

       #10;

        reset = 0;
        enable = 1;

        A = 8'd4;
        B = 8'd3;

        #10;
         
$display("RESULT = %d", result);
    if (result == 32'd12)
            $display("TEST 1 - BASIC MULTIPLICATION: PASS");
    else 
            $display("TEST 1 - BASIC MULTIPLICATION: FAIL");

        A = 8'd2;
        B = 8'd5;

        #10;
                 
$display("RESULT = %d", result);
    if (result == 32'd22)
            $display("TEST 2 - ACCUMULATION: PASS");
    else 
            $display("TEST 2 - ACCUMULATION: FAIL");


        enable = 0;
        A = 8'd2;
        B = 8'd5;

        @(posedge clk);
        #1;
        $display("RESULT AFTER ENABLE 0 = %d", result);
    if (result == 32'd22)
            $display("TEST 3 : PASS");
    else 
            $display("TEST 3 : FAIL");


     reset = 1;

    #10;
    $display("RESULT AFTER RESET = %d" , result);
     reset = 0;
     enable = 1;

        A = 8'd255;
        B = 8'd255;

        #10;
         
$display("RESULT = %d", result);
    if (result == 32'd65025)
            $display("TEST 4- MAXIMUM OUTPUT: PASS");
    else 
            $display("TEST 4 - MAXIMUM OUTPUT: FAIL");
    reset = 1;
    #10;
    reset = 0;
    enable=1;
     A = 8'd0;
     B = 8'd255;
     #10;
     $display("RESULT = %d", result);
    if (result == 32'd0)
            $display("TEST 5- ZER0 INPUT : PASS");
    else 
            $display("TEST 5- ZERO INPUT : FAIL");


$display("============================================");
    $display("   ALL TEST PASSED");
    $display("============================================");


        $finish;

    end

endmodule