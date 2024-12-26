module day7_tb ();
  reg clk,reset;
  wire [3:0] lfsr_o;
  
  day7 DUT(.clk(clk), .reset(reset), .lfsr_o(lfsr_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      #10 reset = 0;
      
      #200 $stop;
    end
endmodule
