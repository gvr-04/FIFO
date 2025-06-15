module dual_port_ram #(parameter ADDR_WIDTH = 4, DATA_WIDTH = 8)(
    input                      wr_clk,
    input                      rd_clk,
    input                      we,
    input  [ADDR_WIDTH-1:0]    wr_addr,
    input  [ADDR_WIDTH-1:0]    rd_addr,
    input  [DATA_WIDTH-1:0]    din,
    output [DATA_WIDTH-1:0]    dout
);

    reg [DATA_WIDTH-1:0] mem [(1<<ADDR_WIDTH)-1:0];

    always @(posedge wr_clk) begin
        if (we)
            mem[wr_addr] <= din;
    end

    assign dout = mem[rd_addr];
endmodule

