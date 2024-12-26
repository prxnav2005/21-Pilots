// DFF TB

module day2_tb ();
  
  logic clk,sync_reset,async_reset,d_i, q_norst_o, q_syncrst_o, q_asyncrst_o;
  
  day2 DUT(.clk(clk), .sync_reset(sync_reset), .async_reset(async_reset), .d_i(d_i), .q_norst_o(q_norst_o), .q_syncrst_o(q_syncrst_o), .q_asyncrst_o(q_asyncrst_o));
           
  always #5 clk = ~clk;
           
  initial begin 
  clk = 0; sync_reset = 1; d_i = 0;
  #10 async_reset = 0; d_i = 1;
  #10 d_i = 0; 
  #10 async_reset = 1;
  #20 $stop;
  end
endmodule