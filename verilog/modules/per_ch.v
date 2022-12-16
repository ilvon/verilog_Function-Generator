`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/11 01:28:49
// Design Name: 
// Module Name: per_ch
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


module per_ch(
    input clk,
    input wire [3:0] bto,
    input wire [3:0] btn,
    output wire [2:0] peri_posedge,
    output reg [2:0] peri_cnt
    );

reg [2:0] peri_dly;
    
initial begin 
    peri_cnt = 0;
end

always@(posedge clk) begin
    if(bto[0] == 1) begin
        if(peri_cnt == 3) begin
            peri_cnt = 0;
        end
        else begin
            peri_cnt = peri_cnt + 1;
        end 
    end   
end 

always@(posedge clk) begin
    peri_dly <= btn[0];
end
assign peri_posedge = btn[0] & ~peri_dly;

endmodule
