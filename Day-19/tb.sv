// Fifo TB
module day19_tb;

  parameter DATA_W = 1;
  parameter DEPTH  = 4;

  logic              clk;
  logic              reset;

  logic              push_i;
  logic[DATA_W-1:0]  push_data_i;

  logic              pop_i;
  logic[DATA_W-1:0]  pop_data_o;

  logic              full_o;
  logic              empty_o;

  day19 #(.DEPTH(DEPTH), .DATA_W(DATA_W)) DUT(.clk(clk), .reset(reset), .push_i(push_i), .push_data_i(push_data_i), .pop_i(pop_i), .pop_data_o(pop_data_o), .full_o(full_o), .empty_o(empty_o));

  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial begin
    reset = 1;
    push_i = 0;
    pop_i = 0;
    push_data_i = 0;
    #5 reset = 0;
    #5 push_i = 1; push_data_i = 1;
    #10 push_i = 0;
    #10 pop_i = 1;
    #10 pop_i = 0;
    #10 $finish;
  end
endmodule
