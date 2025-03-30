`include "dec_3to8.v"

module dec_6to64(
	input [5:0] addr,
	output [63:0] wordline
);

//Split addresses into 2 parts
wire [2:0] msb;
wire [2:0] lsb;
assign msb = addr[5:3];
assign lsb = addr[2:0];
 	
//MSB decoder with 8 enable signals connecting to 8 LSB decoders 
wire [7:0] msb_en;
dec_3to8 msb_decoder(
	.a(msb),
	.word(msb_en)
);
	
//8 groups of LSB decoders
wire [63:0] wl_temp;

genvar i;
generate
	for (i = 0; i < 8; i = i + 1) begin: lsb_decoder_group
	wire [7:0] lsb_out;

dec_3to8 lsb_decoder(
	.a(lsb),
	.word(lsb_out)
);

//Combine MSB decoders to 8 LSB decoders (active low)
assign wl_temp[i * 8 +: 8] = (msb_en[i] == 1'b0) ? lsb_out : 8'b11111111;
	end
endgenerate

//Assign the final output
assign wordline = wl_temp;

endmodule










