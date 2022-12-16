`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 20:02:50
// Design Name: 
// Module Name: cos
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


module cos(
    input clk,
    input [2:0] func_cnt,
    input [2:0] freq_dy,
    input [2:0] amp_cnt,
    input [2:0] peri_cnt,
    input [2:0] peri_posedge,
    output reg [15:0] cosine
    );
    
reg cos_ena;
reg[9:0] j;
wire [15:0] ocos;

initial begin
    j = 250;
    cos_ena = 0;
end 

blk_mem_sin sinROM(.clka(clk),.addra(j),.douta(ocos),.ena(cos_ena));

always@(posedge clk)
begin
    if(func_cnt == 1) begin
        if(freq_dy == 0) begin
            cos_ena = 1;
            if(peri_cnt == 0) begin
                if(j == 999) begin 
                    j = 0; 
                end else begin
                    j = j + 1;
                end
            end 
            else begin
                if(j == 999 - 250*(peri_cnt-1))begin 
                    j = 250;
                end else begin
                    j = j + 1;
                end
            end 
        end
    end 
    else begin
        cos_ena = 0;
        j = 250;
    end
    if(peri_posedge == 1) begin
        j = 250;
    end   
end

always@(ocos or amp_cnt) begin
    cosine = ocos;
    cosine = cosine/(amp_cnt+1) + 32768*amp_cnt/(amp_cnt+1);
end


endmodule
