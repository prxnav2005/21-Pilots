// Round robin arbiter

module day15 (
  input     wire        clk,
  input     wire        reset,

  input     wire[3:0]   req_i,
  output    logic[3:0]  gnt_o
);
  
  logic [3:0] p;
  
  always_ff@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          p <= 4'b0001;
        end
      else 
        begin
          if(req_i[0])
            p <= 4'b0001;
          else if(req_i[1])
            p <= 4'b0010;
          else if(req_i[2])
            p <= 4'b0100;
          else if(req_i[3])
            p <= 4'b1000;
        end
    end
  
  assign gnt_o = p & req_i;
endmodule
