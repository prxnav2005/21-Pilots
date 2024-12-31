// TB

module day21_tb ();
  parameter WIDTH = 12;
  
  reg[WIDTH-1:0] vec_i;
  wire[WIDTH-1:0] second_bit_o;
  
  day21 #(.WIDTH(WIDTH)) DUT(.vec_i(vec_i), .second_bit_o(second_bit_o));
  
  initial
    begin
      vec_i = 12'b000000000001;
      #10;
      vec_i = 12'b000000001010;
      #10;
      vec_i = 12'b000100000000;
      #10;
      vec_i = 12'b000000000000;
      #10;
      
      #100 $finish;
    end
endmodule

