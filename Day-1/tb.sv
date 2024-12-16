// A simple TB for mux

module day1_tb ();
  
  logic [7:0] a_i, b_i, y_o;
  logic sel_i;
  
  day1 DUT(.a_i(a_i), .b_i(b_i), .sel_i(sel_i), .y_o(y_o));

  
  initial begin
    #20;
    a_i = 8'hAA; b_i = 8'h55; sel_i = 0;
    #20 sel_i = 1;
    #20 a_i = 8'hFF; b_i = 8'h00; sel_i = 0;
    #20 sel_i = 1;
    #20 $stop;
  end
endmodule
