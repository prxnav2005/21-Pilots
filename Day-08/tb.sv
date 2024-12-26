module day8_tb();
  localparam BIN_W = 4;
  localparam ONE_HOT_W = 16;

  logic [BIN_W-1:0] bin_i;
  logic [ONE_HOT_W-1:0] one_hot_o;

  day8 #(BIN_W, ONE_HOT_W) DUT (.bin_i(bin_i), .one_hot_o(one_hot_o));
  
  initial 
    begin
      bin_i = 4'd0;
      #10 bin_i = 4'd1;
      #10 bin_i = 4'd5;
      #10 bin_i = 4'd12;
      #20 $stop;
    end
endmodule
