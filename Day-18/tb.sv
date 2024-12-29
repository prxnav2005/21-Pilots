// Simple APB TB

module day18_tb ();
  reg clk, reset, psel_i, penable_i, pwrite_i;
  reg [3:0] paddr_i;
  reg [31:0] pwdata_i;
  wire [31:0] prdata_o;
  wire pready_o;
  
  day18 DUT(.clk(clk), .reset(reset), .psel_i(psel_i), .penable_i(penable_i), .paddr_i(paddr_i), .pwrite_i(pwrite_i), .pwdata_i(pwdata_i), .prdata_o(prdata_o), .pready_o(pready_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      psel_i = 0;
      penable_i = 0;
      pwrite_i = 0;
      paddr_i = 3'b0;
      pwdata_i = 32'b0;
      
      #10 reset = 0;
      
      #10 psel_i = 1;
      penable_i = 1;
      pwrite_i = 1;
      paddr_i = 10'b0000000001;
      pwdata_i = 32'hDEADBEEF;
      
      #10 pwrite_i = 0;
      paddr_i = 10'b0000000001;
      
      #100 $finish;
    end
endmodule

