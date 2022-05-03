//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 9

`timescale 1ns/100ps
`define MONITOR_STR_1 " MONITOR: %d: CLK=%d, WR_EN=%d, RD_EN=%d, RST_EN=%d, DATA_IN=%d | DATA_OUT=%d, EMPTY=%d, ALMOST_EMPTY=%d, VALID=%d, FULL=%d, ALMOST_FULL=%d, OVERFLOW=%d, UNDERFLOW=%d"

module test_bench();

parameter WIDTH = 8;
parameter DEPTH = 32;
parameter ADDR_WIDTH = 8;

reg[WIDTH-1:0] data_in;
wire[WIDTH-1:0] data_out;
reg clk, wr_en, rd_en, rst_n;
wire empty, almost_empty, full, almost_full, valid, overflow, underflow;
wire[ADDR_WIDTH:0] count;
integer i;

FIFO uut(data_in, data_out, clk, wr_en, rd_en, rst_n, empty, almost_empty, full, almost_full, valid, overflow, underflow, count);

initial begin 
clk=1'b0;
forever #25 clk=~clk;
end

initial
begin
$vcdpluson;
$monitor(`MONITOR_STR_1, $time, clk, wr_en, rd_en, rst_n,data_in, data_out, empty, almost_empty, valid, full, almost_full, overflow, underflow);
end

initial 
begin

//initialize
#50 rd_en = 0; wr_en=0; rst_n=1;

#150
rst_n = 0; wr_en = 1; rd_en = 0;

for(i=0; i<32; i=i+1) begin
#50 data_in = 1+i;
end

#20
wr_en = 0; rd_en = 1; rst_n = 0;

#500
$finish;

end

endmodule
