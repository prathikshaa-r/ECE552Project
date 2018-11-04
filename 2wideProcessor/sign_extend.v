module sign_extend(in, out);

input [16:0] in;
output [31:0] out;

assign out[16:0] = in;
genvar c;
generate
 for(c=17; c<=31; c=c+1) begin: loop1
 assign out[c] = in[16];
 end
 endgenerate
endmodule