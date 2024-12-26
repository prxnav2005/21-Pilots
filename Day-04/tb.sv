// Simple ALU TB

module day4_tb ();
  reg [7:0] a_i, b_i;
  reg [2:0] op_i;
  wire [7:0] alu_o;
  
  day4 DUT(.a_i(a_i), .b_i(b_i), .op_i(op_i), .alu_o(alu_o));
  
  initial 
    begin
      a_i = 8'd11; b_i = 8'd6; op_i = 3'b000;
      #10;
        
      a_i = 8'd15; b_i = 8'd3; op_i = 3'b001;
      #10;

      a_i = 8'b00001111; b_i = 8'b00000010; op_i = 3'b010;
      #10;

      a_i = 8'b00001111; b_i = 8'b00000010; op_i = 3'b011;
      #10;

      a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b100;
      #10;

      a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b101;
      #10;

      a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b110;
      #10;

      a_i = 8'd5; b_i = 8'd5; op_i = 3'b111;
      #10;

      a_i = 8'd5; b_i = 8'd10; op_i = 3'b111;
      #10;
    end
endmodule
