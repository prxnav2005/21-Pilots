// Find second bit set from LSB for a N-bit vector

module day21 #(
  parameter WIDTH = 12
)(
  input       wire [WIDTH-1:0]  vec_i,
  output       wire [WIDTH-1:0]  second_bit_o

);
  wire [WIDTH-1:0] first_bit;
  wire [WIDTH-1:0] empty_vector;
  
  assign first_bit = vec_i & -vec_i;
  assign empty_vector = vec_i & (~first_bit);
  
  assign second_bit_o = empty_vector & -empty_vector;
endmodule
