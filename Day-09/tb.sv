module day9_tb ();
  parameter VEC_W = 4;
  
  reg [VEC_W-1:0] bin_i;
  wire [VEC_W-1:0] gray_o;
  
  day9 #(.VEC_W(VEC_W)) DUT(.bin_i(bin_i), .gray_o(gray_o));
  
  initial
    begin
      bin_i = 4'b0000; #1;
      assert(gray_o == (bin_i ^ (bin_i >> 1))) else $fatal("Error");
      
      bin_i = 4'b0001; #1;
      assert(gray_o == (bin_i ^ (bin_i >> 1))) else $fatal("Error");
      
      bin_i = 4'b1111; #1;
      assert(gray_o == (bin_i ^ (bin_i >> 1))) else $fatal("Error");
      
      $finish;
    end
endmodule

