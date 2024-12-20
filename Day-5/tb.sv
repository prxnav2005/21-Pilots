// Simple TB

module day5_tb ();
  reg clk, reset;
  wire [7:0] cnt_o;
  
  day5 DUT(.clk(clk), .reset(reset), .cnt_o(cnt_o));
  
  initial 
    begin
      clk = 0;
      forever #10 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      #15 reset = 0;
      
      #200;
      
      $finish;
    end
endmodule
