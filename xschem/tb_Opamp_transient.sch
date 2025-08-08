v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 -250 40 -250 {
lab=Vout}
N -0 -210 -0 -120 {
lab=GND}
N 0 -120 110 -120 {
lab=GND}
N 110 -140 110 -120 {
lab=GND}
N 110 -250 110 -200 {
lab=Vout}
N 40 -250 110 -250 {
lab=Vout}
N -20 -230 0 -230 {
lab=GND}
N 0 -230 0 -210 {
lab=GND}
C {devices/code_shown.sym} -1060 -330 0 0 {name=SPICE1 only_toplevel=false value="
*.option temp=27
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
vp Vp 0 SIN(0.9 0.001 100k)
vn Vn 0 SIN(0.9 -0.001 100k)

*ibias Ibias vss 5u

*Cload Vout 0 500f

*.nodeset v(vout)=0.6 v(vp)=0.6 v(vn)=0.6
*.op
*.dc Vp 0.7 1.1 1m
.tran 0.01u 100u 1n
*.ac dec 100 1 10Meg
.save all


.control
	run
	plot v(vp) v(vn) v(Vout)
	display
write tb.raw
.endc

.end
"}
C {devices/vsource.sym} -310 -30 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -310 0 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -310 -60 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -320 -210 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -20 -270 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 0 -120 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -320 -250 0 0 {name=p7 sig_type=std_logic lab=Vn}
C {devices/lab_pin.sym} -320 -270 0 0 {name=p8 sig_type=std_logic lab=Vp}
C {devices/capa.sym} 110 -170 0 0 {name=C1
m=1
value=25p
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} -200 -30 0 0 {name=I0 value=5u}
C {devices/lab_pin.sym} -200 -60 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -200 0 3 0 {name=p10 sig_type=std_logic lab=Ibias}
C {devices/lab_pin.sym} -320 -230 0 0 {name=p11 sig_type=std_logic lab=Ibias}
C {devices/lab_pin.sym} 110 -250 0 1 {name=p1 sig_type=std_logic lab=Vout}
C {/foss/designs/ttsky_se_opamp/xschem/Opamp.sym} -170 -240 0 0 {name=x1}
