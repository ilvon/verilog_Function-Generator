# verilog_Function-Generator

## Features
1. For a given range, it produces sine or cosine or tangent values based on user choice. For instance, if the input range is $[0,\pi]$, and the user has selected sine wave, the output should be the repetitive values of sine wave in the interval $[0,\pi]$ with as small an interval between values as possible. Your design should be able to support a full wave i.e. the range $[0, 2\pi]$.
2. If the user chooses to generate a clock of frequency $F$, your code should generate that clock as output. You can restrict the range or values of F that a user can choose from.
3. Your design should be able to generate a triangular wave of a given period and amplitude. You can restrict the user to select period and amplitude within a range.
4. Your design should be able to generate a saw tooth wave of a given period and amplitude. You can restrict the user to select period and amplitude within a range.

## Remarks
1. Use Integrated Logic Analyzer (ILA) in Xilinx Vivado to check the output waveform
2. main clock can change to 10ns/20ns period without ILA
3. Implemented on PYNQ-Z2 board
