// TB

module day20_tb ();
  reg clk, reset, read_i, write_i;
  wire rd_valid_o;
  wire [31:0] rd_data_o;
  
  day20 DUT(.clk(clk), .reset(reset), .read_i(read_i), .write_i(write_i), .rd_valid_o(rd_valid_o), .rd_data_o(rd_data_o));
  
  initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      reset = 1;
      read_i = 0;
      write_i = 0;
      
      #10 reset = 0;
      write_i = 1;
      #10 write_i = 1;
      
      read_i = 1;
      #10 read_i = 0;
      
      write_i = 1;
      #10 write_i = 0;
      
      read_i = 1;
      #10 read_i = 0;
      
      #100 $finish;
    end
endmodule

