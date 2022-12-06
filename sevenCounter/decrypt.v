module decrypt (dig, seg_dig);
	input [3:0] dig;
	output [6:0] seg_dig;
	
	wire x1 = dig[3];
	wire x2 = dig[2];
	wire x3 = dig[1];
	wire x4 = dig[0];
	
	wire a = !(!x1*!x2*!x3*x4 + !x1*x2*!x3*!x4 + x1*!x2*x3*x4 + x1*x2*!x3*x4);
	wire b = !(!x1*x2*!x3*x4 + !x1*x2*x3*!x4 + x1*!x2*x3*x4 + x1*x2*!x3*!x4 + x1*x2*x3*!x4 + x1*x2*x3*x4);
	wire c = !(!x1*!x2*x3*!x4 + x1*x2*!x3*!x4 + x1*x2*x3*!x4 + x1*x2*x3*x4);
	wire d = !(!x1*!x2*!x3*x4 + !x1*x2*!x3*!x4 + !x1*x2*x3*x4 + x1*!x2*x3*!x4 + x1*x2*x3*x4);
	wire e = !x1*!x2*!x3*!x4 + !x1*!x2*x3*!x4 + !x1*x2*x3*!x4 + x1*!x2*!x3*!x4 + x1*!x2*x3*!x4 + x1*!x2*x3*x4 + x1*x2*!x3*!x4 + x1*x2*!x3*x4 + x1*x2*x3*!x4 + x1*x2*x3*x4;
	wire f = !(!x1*!x2*!x3*x4 + !x1*!x2*x3*!x4 + !x1*!x2*x3*x4 + !x1*x2*x3*x4 + x1*x2*!x3*x4);
	wire g = !(!x1*!x2*!x3*!x4 + !x1*!x2*!x3*x4 + !x1*x2*x3*x4 + x1*x2*!x3*!x4);
	
	assign seg_dig[6:0] = {a, b, c, d, e, f, g};
endmodule 