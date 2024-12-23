// LFSR
module day7 (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);
  logic [3:0] lfsr_reg;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          lfsr_reg <= 4'b0001;
        end
      else
        begin
          lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[1] ^ lfsr_reg[3]};
        end
    end
  assign lfsr_o = lfsr_reg;
endmodule