// APB Master

// TB should drive a cmd_i input decoded as:
//  - 2'b00 - No-op
//  - 2'b01 - Read from address 0xDEAD_CAFE
//  - 2'b10 - Increment the previously read data and store it to 0xDEAD_CAFE

module day16 (
  input       wire        clk,
  input       wire        reset,

  input       wire[1:0]   cmd_i,

  output      wire        psel_o,
  output      wire        penable_o,
  output      wire[31:0]  paddr_o,
  output      wire        pwrite_o,
  output      wire[31:0]  pwdata_o,
  input       wire        pready_i,
  input       wire[31:0]  prdata_i
);
  localparam adr = 32'hDEAD_CAFE;
  reg psel_o_r, penable_o_r, pwrite_o_r;
  reg [31:0] paddr_o_r, pwdata_o_r, p_d;
  reg[1:0] cmd_d;
  
  assign psel_o = psel_o_r;
  assign penable_o = penable_o_r;
  assign paddr_o = paddr_o_r;
  assign pwrite_o = pwrite_o_r;
  assign pwdata_o = pwdata_o_r;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          psel_o_r <= 0;
          penable_o_r <= 0;
          paddr_o_r <= 0;
          pwrite_o_r <= 0;
          pwdata_o_r <= 0;
          p_d <= 0;
          cmd_d <= 0;
        end
      else
        begin
          cmd_d <= cmd_i;
          psel_o_r <= 0;
          penable_o_r <= 0;
          paddr_o_r <= 0;
          pwrite_o_r <= 0;
          pwdata_o_r <= 0;
          
          case(cmd_d)
            2'b00 : begin
            end
            
            2'b01 : begin
              psel_o_r <= 1;
              paddr_o_r <= adr;
              penable_o_r <= 1;
              pwrite_o_r <= 0;
            end
            
            2'b10 : begin
              psel_o_r <= 1;
              paddr_o_r <= adr;
              penable_o_r <= 1;
              pwrite_o_r <= 1;
              pwdata_o_r <= p_d + 1;
            end
            
            2'b11 : begin
            end
          endcase
          
          if(pready_i && !pwrite_o_r && cmd_d == 2'b01)
            begin
              p_d <= prdata_i;
            end
        end
    end
endmodule

