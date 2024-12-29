// APB Master TB

module day16_tb ();
  reg clk, reset;
  reg[1:0] cmd_i;
  wire psel_o,penable_o, pwrite_o;
  wire[31:0] paddr_o, pwdata_o;
  wire[31:0] prdata_i = 32'h13451232;
  
  wire pready_i = 1;
  
  day16 DUT(.clk(clk), .reset(reset), .cmd_i(cmd_i), .psel_o(psel_o), .penable_o(penable_o), .paddr_o(paddr_o), .pwrite_o(pwrite_o), .pwdata_o(pwdata_o), .pready_i(pready_i), .prdata_i(prdata_i));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      cmd_i = 2'b00;
      
      #10 reset = 0;
      #10 cmd_i = 2'b01;
      #10 cmd_i = 2'b00;
      
      #10 cmd_i = 2'b10;
      #10 cmd_i = 2'b00;
      
      #10 cmd_i = 2'b11;
      #10 cmd_i = 2'b00;
      
      #50 $finish;
    end
endmodule
