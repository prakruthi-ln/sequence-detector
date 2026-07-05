
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2026 18:41:28
// Design Name: 
// Module Name: seq_dec_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_dec_tb;
reg clk, rst, in;
wire out;
seq_dec uut (.in(in), .clk(clk), .rst(rst), .out(out));
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    in = 0;
    #10 rst = 0;
   
 $display("normal sequence");
    in = 1; #10;
    in = 0; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;
 $display("--overlapping sequence--");
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;
 $display("--all zeroes--");
    in = 0; #10;
    in = 0; #10;
    in = 0; #10;
    in = 0; #10;
    in = 0; #10;
    in = 0; #10;
    in = 0; #10;
 $display("--all ones--");
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    
 $display("--reset in middle--");
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    rst=1; #10;
    rst=0;  #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;
    
#50;
$display(" all the cases are done");
$finish;
end
endmodule
