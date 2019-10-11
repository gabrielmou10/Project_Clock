onerror {exit -code 1}
vlib work
vcom -work work relogio.vho
vcom -work work Waveform15.vwf.vht
vsim -novopt -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.ula_vhd_vec_tst
vcd file -direction relogio.msim.vcd
vcd add -internal ula_vhd_vec_tst/*
vcd add -internal ula_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
