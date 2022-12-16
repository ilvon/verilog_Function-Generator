`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 18:10:08
// Design Name: 
// Module Name: posedge_btn
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


module posedge_btn(
    clk,
    btn,
    bto
    );

input clk;
input wire [3:0] btn;
output wire [3:0] bto;

reg [3:0] btdly;

always@(posedge clk) begin
    btdly <= btn; 
end
assign bto = btn & ~btdly;

endmodule
