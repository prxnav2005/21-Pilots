module day20 (
    input  wire        clk,
    input  wire        reset,

    input  wire        read_i,
    input  wire        write_i,

    output wire        rd_valid_o,
    output wire [31:0] rd_data_o
);
	wire arb_write_en;
    wire arb_read_en;

    wire fifo_full;
    wire [31:0] fifo_rd_data;

    wire apbm_ready;
    wire [31:0] apbm_rd_data;

    // Instantiate Arbiter
    arbiter u_arb (.clk(clk), .reset(reset), .read_i(read_i), .write_i(write_i), .fifo_full(fifo_full), .arb_write_en(arb_write_en), .arb_read_en(arb_read_en));

    // Instantiate FIFO
    fifo #(.DEPTH(16), .WIDTH(32)) u_fifo (.clk(clk), .reset(reset), .write_en(arb_write_en), .read_en(arb_read_en), .write_data(32'b0), .read_data(fifo_rd_data), .full(fifo_full));

    // Instantiate APB Master
    apb_master u_apbm (.data_in(fifo_rd_data), .ready(apbm_ready), .rd_data(apbm_rd_data));

    // Instantiate APB Slave
    apb_slave u_apbs (.apbm_ready(apbm_ready), .apbm_rd_data(apbm_rd_data), .rd_valid_o(rd_valid_o), .rd_data_o(rd_data_o));

endmodule

// Arbiter module
module arbiter (
    input  wire clk,
    input  wire reset,
    input  wire read_i,
    input  wire write_i,
    input  wire fifo_full,
    output reg  arb_write_en,
    output reg  arb_read_en
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            arb_write_en <= 1'b0;
            arb_read_en <= 1'b0;
        end else begin
            if (write_i && !fifo_full) begin
                arb_write_en <= 1'b1;
                arb_read_en <= 1'b0;
            end else if (read_i && !fifo_full) begin
                arb_write_en <= 1'b0;
                arb_read_en <= 1'b1;
            end else begin
                arb_write_en <= 1'b0;
                arb_read_en <= 1'b0;
            end
        end
    end
endmodule

// FIFO module
module fifo #(parameter DEPTH = 16, WIDTH = 32) (
    input  wire              clk,
    input  wire              reset,
    input  wire              write_en,
    input  wire              read_en,
    input  wire [WIDTH-1:0]  write_data,
    output reg  [WIDTH-1:0]  read_data,
    output wire              full
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [3:0]       w_ptr;
    reg [3:0]       r_ptr;
    reg [4:0]       count;

    assign full = (count == DEPTH);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            w_ptr <= 0;
            r_ptr <= 0;
            count <= 0;
        end else begin
            if (write_en && !full) begin
                mem[w_ptr] <= write_data;
                w_ptr <= w_ptr + 1;
                count <= count + 1;
            end

            if (read_en && count > 0) begin
                read_data <= mem[r_ptr];
                r_ptr <= r_ptr + 1;
                count <= count - 1;
            end
        end
    end
endmodule

// APB Master module
module apb_master (
    input  wire [31:0] data_in,
    output wire        ready,
    output wire [31:0] rd_data
);
    // Dummy implementation
    assign ready = 1'b1;
    assign rd_data = data_in;
endmodule

// APB Slave module
module apb_slave (
    input  wire        apbm_ready,
    input  wire [31:0] apbm_rd_data,
    output wire        rd_valid_o,
    output wire [31:0] rd_data_o
);
    assign rd_valid_o = apbm_ready;
    assign rd_data_o = apbm_rd_data;
endmodule
