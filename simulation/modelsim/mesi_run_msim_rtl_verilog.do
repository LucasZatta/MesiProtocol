transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/mesi.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/MaquinaSecundaria.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/maquinamesi.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/p01.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/p02.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/p03.v}
vlog -vlog01compat -work work +incdir+C:/Users/janio/Desktop/snoopingMESI/mesi {C:/Users/janio/Desktop/snoopingMESI/mesi/mram.v}

