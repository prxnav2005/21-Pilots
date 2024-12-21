module day6_tb ();
  reg clk, reset, x_i;
  wire [3:0] sr_o;
  
  day6 DUT(.clk(clk), .reset(reset), .x_i(x_i), .sr_o(sr_o));
  
  initial
    begin
      clk = 0;
      forever #10 clk = ~clk;
    end
  
  initial 
    begin
      reset = 1;
      x_i = 0;
      
      #10;
      x_i = 1;
      reset = 0;
      
      x_i = 0; #10;
      x_i = 1; #10;
      x_i = 1; #10;
      reset = 1;
      
      #20;
      $stop;
    end
endmodule
