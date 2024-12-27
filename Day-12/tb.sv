module day12_tb ();
  reg clk, reset, x_i;
  wire det_o;
  
  day12 DUT(.clk(clk), .reset(reset), .x_i(x_i), .det_o(det_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      x_i = 0;
      #10 reset = 0;
      #10 x_i = 1; #10 x_i = 1; #10 x_i = 1; #10 x_i = 0;
      #10 x_i = 1; #10 x_i = 1; #10 x_i = 0; #10 x_i = 1;
      #10 x_i = 1; #10 x_i = 0; #10 x_i = 1; #10 x_i = 1;

      #100 $stop;
    end
endmodule
