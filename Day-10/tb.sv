module day10_tb ();
  reg clk, reset, load_i;
  reg [3:0] load_val_i;
  wire count_o;
  
  day10 DUT(.clk(clk), .reset(reset), .load_i(load_i), .load_val_i(load_val_i), .count_o(count_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1; load_i = 0; load_val_i = 4'b0;
      #10 reset = 0;
      #10 load_i = 1; load_val_i = 4'b1010;
      #10 load_i = 0;
      #100 $stop;
    end
endmodule
