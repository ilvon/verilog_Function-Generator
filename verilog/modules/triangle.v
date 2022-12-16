`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 17:30:16
// Design Name: 
// Module Name: triangle
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


module triangle(
    input clk,
    input [2:0] func_cnt,
    input [2:0] freq_dy,
    input [2:0] amp_cnt,
    input [2:0] peri_cnt,
    input [2:0] peri_posedge,
    output wire [15:0] triangular
    );
     
reg[9:0] a;
reg [15:0] rt;
reg [15:0] rt_amp;
assign triangular = rt_amp;

initial begin
    a = 0;
    rt = 32768;
end 
     
always@(posedge clk)
begin
    if(func_cnt == 3) begin
        if(freq_dy == 0) begin
            if(a == 999 - 250*peri_cnt) begin
                a = 0;
                rt = 32768;
            end
            else if(a>=0 && a<=249)begin
                rt = 32768 + 120*(a+1);
                a = a + 1;
            end
            else if(a>=250 && a<=749) begin
                rt = 62768 - 120*(a-249);
                a = a + 1;
            end
            else if(a>=750 && a<999)begin
                rt = 2768 + 120*(a-750);
                a = a + 1;
            end
        end
    end
    else begin
        a = 0;
        rt = 32768;
    end
    if(peri_posedge == 1) begin
        a = 0;
    end
end

always@(rt or amp_cnt) begin
    rt_amp = rt/(amp_cnt+1) + 32768*amp_cnt/(amp_cnt+1);
end

    
endmodule
