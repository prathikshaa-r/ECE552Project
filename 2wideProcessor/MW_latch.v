module MW_latch(clock,
                ctrl_writeEnable,
                ctrl_reset, data_out, data_in);
		
 input clock, ctrl_writeEnable, ctrl_reset;		
 input [153:0] data_in;
  output [153:0] data_out;

 
 genvar c;
 generate
 
 for(c=0; c<=153; c=c+1) begin: loop1
 dffe_ref f(data_out[c], data_in[c], clock, ctrl_writeEnable, ctrl_reset);
 end
 
 endgenerate
 
endmodule