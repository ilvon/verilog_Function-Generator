`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 18:33:26
// Design Name: 
// Module Name: tan
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


module tan(
    input clk,
    input [2:0] func_cnt,
    input [2:0] freq_dy,
    input [2:0] amp_cnt,
    input [2:0] peri_cnt,
    input [2:0] peri_posedge,
    output reg [15:0] tangent
    );

reg tan_ena;
reg[9:0] k;
wire [15:0] otan;   

initial begin
    k = 0;
    tan_ena = 0;
end 

blk_mem_tan tanROM(.clka(clk),.addra(k),.douta(otan),.ena(tan_ena));

always@(posedge clk) 
begin
    if(func_cnt == 2) begin
        if(freq_dy == 0) begin
            tan_ena = 1;
            if(k == 999 - 250*peri_cnt) begin
                k = 0;
            end 
            else begin
                k = k + 1;
            end 
        end
    end 
    else begin
        tan_ena = 0;
        k = 0;
    end
    if(peri_posedge == 1) begin
        k = 0;
    end
end 

always@(otan or amp_cnt) begin
    tangent = otan;
    tangent = tangent/(amp_cnt+1) + 32768*amp_cnt/(amp_cnt+1);
end


endmodule
