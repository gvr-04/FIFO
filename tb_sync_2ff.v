`timescale 1ns/1ps
module tb_sync_2ff;

    reg clk = 0;
    reg [3:0] async_in = 0;
    wire [3:0] sync_out;

    sync_2ff #(4) dut (
        .clk(clk),
        .async_in(async_in),
        .sync_out(sync_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sync_2ff.vcd");
        $dumpvars(0, tb_sync_2ff);

        #12 async_in = 4'b1010;
        #20 async_in = 4'b1100;
        #20 async_in = 4'b1111;
        #30 $finish;
    end
endmodule

