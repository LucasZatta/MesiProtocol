onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mesi/clk
add wave -noupdate /mesi/habEscritaMem
add wave -noupdate /mesi/Instrucao
add wave -noupdate /mesi/ReadMiss
add wave -noupdate /mesi/WriteMiss
add wave -noupdate /mesi/Invalidate
add wave -noupdate /mesi/linhaProc1
add wave -noupdate /mesi/linhaProc2
add wave -noupdate /mesi/linhaProc3
add wave -noupdate /mesi/dadoMem
add wave -noupdate /mesi/Saida
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {374 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
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
WaveRestoreZoom {0 ps} {980 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/mesi/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/mesi/habEscritaMem 
wave create -driver freeze -pattern constant -value 0010001000000000 -range 15 0 -starttime 0ps -endtime 1000ps sim:/mesi/Instrucao 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1 -starttime 400ps -endtime 500ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1010000110000011 -range 15 0 -starttime 0500ps -endtime 1000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 5000ps Edit:/mesi/clk 
wave modify -driver freeze -pattern constant -value 0 -starttime 500ps -endtime 5000ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1010000110000011 -range 15 0 -starttime 500ps -endtime 5000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value 1 -starttime 800ps -endtime 900ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0101001100000000 -range 15 0 -starttime 900ps -endtime 1000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value 0101001100000000 -range 15 0 -starttime 900ps -endtime 5000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 1300ps -endtime 1400ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 0100001000000000 -range 15 0 -starttime 1400ps -endtime 5000ps Edit:/mesi/Instrucao 
wave modify -driver freeze -pattern constant -value St1 -starttime 1900ps -endtime 2000ps Edit:/mesi/habEscritaMem 
wave modify -driver freeze -pattern constant -value 1111001100000011 -range 15 0 -starttime 2000ps -endtime 5000ps Edit:/mesi/Instrucao 
WaveCollapseAll -1
wave clipboard restore
