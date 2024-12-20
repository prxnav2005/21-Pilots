// This design contains an updated code where a clock divider is being used to notice the outputs clearly. 

module day5 (
  input     logic       clk,
  input     logic       reset,
  output    logic [7:0] cnt_o
);

  logic [25:0] clk_div = 26'b0;

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      clk_div <= 0;
    else
      clk_div <= clk_div + 1;
  end

  always_ff @(posedge clk_div[25] or posedge reset) begin
    if (reset)
      cnt_o <= 8'h1;
    else
      cnt_o <= cnt_o + 2;
  end

endmodule