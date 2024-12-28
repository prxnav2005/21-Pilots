// Simple TB

module day13_tb ();
  reg[3:0] a_i, sel_i;
  wire y_ter_o, y_case_o, y_ifelse_o, y_loop_o, y_aor_o;
  
  day13 DUT(.a_i(a_i), .sel_i(sel_i), .y_ter_o(y_ter_o), .y_case_o(y_case_o), .y_ifelse_o(y_ifelse_o), .y_loop_o(y_loop_o), .y_aor_o(y_aor_o));
  
  initial
    begin
      a_i = 4'b1010; sel_i = 4'b0001; #20;
      a_i = 4'b1010; sel_i = 4'b0010; #20;
      a_i = 4'b1010; sel_i = 4'b0100; #20;
      a_i = 4'b1010; sel_i = 4'b1000; #20;
      a_i = 4'b1010; sel_i = 4'b0000; #20;
      $stop;
    end
endmodule
