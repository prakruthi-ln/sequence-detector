`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2026 17:21:06
// Design Name: 
// Module Name: seq_dec
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


module seq_dec(input in,clk, rst, output reg out );
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
reg [2:0]s;
always @(posedge clk or posedge rst)
begin
if(rst)
 s<=s0;
else
    case(s)
    s0:
    if(in)
     s<=s1;
    else
     s<=s0;
    s1:
    if(in)
     s<=s1;
    else
     s<=s2;
    s2:
    if(in)
     s<=s3;
    else
     s<=s0;
    s3:
    if(in)
     s<=s4;
    else
     s<=s2;
    s4:
    if(in)
     s<=s1;
    else
     s<=s2;
     default:s<=s0;
     endcase
 end
 always@(*)begin
 if (s==s4)
 out=1'b1;
 else out=1'b0;
 end
    


endmodule
