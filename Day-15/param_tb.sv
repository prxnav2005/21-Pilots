// TB for round robin

module day15_tb ();
  localparam REQS = 4;
  reg clk, reset;
  reg [REQS-1:0] req_i;
  wire [REQS-1:0] gnt_o;
  
  day15 #(.REQS(REQS)) DUT(.clk(clk), .reset(reset), .req_i(req_i), .gnt_o(gnt_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 0;
      req_i = 4'b0;
      
      reset = 1;
      #10;
      reset = 0;
      #10;
      
      req_i = 4'b0001;
      #10;
      
      req_i = 4'b0010; 
      #10;
      
      req_i = 4'b0100;
      #10;
      
      req_i = 4'b1100;
      #10;
      
      req_i = 4'b1111;
      #10;
      
      $finish;
    end
endmodule
