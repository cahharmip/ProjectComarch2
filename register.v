/*
file : Register
By   : Sorapol  Sroysuwan 5610503990
	   Jackthip Phureesatian 5610500966
Date : 9/5/2558
*/

module register (
	input clk,    // Clock
	input regWrite, // Clock Enable
	input[4:0] readReg1,
	input[4:0] readReg2,
	input[4:0] writeReg,
	input[31:0] writeData,  // Asynchronous reset active low
	output[31:0] readData1,
	output[31:0] readData2, 
);
	
	reg[31:0] regCell[31:0];
	wire[31:0] writeData_wire;

	always@(posedge clk) begin
		if (readReg1 == 4'b0) begin
			readData1 = 32'b0;
		end
		else begin
			readData1 = regCell[readReg1];
		end

		if (readReg2 == 4'b0) begin
			readData2 = 32'b0;
		end
		else begin
			readData2 = regCell[readReg2];
		end

		if ( regWrite == 1 ) begin 
			regCell[writeReg] = writeData;
		end
	end
endmodule

module  test_register (
	input clk,
	input[31:0] instruction	,
	input control,
	output[31:0] writeBack
);


endmodule