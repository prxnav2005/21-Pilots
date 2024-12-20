 // An edge detector

module day3 (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    wire    rising_edge_o,
  output    wire    falling_edge_o
);

  logic prev_state;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          prev_state <= 1'b0;
        end
      else
        begin
          prev_state <= a_i;
        end
    end
  
  assign rising_edge_o = (~prev_state) & a_i;
  assign falling_edge_o = prev_state & (~a_i);
endmodule
