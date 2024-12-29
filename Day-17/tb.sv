// Memry TB

module day17_tb ();
  reg clk, reset, req_i, req_rnw_i;
  reg [3:0] req_addr_i;
  reg [31:0] req_wdata_i;
  wire req_ready_o;
  wire [31:0] req_rdata_o;
  
  day17 DUT(.clk(clk), .reset(reset), .req_i(req_i), .req_rnw_i(req_rnw_i), .req_addr_i(req_addr_i), .req_wdata_i(req_wdata_i), .req_ready_o(req_ready_o), .req_rdata_o(req_rdata_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 0;
      req_i = 0;
      req_rnw_i = 0;
      req_addr_i = 4'b0000;
      req_wdata_i = 32'hDEADBEEF;
      
      #10 reset = 1;
      #10 reset = 0;
      
      #10 req_i = 1; req_rnw_i = 0; req_addr_i = 4'b0001; req_wdata_i = 32'h12345678;
      #10 req_i = 0;
      
      #30;
      
      #10 req_i = 1; req_rnw_i = 1; req_addr_i = 4'b0001;
      #10 req_i = 0;
      
      #30;
      
      $finish;
    end
endmodule
