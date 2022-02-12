module maquinaMESI(Clock, WriteOrRead, NoShared, InvalidProcessor, InstructionHit, InitialState, ReadMiss, WriteMiss, Invalid, WriteBack, NewState); 
	input Clock, WriteOrRead, InvalidProcessor, InstructionHit, NoShared;
	input [1:0] InitialState;		    	
	output reg Invalid, WriteBack, ReadMiss, WriteMiss;
	output reg [1:0]NewState;		
	
	always@(posedge Clock) begin
	if(InvalidProcessor) begin
			if(WriteOrRead)
				case(InitialState)
					2'b01: begin // I
						ReadMiss = 0;
						WriteMiss = 1;
						Invalid = 0;
						WriteBack = 0;
						NewState = 2'b11;
					end
					2'b10: begin // S
						
						if(InstructionHit) begin // Write hit
								ReadMiss = 0;
								WriteMiss = 0;
								Invalid = 1;
								WriteBack = 0;
								NewState = 2'b11;
							end
						else begin // Write miss
							ReadMiss = 0;
							WriteMiss = 1;
							Invalid = 0;
							WriteBack = 0;
							NewState = 2'b11;
						end	
					end
					2'b11: begin // M	
						if(InstructionHit) begin // write hit
							ReadMiss = 0;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 0;
							NewState = 2'b11;
						end
						else begin // write miss
							ReadMiss = 0;
							WriteMiss = 1;
							Invalid = 0;
							WriteBack = 1;
							NewState = 2'b11;
						end	
					end
						2'b00: begin // E
							if(InstructionHit) begin // write hit
								ReadMiss = 0;
								WriteMiss = 0;
								Invalid = 0;
								WriteBack = 0;
								NewState = 2'b11;
							end
							else begin // Write miss
									ReadMiss = 0;
									WriteMiss = 1;
									Invalid = 0;
									WriteBack = 0;
									NewState = 2'b11;
								end		
						end
				endcase
			else
				case(InitialState)
						2'b00: begin // E
							if(InstructionHit) begin // read hit
								ReadMiss = 0;
								WriteMiss = 0;
								Invalid = 0;
								WriteBack = 0;
								NewState = 2'b00;
							end
							else begin // Read miss
								ReadMiss = 1;
								WriteMiss = 0;
								Invalid = 0;
								WriteBack = 0;
								NewState = 2'b10;
							end
						end
					2'b01: begin // I
							ReadMiss = 1;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 0;
							if(NoShared)
								NewState = 2'b00;
							else
								NewState = 2'b10;
						end
					2'b10: begin // S	
						if(InstructionHit) begin // Read hit
							ReadMiss = 0;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 0;
							NewState = 2'b10;
						end
						else begin // Read miss
							ReadMiss = 1;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 0;
							NewState = 2'b10;
						end
					end
					2'b11: begin // M	
						if(InstructionHit) begin // Read hit
							ReadMiss = 0;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 0;
							NewState = 2'b11;
						end
						else begin // read miss
							ReadMiss = 1;
							WriteMiss = 0;
							Invalid = 0;
							WriteBack = 1;
							NewState = 2'b10;
						end
					end
				endcase	
		end
	else begin
		ReadMiss = 0;
		WriteMiss = 0;
		Invalid = 0;
		WriteBack = 0;
		NewState = InitialState;
	end
end
endmodule
