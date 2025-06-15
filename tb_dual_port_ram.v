`timescale 1ns/1ps
module tb_dual_port_ram;

    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 8;

    reg wr_clk = 0, rd_clk = 0, we = 0;
    reg [ADDR_WIDTH-1:0] wr_addr = 0, rd_addr = 0;
    reg [DATA_WIDTH-1:0] din = 0;
    wire [DATA_WIDTH-1:0] dout;

    dual_port_ram #(ADDR_WIDTH, DATA_WIDTH) dut (
        .wr_clk(wr_clk), .rd_clk(rd_clk),
        .we(we), .wr_addr(wr_addr), .rd_addr(rd_addr),
        .din(din), .dout(dout)
    );

    // Clock generation
    always #5 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    initial begin
        $dumpfile("dual_port_ram.vcd");
        $dumpvars(0, tb_dual_port_ram);

        #10;
        // Write values
        we = 1;
        din = 8'hAA; wr_addr = 4'h1; #10;
        din = 8'hBB; wr_addr = 4'h2; #10;
        we = 0;

        // Read values
        #20;
        rd_addr = 4'h1; #14;
        rd_addr = 4'h2; #14;

        #50 $finish;
    end
endmodule

