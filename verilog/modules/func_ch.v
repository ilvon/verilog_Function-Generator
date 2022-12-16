`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 20:20:35
// Design Name: 
// Module Name: func_ch
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


module func_ch(
    input clk,
    input wire [3:0] bto,
    output reg [2:0] func_cnt
    );
    
initial begin
    func_cnt = 0;
end

always@(posedge clk) begin
    if(bto[3] == 1) begin
        if(func_cnt == 4) begin
            func_cnt = 0;
        end
        else begin
            func_cnt = func_cnt + 1;
        end
    end
end

endmodule
