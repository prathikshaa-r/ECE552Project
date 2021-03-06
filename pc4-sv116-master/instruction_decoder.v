module instruction_decoder(opcode, out0, out1, out2, out3, out4, 
                            out5, out6, out7, out8, out21, out22);
input [4:0] opcode;
output out0, out1, out2, out3, out4, out5, out6, out7, out8, out21, out22;

wire w0, w1, w2, w3, w4;

not not_0(w0, opcode[0]);
not not_1(w1, opcode[1]);
not not_2(w2, opcode[2]);
not not_3(w3, opcode[3]);
not not_4(w4, opcode[4]);

and and_0(out0, w0, w1, w2, w3, w4);
and and_1(out1, opcode[0], w1, w2, w3, w4);
and and_2(out2, w0, opcode[1], w2, w3, w4);
and and_3(out3, opcode[0], opcode[1], w2, w3, w4);
and and_4(out4, w0, w1, opcode[2], w3, w4);
and and_5(out5, opcode[0], w1, opcode[2], w3, w4);
and and_6(out6, w0, opcode[1], opcode[2], w3, w4);
and and_7(out7, opcode[0], opcode[1], opcode[2], w3, w4);
and and_8(out8, w0, w1, w2, opcode[3], w4);

//the options in btw should be added if new instructions are added

and and_21(out21, opcode[0], w1, opcode[2], w3, opcode[4]);
and and_22(out22, w0, opcode[1], opcode[2], w3, opcode[4]);


endmodule