//`timescale 1ns / 1ps
`include "dec_3to8.v"

module tb_3to8dec;
    reg [2:0] a;          // Input to the decoder
    wire [7:0] word;      // Output from the decoder

    // Instantiate the 3-to-8 decoder module
    dec_3to8 uut (
        .a(a),
        .word(word)
    );

    initial begin
        $display("Time	 a  | word");
        $monitor("%0t	 %b | %b", $time, a, word);
        
        // Apply all possible input combinations
        a = 3'b000; #10;
        a = 3'b001; #10;
        a = 3'b010; #10;
        a = 3'b011; #10;
        a = 3'b100; #10;
        a = 3'b101; #10;
        a = 3'b110; #10;
        a = 3'b111; #10;
        
        $finish; // End simulation
    end
endmodule
