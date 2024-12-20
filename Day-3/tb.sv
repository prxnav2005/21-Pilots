// Simple edge detector TB

module day3_tb ();
  reg clk, reset, a_i;
  wire rising_edge_o, falling_edge_o;
  
  day3 DUT(.clk(clk), .reset(reset), .a_i(a_i), .rising_edge_o(rising_edge_o), .falling_edge_o(falling_edge_o));
  
  initial 
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      a_i = 1;
      #20 reset = 0;
      
      #10 a_i = 1;
      #10 a_i = 0;
      
      #10 a_i = 0;
      #10 a_i = 1;
      #20 $finish;
    end
endmodule
