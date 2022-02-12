onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mesi/clk
add wave -noupdate /mesi/habEscritaMem
add wave -noupdate /mesi/Instrucao
add wave -noupdate -radix hexadecimal /mesi/Saida
add wave -noupdate /mesi/WriteOrRead
add wave -noupdate /mesi/tag
add wave -noupdate /mesi/dado
add wave -noupdate /mesi/linhaProc1
add wave -noupdate /mesi/linhaProc2
add wave -noupdate /mesi/linhaProc3
add wave -noupdate /mesi/Invalidate
add wave -noupdate /mesi/ReadMiss
add wave -noupdate /mesi/WriteMiss
add wave -noupdate /mesi/novoEstadoSnoop1
add wave -noupdate /mesi/novoEstadoSnoop2
add wave -noupdate /mesi/novoEstadoSnoop3
add wave -noupdate /mesi/novoEstadoMacSecSnoop1
add wave -noupdate /mesi/novoEstadoMacSecSnoop2
add wave -noupdate /mesi/novoEstadoMacSecSnoop3
add wave -noupdate /mesi/WriteBack
add wave -noupdate /mesi/WriteBack2
add wave -noupdate /mesi/DadoWriteBack
add wave -noupdate /mesi/dadoWriteback2
add wave -noupdate /mesi/noShared
add wave -noupdate /mesi/acessoMem
add wave -noupdate /mesi/tagWbMaq2
add wave -noupdate /mesi/tagWriteBack
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3298 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {4136 ps} {4888 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/mesi/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 10000ps sim:/mesi/habEscritaMem 
wave create -driver freeze -pattern constant -value 0010000000000000 -range 15 0 -starttime 0ps -endtime 1000ps sim:/mesi/Instrucao 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1 -starttime 400ps -endtime 450ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value St1 -starttime 400ps -endtime 500ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0100000000000000 -range 15 0 -starttime 500ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value 1 -starttime 800ps -endtime 900ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1100000000110000 -range 15 0 -starttime 900ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 1400ps -endtime 1500ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1010000001000000 -range 15 0 -starttime 1500ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 2000ps -endtime 2100ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0100000000000000 -range 15 0 -starttime 2100ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value 0100001000000000 -range 15 0 -starttime 2600ps -endtime 2700ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value 0100000000000000 -range 15 0 -starttime 2600ps -endtime 2700ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 2600ps -endtime 2700ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0100001000000000 -range 15 0 -starttime 2700ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 3200ps -endtime 3300ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1110001001100000 -range 15 0 -starttime 3300ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 3800ps -endtime 3900ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0100011000000000 -range 15 0 -starttime 3900ps -endtime 10000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 4200ps -endtime 4300ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1100011001000000 -range 15 0 -starttime 4300ps -endtime 7000ps Edit:/mesi/Instrucao 
WaveCollapseAll -1
wave clipboard restore
