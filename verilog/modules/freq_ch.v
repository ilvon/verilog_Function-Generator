`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 19:40:44
// Design Name: 
// Module Name: freq_ch
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


module freq_ch(
    input clk,
    input wire [3:0] bto,
    output reg [2:0] freq_dy
    );

reg [2:0] freq_cnt;
initial begin 
    freq_dy = 0;
    freq_cnt = 0;
end

always@(posedge clk) begin
    if(bto[1] == 1) begin
        if(freq_cnt == 4) begin
            freq_cnt = 0;          
        end
        else begin
            freq_cnt = freq_cnt + 1;
        end
    end
end


always@(posedge clk) begin
    if(freq_dy == freq_cnt) begin
        freq_dy = 0;
    end
    else begin
        freq_dy = freq_dy + 1;
    end
end
    
endmodule
