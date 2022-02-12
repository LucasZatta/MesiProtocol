module MaquinaSecundaria(Clock, InvalidProcessor, InstructionHit, InitialState, ReadMiss, WriteMiss, Invalid, WriteBack, MemoryAccess, NewState);
	input Clock, InvalidProcessor, InstructionHit;
	input ReadMiss, WriteMiss, Invalid;
	output reg WriteBack, MemoryAccess;
	output reg [1:0]NewState;
	input [1:0] InitialState;
	
	
	always@(posedge Clock) begin
		if(~InvalidProcessor & InstructionHit) begin
				case(InitialState)
					2'b00: begin
						if(ReadMiss) begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = 2'b10;
						end
						if(WriteMiss || Invalid) begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = 2'b01;
						end
					
					end
					2'b01: begin
						WriteBack = 0;
						MemoryAccess = 0;
						NewState = 2'b01;
					end
					2'b10: begin
						if(WriteMiss) begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = 2'b01;
						end
						else
						if(Invalid) begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = 2'b01;
						end
						else
						if(ReadMiss) begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = 2'b10;
						end
						else begin
							WriteBack = 0;
							MemoryAccess = 0;
							NewState = InitialState;
						end
					end
					2'b11: begin
						if(WriteMiss) begin
							WriteBack = 1;
							MemoryAccess = 1;
							NewState = 2'b01;
						end
						if(ReadMiss) begin
							WriteBack = 1;
							MemoryAccess = 1;
							NewState = 2'b10;
						end
					end
				endcase
			end
			else begin
				WriteBack = 0;
				MemoryAccess = 0;
				NewState = InitialState;
			end
	end
endmodule