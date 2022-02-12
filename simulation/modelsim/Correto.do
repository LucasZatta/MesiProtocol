view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0011111000000000 -range 15 0 -starttime 0ps -endtime 1000ps sim:/mesi/Instruction 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 6000ps sim:/mesi/clk 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 850ps sim:/mesi/liberar 
wave modify -driver freeze -pattern constant -value St0 -starttime 0ps -endtime 6000ps Edit:/mesi/liberar 
wave modify -driver freeze -pattern constant -value 1 -starttime 850ps -endtime 950ps Edit:/mesi/liberar 
wave modify -driver freeze -pattern constant -value St1 -starttime 1850ps -endtime 1950ps Edit:/mesi/liberar 
wave modify -driver freeze -pattern constant -value St1 -starttime 2850ps -endtime 2950ps Edit:/mesi/liberar 
wave modify -driver freeze -pattern constant -value St1 -starttime 3850ps -endtime 3950ps Edit:/mesi/liberar 
wave modify -driver freeze -pattern constant -value 1010000110000011 -range 15 0 -starttime 1000ps -endtime 2000ps Edit:/mesi/Instruction 
wave modify -driver freeze -pattern constant -value 0101001100000000 -range 15 0 -starttime 2000ps -endtime 3000ps Edit:/mesi/Instruction 
wave modify -driver freeze -pattern constant -value 0100001000000000 -range 15 0 -starttime 3000ps -endtime 4000ps Edit:/mesi/Instruction 
wave modify -driver freeze -pattern constant -value 1111001100000011 -range 15 0 -starttime 4000ps -endtime 5000ps Edit:/mesi/Instruction 
wave modify -driver freeze -pattern constant -value 0010001000000000 -range 15 0 -starttime 0ps -endtime 1000ps Edit:/mesi/Instruction 
WaveCollapseAll -1
wave clipboard restore
