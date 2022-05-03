//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 9

`timescale 1ns/100ps

module FIFO(data_in, data_out, clk, wr_en, rd_en, rst_n, empty, almost_empty, full, almost_full, valid, overflow, underflow, count);


parameter WIDTH = 8;
parameter DEPTH = 32;
parameter ADDR_WIDTH = 8;

input[WIDTH-1:0] data_in;
output reg[WIDTH-1:0] data_out;
input clk, wr_en, rd_en, rst_n;

output empty, almost_empty, full, almost_full, valid, overflow, underflow;

output reg[ADDR_WIDTH-1:0] count;

reg [ADDR_WIDTH-1:0] addr_1, addr_2;

reg [WIDTH-1:0] mem;

//flags
assign empty = (count==0)? 1'b1:1'b0; 
assign full = (count==(DEPTH-1))? 1'b1:1'b0; 
assign almost_empty = (count < 2) ? 1'b1:1'b0;
assign almost_full = (count > 2) ? 1'b1 : 1'b0; 
assign overflow = (count > (DEPTH-1)) ? 1'b1:1'b0;
assign underflow = (count < (DEPTH-1)) ? 1'b1 : 1'b0;
assign valid = (count < (DEPTH-1)) ? 1'b1 : 1'b0;

always @(posedge clk) 

begin: WRITE 

if(rst_n == 1) begin 
addr_1 <= 0;
end

else if(wr_en == 1) begin
addr_1 <= addr_1 + 1;
end

end

always @(posedge clk) 

begin: READ 

if(rst_n == 1) begin 
addr_2 <= 0;
end

else if(rd_en == 1) begin
addr_2 <= addr_2 + 1;
end

end

always @(posedge clk) 

begin: READ_BEGIN 

if(rst_n == 1) begin 
data_out <= 0;
end

else if(rd_en == 1) begin
data_out <= mem;
end

end

always @(posedge clk) 

begin: WRITE_BEGIN

if(rst_n == 1) begin 
data_out <= 0;
end

else if(wr_en == 1) begin
mem <= data_in;
end

end

always @(posedge clk) 

begin: COUNTER

if(rst_n == 1) begin 
count <= 0;
end

else if(rd_en == 1 && wr_en == 0) begin
count <= count + 1;
end

else if(wr_en == 1 && rd_en == 0) begin
count <= count - 1;
end

end



endmodule
