module sync_2ff #(parameter WIDTH = 4) (
    input                  clk,
    input  [WIDTH-1:0]     async_in,
    output [WIDTH-1:0]     sync_out
);
    reg [WIDTH-1:0] sync_ff1, sync_ff2;

    always @(posedge clk) begin
        sync_ff1 <= async_in;
        sync_ff2 <= sync_ff1;
    end

    assign sync_out = sync_ff2;
endmodule

