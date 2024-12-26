module day11_tb ();
  reg clk, reset;
  reg [3:0] parallel_i;
  wire empty_o, serial_o, valid_o;
  
  day11 DUT(.clk(clk), .reset(reset), .parallel_i(parallel_i), .empty_o(empty_o), .serial_o(serial_o), .valid_o(valid_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      parallel_i = 4'b0;
      #10;
      
      reset = 0;
      parallel_i = 4'b1101;
      
      #100;
      
      parallel_i = 4'b1010;
      
      #100;
      
      parallel_i = 4'b1111;
      
      #100;
      $finish;
    end
endmodule
