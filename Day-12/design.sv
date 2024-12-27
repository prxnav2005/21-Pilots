// Detecting a big sequence - 1110_1101_1011
module day12 (
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,

  output    wire        det_o
);
  typedef enum logic[4:0] {s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10} state;
  
  state current_state, next_state;
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(reset)
        current_state <= s0;
      else
        current_state <= next_state;
    end
  
  always_comb
    begin
      next_state = current_state;
      case(current_state)
        s0 : next_state = x_i ? s1 : s0;
        s1 : next_state = x_i ? s2 : s0;
        s2 : next_state = x_i ? s3 : s0;
        s3 : next_state = x_i ? s4 : s0;
        s4 : next_state = x_i ? s5 : s0;
        s5 : next_state = x_i ? s6 : s0;
        s6 : next_state = x_i ? s7 : s0;
        s7 : next_state = x_i ? s8 : s0;
        s8 : next_state = x_i ? s9 : s0;
        s9 : next_state = x_i ? s10 : s0;
        s10 : next_state = x_i ? s3 : s4;
        default : next_state = s0;
      endcase
    end
  assign det_o = (current_state == s10);
endmodule