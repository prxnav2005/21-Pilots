module day19 #(
  parameter DEPTH   = 4,
  parameter DATA_W  = 1
)(
  input  wire               clk,
  input  wire               reset,
  input  wire               push_i,
  input  wire [DATA_W-1:0]  push_data_i,
  input  wire               pop_i,
  output reg  [DATA_W-1:0]  pop_data_o,
  output wire               full_o,
  output wire               empty_o
);
  reg [DATA_W-1:0] mem [0:DEPTH-1];
  reg [1:0] w_ptr; 
  reg [1:0] r_ptr; 
  reg [2:0] count; 

  assign full_o = (count == DEPTH);
  assign empty_o = (count == 0);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      w_ptr <= 0;
      r_ptr <= 0;
      count <= 0;
      pop_data_o <= 0;
    end else begin
      if (push_i && !full_o) begin
        mem[w_ptr] <= push_data_i;
        w_ptr <= w_ptr + 1;
        count <= count + 1;
      end

      if (pop_i && !empty_o) begin
        pop_data_o <= mem[r_ptr];
        r_ptr <= r_ptr + 1;
        count <= count - 1;
      end
    end
  end
endmodule
