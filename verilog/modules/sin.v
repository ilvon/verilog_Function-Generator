`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 16:09:15
// Design Name: 
// Module Name: sin
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


module sin(
    input clk,
    input [2:0] func_cnt,
    input [2:0] freq_dy,
    input [2:0] amp_cnt,
    input [2:0] peri_cnt,
    input [2:0] peri_posedge,
    output reg [15:0] sinus
    );
    
reg sin_ena;
reg[9:0] i;
wire [15:0] osin;

initial begin
    i = 0;
    sin_ena = 0;
end 

blk_mem_sin sinROM(.clka(clk),.addra(i),.douta(osin),.ena(sin_ena));

always@(posedge clk)
begin
    if(func_cnt == 0) begin
        if(freq_dy == 0) begin  
            sin_ena = 1;
            if(i == 999 - 250*peri_cnt) begin
                i = 0;
            end 
            else begin
                i = i + 1;
            end
        end
    end 
    else begin
        sin_ena = 0;
        i = 0;
    end
    if(peri_posedge == 1) begin
        i = 0;
    end
end

always@(osin or amp_cnt) begin
    sinus = osin;
    sinus = sinus/(amp_cnt+1) + 32768*amp_cnt/(amp_cnt+1);
end


endmodule
