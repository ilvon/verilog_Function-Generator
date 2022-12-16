`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 17:17:01
// Design Name: 
// Module Name: func_gen
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


module func_gen(
    clk,
    btn,
    wave,
    led
    );
    
input clk;
input wire [3:0] btn;
(* MARK_DEBUG = "TRUE" *)output wire [15:0] wave;
//(* MARK_DEBUG = "TRUE" *)wire [15:0] wave;
output wire [3:0] led;

wire [2:0] func_cnt, amp_cnt, freq_dy, peri_cnt, peri_posedge;
wire [15:0] sinus, cosine, tangent, triangular, sawtooth;
reg [15:0] rwave;
wire [3:0] bto;

assign wave = rwave;

posedge_btn pbt(clk, btn, bto);
LEDbtn ledctrl(btn, led);
func_ch fnc(clk, bto, func_cnt);
amp_ch amp(clk, bto, amp_cnt);
freq_ch freq(clk, bto, freq_dy);
per_ch peri(clk, bto, btn, peri_posedge, peri_cnt);

sin sine_wave(clk, func_cnt, freq_dy, amp_cnt, peri_cnt, peri_posedge, sinus);
cos cosine_wave(clk, func_cnt, freq_dy, amp_cnt, peri_cnt, peri_posedge, cosine);
tan tangent_wave(clk, func_cnt, freq_dy, amp_cnt, peri_cnt, peri_posedge, tangent);
triangle tria_wave(clk, func_cnt, freq_dy, amp_cnt, peri_cnt, peri_posedge, triangular); 
saw sawtooth_wave(clk, func_cnt, freq_dy, amp_cnt, peri_cnt, peri_posedge, sawtooth);


always@(sinus or cosine or tangent or triangular or sawtooth or func_cnt) begin
    case(func_cnt)
        3'd0    : rwave = sinus     ;
        3'd1    : rwave = cosine    ;
        3'd2    : rwave = tangent   ;
        3'd3    : rwave = triangular;
        3'd4    : rwave = sawtooth  ;
        default : rwave = 16'd32768;
    endcase    
end


endmodule
