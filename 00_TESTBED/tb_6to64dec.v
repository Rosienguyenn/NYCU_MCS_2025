`timescale 1ns / 1ps
`include "dec_6to64.v" 

module tb_dec_6to64;

    // Testbench signals
    reg  [5:0] addr;
    wire [63:0] wordline;

    // Instantiate the decoder
    dec_6to64 uut (
        .addr(addr),
        .wordline(wordline)
    );

    integer i;

    initial begin
        $display("=== Simulation of dec_6to64 ===");
        $display("ADDR | Wordline (only 1 bit should be LOW)");

        // Loop through all 64 address values
        for (i = 0; i < 64; i = i + 1) begin
            addr = i[5:0];         // Apply address
            #5;                    // Wait 5ns for propagation
            $display("  %2d  | %064b", addr, wordline);
        end

        $finish;
    end

endmodule

