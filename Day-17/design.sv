// A memory interface

module day17 (
  input       wire        clk,
  input       wire        reset,

  input       wire        req_i,
  input       wire        req_rnw_i,    // 1 - read, 0 - write
  input       wire[3:0]   req_addr_i,
  input       wire[31:0]  req_wdata_i,
  output      wire        req_ready_o,
  output      wire[31:0]  req_rdata_o
);
  logic [15:0][31:0] mem;
  
  logic req_valid, req_ready;
  logic [3:0] delay,random;
  
  assign req_ready_o = req_ready;
  assign req_rdata_o = (req_rnw_i) ? mem[req_addr_i] : 32'bz;
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(!reset)
        begin
          req_valid <= 0;
          req_ready <= 0;
          delay <= 0;
          random <= 4'b1010;
        end
      else
        begin
          if(req_i && !req_valid) 
            begin
              req_valid <= 1;
              delay <= random;
              req_ready <= 0;
            end
          if(req_valid)
            begin
              if(delay == 0)
                begin
                  req_ready <= 1;
                  if(!req_rnw_i)
                    begin
                      mem[req_addr_i] <= req_wdata_i;
                    end
                  req_valid <= 0;
                end
              else
                begin
                  delay <= delay - 1;
                end
            end
        end
    end
endmodule
