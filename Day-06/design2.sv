// This design utilizes a clock divider to view outputs clearly on a FPGA

module day6 (
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,
  output    wire [3:0]  sr_o
);

  logic [3:0] sr_internal;
  logic [24:0] clk_div_counter;

  assign sr_o = sr_internal;

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      clk_div_counter <= 0;
    else
      clk_div_counter <= clk_div_counter + 1;
  end

  always_ff @(posedge clk_div_counter[24] or posedge reset) begin
    if (reset)
      sr_internal <= 4'b0;
    else
      sr_internal <= {sr_internal[2:0], x_i};
  end
endmodule