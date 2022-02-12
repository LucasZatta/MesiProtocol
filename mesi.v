module mesi(habEscritaMem,Instrucao,clk,Saida);
input clk,habEscritaMem;
input [15:0]Instrucao;
output reg[7:0]Saida;

//Registradores
reg [2:0] ReadMiss,WriteMiss,Invalidate,WriteBack,acessoMem,WriteBack2;
reg [14:0] auxDado1,auxDado2,auxDado3;
reg [7:0]dado,DadoWriteBack, dadoWriteback2;
reg [4:0]tag,tagWriteBack, tagWbMaq2;
reg [1:0]axuProc;
reg WriteOrRead;

// Fios
wire ReadMissBus,WriteMissBus,InvalidateBus,EstaInvalido1,EstaInvalido2,EstaInvalido3;
wire [1:0] novoEstadoMacSecSnoop1,novoEstadoMacSecSnoop2,novoEstadoMacSecSnoop3;
wire proc1,proc2,proc3, Hit1, Hit2, Hit3, WriteBackSnoop, WriteBackMaqSecSnoop,noShared; 
wire [1:0] novoEstadoSnoop1,novoEstadoSnoop2,novoEstadoSnoop3;
wire [3:0] mensagemBus1 ,mensagemBus2,mensagemBus3;
wire [1:0] macSecSnoop1,macSecSnoop2,macSecSnoop3;
wire [14:0] linhaProc1,linhaProc2,linhaProc3;
wire [7:0] dado1,dado2,dado3,dadoMem, discarte;
wire [1:0] estado1,estado2,estado3;
wire [4:0] tag1,tag2,tag3;
//wire [12:0] memoryNew;

// Atribuições
assign WriteBackSnoop =|({mensagemBus1[0], mensagemBus2[0], mensagemBus3[0]});
assign WriteBackMaqSecSnoop =|({macSecSnoop1[0], macSecSnoop2[0], macSecSnoop3[0]});
assign noShared = ~((Hit1&&EstaInvalido1) || (Hit2&&EstaInvalido2) || (Hit3&&EstaInvalido3));
assign EstaInvalido1 = (estado1 == 2'b01)?0:1;
assign EstaInvalido2 = (estado2 == 2'b01)?0:1;
assign EstaInvalido3 = (estado3 == 2'b01)?0:1;
assign proc1 = (axuProc == 2'b01) ? 1:0;
assign proc2 = (axuProc == 2'b10) ? 1:0; 
assign proc3 = (axuProc == 2'b11) ? 1:0;
assign InvalidateBus = |Invalidate;
assign WriteMissBus = |WriteMiss;
assign ReadMissBus = |ReadMiss;
assign linhaProc1 = auxDado1;
assign linhaProc2 = auxDado2;
assign linhaProc3 = auxDado3;
assign Hit1 = &(tag~^tag1);
assign Hit2 = &(tag~^tag2);
assign Hit3 = &(tag~^tag3);
//assign memoryNew = {tag, dadoWriteback2}
//

// Chamada das maquinas primaria do snooping para cada processador

maquinaMESI MaquinaMesi1 (clk, WriteOrRead, noShared, proc1, Hit1, estado1, mensagemBus1[3], mensagemBus1[2], mensagemBus1[1], mensagemBus1[0], novoEstadoSnoop1);
maquinaMESI MaquinaMesi2 (clk, WriteOrRead, noShared, proc2, Hit2, estado2, mensagemBus2[3], mensagemBus2[2], mensagemBus2[1], mensagemBus2[0], novoEstadoSnoop2);
maquinaMESI MaquinaMesi3 (clk, WriteOrRead, noShared, proc3, Hit3, estado3, mensagemBus3[3], mensagemBus3[2], mensagemBus3[1], mensagemBus3[0], novoEstadoSnoop3);

// Chamada das maquinas secundarias do snooping para cada processador

MaquinaSecundaria MessiSecundaria1 (clk, proc1, Hit1, estado1, ReadMissBus, WriteMissBus, InvalidateBus, macSecSnoop1[0], macSecSnoop1[1], novoEstadoMacSecSnoop1);
MaquinaSecundaria MessiSecundaria2 (clk, proc2, Hit2, estado2, ReadMissBus, WriteMissBus, InvalidateBus, macSecSnoop2[0], macSecSnoop2[1], novoEstadoMacSecSnoop2);
MaquinaSecundaria MessiSecundaria3 (clk, proc3, Hit3, estado3, ReadMissBus, WriteMissBus, InvalidateBus, macSecSnoop3[0], macSecSnoop3[1], novoEstadoMacSecSnoop3);

// Chamada dos processadores


P01 bloco01_0 (tag[1:0], clk, linhaProc1, habEscritaMem&&(proc1||Hit1), {estado1, tag1, dado1});
P02 bloco02_0 (tag[1:0], clk, linhaProc2, habEscritaMem&&(proc2||Hit2), {estado2, tag2, dado2});
P03 bloco03_0 (tag[1:0], clk, linhaProc3, habEscritaMem&&(proc3||Hit3), {estado3, tag3, dado3});


// Chamada da memória principal

mram blocoMemoria (clk,DadoWriteBack,tag,tagWriteBack,WriteBackSnoop,dadoMem); 
mram blocoMemoria2 (clk,dadoWriteback2,tag,tagWbMaq2,WriteBackMaqSecSnoop, discarte);


always@(posedge clk) begin
 ReadMiss = {mensagemBus3[3], mensagemBus2[3], mensagemBus1[3]};
 WriteMiss = {mensagemBus3[2], mensagemBus2[2], mensagemBus1[2]};
 Invalidate = {mensagemBus3[1], mensagemBus2[1], mensagemBus1[1]};
 WriteBack = {mensagemBus3[0], mensagemBus2[0], mensagemBus1[0]};
 acessoMem = {macSecSnoop3[1], macSecSnoop2[1], macSecSnoop1[1]};
 WriteBack2 = {macSecSnoop3[0], macSecSnoop2[0], macSecSnoop1[0]};
 WriteOrRead = Instrucao[15]; 
 axuProc = Instrucao[14:13];
 tag = Instrucao[12:8];
 dado = Instrucao[7:0];
 
 if (proc1) begin
		if (ReadMiss[0]) begin
			if(WriteBack[0]) begin
				DadoWriteBack=dado1;
				tagWriteBack = tag1;
			end
			if (acessoMem[1]) begin
				auxDado1 = {novoEstadoSnoop1,tag2,dado2};
				Saida = dado2;
			end
			else 
				if (acessoMem[2]) begin
					auxDado1 = {novoEstadoSnoop1,tag3,dado3};
					Saida = dado3;
				end
			else begin
				auxDado1 = {novoEstadoSnoop1,tag,dadoMem};
				Saida = dadoMem;
			end
		end
		else 
			if (WriteMiss[0]) begin
				if(WriteBack[0]) begin
					DadoWriteBack = dado1;
					tagWriteBack = tag1;
				end
				auxDado1 = {novoEstadoSnoop1,tag,dado};
				Saida = dado;
			end
			else 
				if(WriteOrRead) begin
					auxDado1 ={novoEstadoSnoop1,tag,dado};
					Saida = dado;
				end 
				else begin
					auxDado1 ={novoEstadoSnoop1,tag,dado1};
					Saida = dado1;
				end
	end
else begin
	if (Hit1) 
		begin
			if (WriteBack2[0]) 
				begin
					dadoWriteback2 = dado1;
					tagWbMaq2 = tag1;
				end
			auxDado1 ={novoEstadoMacSecSnoop1,tag1,dado1};
		end
		else begin
			auxDado1 ={estado1,tag1,dado1};
		end
	end
	
  
if (proc2) begin
		if (ReadMiss[1]) begin
			if(WriteBack[1]) begin
				DadoWriteBack=dado2;
				tagWriteBack = tag2;
			end
			if (acessoMem[0]) begin
				auxDado2 = {novoEstadoSnoop2,tag1,dado1};
				Saida = dado1;
			end
			else if (acessoMem[2]) begin
				auxDado2 = {novoEstadoSnoop2,tag3,dado3};
				Saida = dado3;
			end
			else begin
				auxDado2 = {novoEstadoSnoop2,tag,dadoMem};
				Saida = dadoMem;
			end
		end
		else  
			if (WriteMiss[1]) begin
				if(WriteBack[1])begin
					DadoWriteBack = dado2;
					tagWriteBack = tag2;
				end
				auxDado2 = {novoEstadoSnoop2,tag,dado};
				Saida = dado;
			end
			else 
				if(WriteOrRead) begin
					auxDado2 ={novoEstadoSnoop2,tag,dado};
					Saida = dado;
				end 
				else begin
					auxDado2 ={novoEstadoSnoop2,tag,dado2};
					Saida = dado2;
				end
	end
else begin
		if (Hit2)begin
			if (WriteBack2[1]) begin
				dadoWriteback2 =dado2;
				tagWbMaq2 = tag2;
			end
			auxDado2 ={novoEstadoMacSecSnoop2,tag2,dado2};
		end
		else begin
			auxDado2 ={estado2,tag2,dado2};
		end
	end
  
if (proc3) begin
	if (ReadMiss[2]) begin
		if(WriteBack[2]) begin
			DadoWriteBack=dado3;
			tagWriteBack = tag3;
		end
		if (acessoMem[1]) begin
			auxDado3 = {novoEstadoSnoop3,tag2,dado2};
			Saida = dado2;
		end
		else 
			if (acessoMem[0]) begin
				auxDado3 = {novoEstadoSnoop3,tag1,dado1};
				Saida = dado1;
			end
			else begin
				auxDado3 = {novoEstadoSnoop3,tag,dadoMem};
				Saida = dadoMem;
			end
	end
	else 
		if (WriteMiss[2]) begin
				if(WriteBack[2]) begin
					DadoWriteBack = dado3;
					tagWriteBack = tag3;
				end
				auxDado3 = {novoEstadoSnoop3,tag,dado};
				Saida = dado;
			end
		else 
			if(WriteOrRead) begin
				auxDado3 ={novoEstadoSnoop3,tag,dado};
				Saida = dado;
			end 
		else begin
			auxDado3 ={novoEstadoSnoop3,tag,dado3};
			Saida = dado3;
		end
end
else begin
		if (Hit3) begin
			if (WriteBack2[2]) begin
				dadoWriteback2 =dado3;
				tagWbMaq2 = tag3;
			end
			auxDado3 ={novoEstadoMacSecSnoop3,tag3,dado3};
		end
		else begin
			auxDado3 ={estado3,tag3,dado3};
		end
	end
 
end
endmodule 











