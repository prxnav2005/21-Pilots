// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);
  
  logic [3:0] sr_internal;
  
  assign sr_o = sr_internal; 
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(reset)
        sr_internal <= 4'b0;
      else
        sr_internal <= {sr_internal[2:0], x_i};
    end
endmodule
