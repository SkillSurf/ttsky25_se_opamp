v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 30 300 30 {
lab=Vout}
N 30 30 30 60 {
lab=Vn}
N 30 120 270 120 {
lab=GND}
N 360 -140 360 -100 {
lab=Vout}
N 360 -40 360 120 {
lab=GND}
N 270 120 360 120 {
lab=GND}
N 300 -140 300 30 {
lab=Vout}
N 265 -120 265 120 {
lab=GND}
N 265 -140 360 -140 {
lab=Vout}
N -100 -140 -35 -140 {
lab=Vn}
N -100 -140 -100 30 {
lab=Vn}
N -100 30 140 30 {
lab=Vn}
C {devices/res.sym} 170 30 1 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 30 120 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -700 -310 0 0 {name=SPICE1 only_toplevel=false value="
.option temp=27
.option savecurrents
*.option savevoltages
.param VCC=1.8

*vdd VDD 0 DC \{VCC\}
*vss VSS 0 0

*ven EN 0 DC\{VCC\}

*vp Vp 0 DC 0
*vn Vn 0 DC 0.9

vp Vp 0 DC 0.9 AC 0.001
*vn Vn 0 DC 0.9 AC -0.001 

*ibias Ibias vss 5u

*Cload Vout 0 500f

*.nodeset v(vout)=0.6 v(vp)=0.6 v(vn)=0.6
*.op
*.dc Vp 0.7 1.1 1m
*.tran 0.1u 20u 1n
.ac dec 100 1 10Meg
.save all


.control
save all
*save @m.x2.xm1.msky130_fd_pr__nfet_01v8[gm]
save @m.x2.xm1.msky130_fd_pr__nfet_01v8[vth]
save @m.x2.xm2.msky130_fd_pr__nfet_01v8[vth]
save @m.x2.xm3.msky130_fd_pr__nfet_01v8[vth]
	run
	display
	let vin = v(Vp)-v(Vn)
	let gain = v(Vout)/(v(Vp)-v(Vn))
*	plot v(Vout) v(vin) 
*	plot db(gain)
	plot db(gain) phase(gain)*180/pi xlog
write tb_closed_loop.raw
.endc

.end
"}
C {devices/vsource.sym} 475 -125 0 0 {name=V1 value=" DC 1.8" savecurrent=false}
C {devices/gnd.sym} 475 -95 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 475 -155 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/isource.sym} 485 55 0 0 {name=I0 value=5u}
C {devices/lab_pin.sym} 485 25 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 485 85 3 0 {name=p10 sig_type=std_logic lab=Ibias}
C {/foss/designs/cmos-two-stage-opamp/xschem/Opamp.sym} 115 -130 0 0 {name=x2}
C {devices/lab_pin.sym} 265 -160 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -35 -120 0 0 {name=p11 sig_type=std_logic lab=Ibias}
C {devices/lab_pin.sym} -35 -140 0 0 {name=p7 sig_type=std_logic lab=Vn}
C {devices/lab_pin.sym} -35 -160 0 0 {name=p8 sig_type=std_logic lab=Vp}
C {devices/capa.sym} 360 -70 0 0 {name=C2
m=1
value=50p
footprint=1206
device="ceramic capacitor"}
C {devices/code.sym} -910 -305 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/lab_pin.sym} 360 -135 0 1 {name=p5 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} -35 -100 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/res.sym} 30 90 2 0 {name=R2
value=10Meg
footprint=1206
device=resistor
m=1}
