module day14_tb ();
  localparam NUM_PORTS = 8;
  
  logic[NUM_PORTS-1:0] req_i;
  logic[NUM_PORTS-1:0] gnt_o;
  
  day14 #(NUM_PORTS) DUT(.req_i(req_i), .gnt_o(gnt_o));
  
  initial
    begin
      req_i = 8'b00000000;
      #10;
      
      req_i = 8'b00000001;
      #10;
      
      req_i = 8'b10000000;
      #10;
      
      req_i = 8'b10000001;
    	#10;

    	req_i = 8'b11111111;
    	#10;

    	req_i = 8'b01010101;
    	#10;
      $finish;
    end
endmodule
