v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {"Is Subcircuit" = YES}
E {}
N 110 -80 110 -0 {
lab=Vouts1}
N -40 -130 70 -130 {
lab=#net1}
N -80 -40 -0 -40 {
lab=#net1}
N -80 -200 -80 -160 {
lab=VDD}
N -80 -200 110 -200 {
lab=VDD}
N 110 -200 110 -160 {
lab=VDD}
N -80 60 -80 80 {
lab=Itail}
N -80 80 110 80 {
lab=Itail}
N 110 60 110 80 {
lab=Itail}
N 0 80 0 160 {
lab=Itail}
N -0 220 0 240 {
lab=VSS}
N 0 240 270 240 {
lab=VSS}
N -250 210 -250 240 {
lab=VSS}
N -250 240 -0 240 {
lab=VSS}
N -80 -160 -80 -130 {
lab=VDD}
N 110 -160 110 -130 {
lab=VDD}
N 110 -200 270 -200 {
lab=VDD}
N -250 130 190 130 {
lab=Ibias}
N 240 130 240 180 {
lab=Ibias}
N 240 180 280 180 {
lab=Ibias}
N -70 190 -40 190 {
lab=Ibias}
N -70 130 -70 190 {
lab=Ibias}
N -210 180 -180 180 {
lab=Ibias}
N -180 130 -180 180 {
lab=Ibias}
N -80 30 110 30 {
lab=GND}
N -250 100 -250 150 {
lab=Ibias}
N -0 190 0 220 {
lab=VSS}
N 440 180 440 210 {
lab=VSS}
N -250 180 -250 210 {
lab=VSS}
N 180 130 240 130 {
lab=Ibias}
N -140 130 -140 260 {
lab=Ibias}
N -140 320 -140 340 {
lab=VSS}
N -140 340 -30 340 {
lab=VSS}
N -30 240 -30 340 {
lab=VSS}
N -140 260 -140 290 {
lab=Ibias}
N 110 -70 320 -70 {
lab=Vouts1}
N 440 90 520 90 {
lab=Vout}
N 280 180 400 180 {
lab=Ibias}
N 440 210 440 240 {
lab=VSS}
N 270 240 440 240 {
lab=VSS}
N 270 -200 440 -200 {
lab=VDD}
N 320 -70 400 -70 {
lab=Vouts1}
N 440 -200 440 -100 {
lab=VDD}
N 440 -100 440 -70 {
lab=VDD}
N 110 -100 110 -70 {
lab=Vouts1}
N -80 -100 -80 -0 {
lab=#net1}
N 0 -130 -0 -40 {
lab=#net1}
N 310 270 310 300 {
lab=Ibias}
N -200 290 -180 290 {
lab=EN}
N -190 360 240 360 {
lab=EN}
N -190 290 -190 360 {
lab=EN}
N 310 180 310 270 {
lab=Ibias}
N 310 360 400 360 {
lab=VSS}
N 400 240 400 360 {
lab=VSS}
N 240 330 270 330 {
lab=EN}
N 240 330 240 360 {
lab=EN}
N 310 300 310 330 {
lab=Ibias}
N 440 -40 440 150 {
lab=Vout}
N 320 10 320 30 {
lab=#net2}
N 320 90 440 90 {
lab=Vout}
N 320 -70 320 -50 {
lab=Vouts1}
C {sky130_fd_pr/nfet_01v8.sym} 130 30 0 1 {name=M2
L=1
W=4
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 90 -130 0 0 {name=M4
L=1
W=8
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -60 -130 0 1 {name=M3
L=1
W=8
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -100 30 0 0 {name=M1
L=1
W=4
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 420 -70 0 0 {name=M6
L=1
W=22
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -20 190 0 0 {name=M5
L=2
W=7
nf=4
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 420 180 0 0 {name=M7
L=2
W=7
nf=4
mult=6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -230 180 0 1 {name=M8
L=2
W=7
nf=4 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 0 30 0 0 {name=l4 lab=GND}
C {devices/ipin.sym} -120 30 0 0 {name=p1 lab=Vn}
C {devices/ipin.sym} -250 100 1 0 {name=p4 lab=Ibias}
C {devices/ipin.sym} 150 30 0 1 {name=p7 lab=Vp}
C {devices/ipin.sym} -200 290 0 0 {name=p2 lab=EN}
C {devices/code.sym} -350 -200 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/opin.sym} 520 90 0 0 {name=p3 lab=Vout}
C {devices/iopin.sym} 0 240 1 0 {name=p5 lab=VSS}
C {devices/iopin.sym} 30 -200 3 0 {name=p6 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} -160 290 0 0 {name=M9
L=2
W=7
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 290 330 0 0 {name=M10
L=1
W=2
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 0 100 0 1 {name=p8 sig_type=std_logic lab=Itail}
C {devices/ngspice_get_value.sym} 110 60 0 0 {name=r1 node=@m.$\{path\}xm1.msky130_fd_pr__nfet_01v8[vth]
descr="Vth="}
C {devices/lab_wire.sym} 230 -70 0 0 {name=p9 sig_type=std_logic lab=Vouts1}
C {sky130_fd_pr/cap_mim_m3_1.sym} 320 60 0 0 {name=C2 model=cap_mim_m3_1 W=7 L=7 MF=200 spiceprefix=X}
C {sky130_fd_pr/res_generic_l1.sym} 320 -20 0 0 {name=Rz
W=1
L=1300
model=res_generic_l1
mult=1}
