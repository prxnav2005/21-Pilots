// Parallel to serial with valid and empty

module day11 (
  input     wire      clk,
  input     wire      reset,

  output    wire      empty_o,
  input     wire[3:0] parallel_i,
  
  output    wire      serial_o,
  output    wire      valid_o
);
  logic [3:0] shift_reg;
  logic [2:0] count;
  logic serial_o_reg, valid_o_reg, empty_o_reg;

  
  assign serial_o = serial_o_reg;
  assign valid_o = valid_o_reg;
  assign empty_o = empty_o_reg;
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          shift_reg <= 4'b0;
          count <= 3'd0;
          serial_o_reg <= 1'b0;
          valid_o_reg <= 1'b0;
          empty_o_reg <= 1'b1;
        end
      else
        begin
          if(count == 0)
            begin
              shift_reg <= parallel_i;
              count <= 3'd4;
              empty_o_reg <= 1'b0;
            end
          else
            begin
              serial_o_reg <= shift_reg[0];
              valid_o_reg <= 1'b1;
              shift_reg <= shift_reg >> 1;
              count <= count - 1;
              
              if(count == 1)
                begin
                  empty_o_reg <= 1'b1;
                end
            end
        end
    end
endmodule
