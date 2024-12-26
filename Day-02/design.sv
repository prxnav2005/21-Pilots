// Different DFF

module day2 (
  input     logic      clk,
  input     logic      sync_reset,
  input     logic      async_reset,

  input     logic      d_i,

  output    logic      q_norst_o,
  output    logic      q_syncrst_o,
  output    logic      q_asyncrst_o
);

  //No reset
  always_ff@(posedge clk)
    q_norst_o <= d_i;
  
  // Sync reset
  always_ff@(posedge clk)
    if(sync_reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;
  
  //Async reset 
  always_ff @(posedge clk or posedge async_reset)
    if (async_reset)
      q_asyncrst_o <= 1'b0; 
    else
      q_asyncrst_o <= d_i;
    
endmodule
