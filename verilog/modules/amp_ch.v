`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 17:48:53
// Design Name: 
// Module Name: amp_ch
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


module amp_ch(
    input clk,
    input wire [3:0] bto,
    output reg [2:0] amp_cnt
    );
    
initial begin 
    amp_cnt = 0;
end

always@(posedge clk) begin
    if(bto[2] == 1) begin
        if(amp_cnt == 4) begin
            amp_cnt = 0;
        end
        else begin
            amp_cnt = amp_cnt + 1;
        end 
    end
end   
  
endmodule
