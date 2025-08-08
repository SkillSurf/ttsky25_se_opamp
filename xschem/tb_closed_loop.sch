v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 -170 310 -170 {
lab=Vout}
N 270 -130 270 -40 {
lab=GND}
N 270 -40 380 -40 {
lab=GND}
N 380 -60 380 -40 {
lab=GND}
N 380 -170 380 -120 {
lab=Vout}
N 310 -170 380 -170 {
lab=Vout}
N 250 -150 270 -150 {
lab=GND}
N 270 -150 270 -130 {
lab=GND}
N -95 -170 -50 -170 {
lab=Vn}
N -95 -255 -95 -170 {
lab=Vn}
N -95 -255 55 -255 {
lab=Vn}
N 115 -255 305 -255 {
lab=Vout}
N 305 -255 305 -170 {
lab=Vout}
C {devices/vsource.sym} 20 5 0 0 {name=V1 value=" DC 1.8" savecurrent=false}
C {devices/gnd.sym} 20 35 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 20 -25 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/isource.sym} -70 0 0 0 {name=I0 value=5u}
C {devices/lab_pin.sym} -70 -30 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -70 30 3 0 {name=p10 sig_type=std_logic lab=Ibias}
C {devices/code_shown.sym} -870 -270 0 0 {name=SPICE1 only_toplevel=false value="
.option temp=27
.option savecurrents
.param VCC=1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

*.include /foss/designs/cmos_ota_sky130/2-stage-Opamp/Opamp.spice

*vdd VDD 0 DC \{VCC\}
*vss VSS 0 0

*ven EN 0 DC\{VCC\}

*vp Vp 0 DC 0
*vn Vn 0 DC 0.9

*vp Vp 0 DC 0.9 AC 0.001
*vn Vn 0 DC 0.9 AC -0.001
vp Vp 0 PULSE(0.9 1.1 150n 1n 1n 1200n 2400n)
*vn Vn 0 Vout

*ibias Ibias vss 5u

*Cload Vout 0 500f

*.op
*.dc Vp 0.7 1.1 1m
*.tran 0.01u 100u 1n
*.ac dec 100 1 10Meg
.save all


.control
	run
	tran 0.01u 1400n 1n
	display
	let vin = v(vp)-v(vn)
	let sr = deriv(v(Vout))/1e6
*	plot v(vp) v(vn)
	plot v(vp) v(Vout)
	plot sr
write tb_slewrate.raw
.endc

.end
"}
C {devices/lab_pin.sym} -50 -130 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 250 -190 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 270 -40 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -50 -170 0 0 {name=p7 sig_type=std_logic lab=Vn}
C {devices/lab_pin.sym} -50 -190 0 0 {name=p8 sig_type=std_logic lab=Vp}
C {devices/capa.sym} 380 -90 0 0 {name=C1
m=1
value=25p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -50 -150 0 0 {name=p11 sig_type=std_logic lab=Ibias}
C {devices/lab_pin.sym} 380 -170 0 1 {name=p1 sig_type=std_logic lab=Vout}
C {/foss/designs/ttsky_se_opamp/xschem/Opamp.sym} 100 -160 0 0 {name=x1}
C {devices/res.sym} 85 -255 3 1 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
