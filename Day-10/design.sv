// Counter with a load
module day10 (
  input     wire          clk,
  input     wire          reset,
  input     wire          load_i,
  input     wire[3:0]     load_val_i,

  output    wire[3:0]     count_o
);
  logic [3:0] count;
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(reset)
        count <= 4'b0;
      else if(load_i)
        count <= load_val_i;
      else
        count <= count + 4'b1;
    end
  
  assign count_o = count;
endmodule