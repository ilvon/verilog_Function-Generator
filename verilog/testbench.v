`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 16:07:48
// Design Name: 
// Module Name: testbench
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


module testbench();
    

reg clk;
wire [15:0] wave;
reg [3:0] btn;
initial clk <= 1'd0;

func_gen fg(.clk(clk), .btn(btn), .wave(wave));

always #5 clk=~clk;

initial begin
    #4000
    btn = 4'b1000; #11              //sin
    btn = 4'b0000; #20000
//    btn = 4'b1000; #230             //cos           
//    btn = 4'b0000; #20000
//    btn = 4'b1000; #11              //tan
//    btn = 4'b0000; #20000
//    btn = 4'b1000; #11              //tria
//    btn = 4'b0000; #20000           
//    btn = 4'b1000; #11              //sawt
//    btn = 4'b0000; #20000
          
    btn = 4'b0100; #11       
    btn = 4'b0000; #40000
    btn = 4'b0100; #11
    btn = 4'b0000; #40000
    btn = 4'b0100; #11
    btn = 4'b0000; #40000
    btn = 4'b0100; #11
    btn = 4'b0000; #40000
    btn = 4'b0100; #11
    btn = 4'b0000; #40000               //done amp
                 
    btn = 4'b0010; #11       
    btn = 4'b0000; #40000
    btn = 4'b0010; #11
    btn = 4'b0000; #40000
    btn = 4'b0010; #11
    btn = 4'b0000; #40000
    btn = 4'b0010; #11
    btn = 4'b0000; #40000
    btn = 4'b0010; #11
    btn = 4'b0000; #40000               //done freq
                     
    btn = 4'b0001; #11       
    btn = 4'b0000; #40000
    btn = 4'b0001; #11
    btn = 4'b0000; #40000
    btn = 4'b0001; #11
    btn = 4'b0000; #40000
    btn = 4'b0001; #11
    btn = 4'b0000;                      //done peri
                 
    
end

endmodule
