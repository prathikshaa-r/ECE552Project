module mult(data_operandA, data_operandB, ctrl_MULT, ctrl_DIV, clock, data_result, 
           data_exception, data_resultRDY);

input [31:0] data_operandA, data_operandB;
input ctrl_MULT, clock, ctrl_DIV;
output [31:0] data_result;
output data_exception, data_resultRDY;

  //defining wires needed
	 wire [64:0] initial_value;
	 wire [64:0] current_value;
	 wire [64:0] partial;
	 wire [63:0] data_out;
	
	 
	 //initial value to the product register
	 assign initial_value[0] = 1'b0;
	 assign initial_value[32:1] = data_operandB;
	 assign initial_value[64:33] = 32'd0;
	 
	 
	 //for now write enamble on
	 wire write_enable=1'b1;
	 
	 //reset is off, only goes on if mult on and counter not equal zero or 33
	 wire reset =1'b0;
	 
	 //counter 32 bits shifting left until most significant bit is one
	 wire [32:0] counter;
	 wire overflow;
    
	 counter c(clock, write_enable, ctrl_MULT, ctrl_DIV, counter);
	 
	 
    //deciding is it mid calculation or beginning
	 assign current_value = counter[0] ? initial_value : partial;

	
	 productReg partialP(clock, write_enable, reset,  current_value, data_out);
    boothLogic booths(data_out, data_operandA, partial);
	 
	 
    assign data_resultRDY = counter[32];
	
	 assign data_result = counter[32] ? partial[32:1] : 32'd0;
	 
	wire [32:0] over;
	assign over = partial[64:32];
    wire andTest, notAnd;
	 wire orTest, aTest;
	 bitwise1inAND aw(over[31:0], andTest); 
	 and and44(aTest, andTest, over[32]);
    
	 bitwiseOR orw(over, orTest);  //one if they are all one
	 not mm(notAnd, andTest);
	 and andtest(overflow, notAnd, orTest);
    assign data_exception = counter[32] ? overflow : 1'b0;
	 
//if they are not all ones and or is true than over flow true
//	 of_calc ov(data_operandA[31], data_operandB[31], partial[63], overflow);
	 
	
endmodule

