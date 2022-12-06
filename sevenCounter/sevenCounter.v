module sevenCounter (
	input wire clk,
	input wire btn,

	output wire dig1,
	output wire dig2,
	output wire dig3,
	output wire dig4,

	output wire segA,
	output wire segB,
	output wire segC,
	output wire segD,
	output wire segE,
	output wire segF,
	output wire segG
);




reg [27:0]clk_div = 28'h0000001;

always @(posedge clk)
begin
	clk_div <= clk_div + 28'h0000001;
end

reg [15:0]counter = 16'h0000;
always @(posedge clk_div[21])
begin
	counter <= counter + 16'h0001;
end

reg [7:0]shift_reg = 8'b00000001;
reg [3:0]numero;
wire [3:0]digit;
wire [7:0]seg_dig;
always @(posedge clk_div[12])
begin
	shift_reg <= (shift_reg << 1) | (shift_reg >> (8 - 1));
	if (shift_reg == 8'b01000000) begin
		numero[3:0] <= counter[15:12];		
	end

	if (shift_reg == 8'b00010000) begin
		numero[3:0] <= counter[11:8];		
	end
	if (shift_reg == 8'b00000100) begin
		numero[3:0] <= counter[7:4];		
	end
	if (shift_reg == 8'b00000001) begin
		numero[3:0] <= counter[3:0];		
	end
end


assign digit = numero;
decrypt d0(digit, seg_dig);

assign dig3 = ~shift_reg[6];
assign dig2 = ~shift_reg[4];
assign dig4 = ~shift_reg[2];
assign dig1 = ~shift_reg[0];

assign segA = seg_dig[6];
assign segB = seg_dig[5];
assign segC = seg_dig[4];  
assign segD = seg_dig[3];
assign segE = seg_dig[2];
assign segF = seg_dig[1];
assign segG = seg_dig[0];
 
//assign led = btn == 1'b1 ? ~clk_div[25] : 1'b1;

endmodule

