
module dec_3to8(
	input [2:0] a,
	output [7:0] word                          
);

// Inverted signal 
wire [2:0] a_n;
assign a_n[0] = ~a[0];
assign a_n[1] = ~a[1];
assign a_n[2] = ~a[2];
	
// Predecoder a1a0 
wire [3:0] pre2; 
assign pre2[0] = (a_n[1] & a_n[0]);              
assign pre2[1] = (a_n[1] & a[0]);               
assign pre2[2] = (a[1] & a_n[0]);                
assign pre2[3] = (a[1] & a[0]);                 
	
// 3 to 8 decoding - all active low 
assign word[0] = ~(a_n[2] & pre2[0]);       
assign word[1] = ~(a_n[2] & pre2[1]);      
assign word[2] = ~(a_n[2] & pre2[2]);       
assign word[3] = ~(a_n[2] & pre2[3]);       
assign word[4] = ~(a[2] & pre2[0]);       
assign word[5] = ~(a[2] & pre2[1]);       
assign word[6] = ~(a[2] & pre2[2]);       
assign word[7] = ~(a[2] & pre2[3]);      

endmodule

