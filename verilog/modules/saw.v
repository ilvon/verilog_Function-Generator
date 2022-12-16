`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 17:56:36
// Design Name: 
// Module Name: saw
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


module saw(
    input clk,
    input [2:0] func_cnt,
    input [2:0] freq_dy,
    input [2:0] amp_cnt,
    input [2:0] peri_cnt,
    input [2:0] peri_posedge,
    output wire [15:0] sawtooth
    );
        
reg[9:0] b;
reg [15:0] rsaw;
reg [15:0] rsaw_amp;
assign sawtooth = rsaw_amp;

initial begin
    b = 0;
    rsaw = 0;
end 
    
always@(posedge clk)
begin
    if(func_cnt == 4) begin
        if(freq_dy == 0) begin
            if(b == 999 - 250*peri_cnt) begin
                b = 0;
                rsaw = 0;
            end
            else begin
                rsaw = 65 * b;
                b = b + 1;
            end  
        end  
    end
    else begin
        b = 0;
        rsaw = 0;
    end
    if(peri_posedge == 1) begin
        b = 0;
    end
end    

always@(rsaw or amp_cnt) begin
    rsaw_amp = rsaw/(amp_cnt+1) + 32768*amp_cnt/(amp_cnt+1);
end

    
endmodule
