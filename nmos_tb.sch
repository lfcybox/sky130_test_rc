v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Runs VDS and VGS sweep in batch mode} -390 -150 0 0 0.4 0.4 {}
N -80 0 -40 0 { lab=G}
N -0 0 60 -0 { lab=B}
N -0 30 0 80 { lab=S}
N -0 -80 -0 -30 { lab=D}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} -20 0 0 0 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} -80 0 0 0 {name=l1 lab=G}
C {devices/lab_pin.sym} 0 -80 0 0 {name=l2 lab=D}
C {devices/lab_pin.sym} 60 0 0 1 {name=l3 lab=B}
C {devices/lab_pin.sym} 0 80 0 0 {name=l4 lab=S}
C {devices/code_shown.sym} -650 -80 0 0 {name=CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.temp 27
.lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice tt
*.lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice ss
*.lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice ff
*.lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice sf
*.lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice fs
"}
C {devices/code.sym} 120 -60 0 0 {name=SIM_CONTROL
only_toplevel=true 
value="
Vg G 0 1.8
Vs S 0 0
Vd D 0 1.8
Vb B 0 0

.control

save v(G) v(D) v(S) v(B)
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gmbs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vth]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vbs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vgs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vds]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgg]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgd]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbg]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbd]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdg]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdd]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cds]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csg]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csd]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[css]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgb]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdb]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csb]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbb]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[capbd]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[capbs]

*dc Vd 0 1.8 0.1
dc Vd 0 1.8 0.3 Vg 0 1.8 0.3
reshape all [7] ;same value as second sweep length

plot @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id] vs v(d) title 'id vs vd'
plot @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds] vs v(d) ylog title 'gds vs vd'

set hcopypscolor=1 ;colorful plots
hardcopy id_vd.ps @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id] vs v(d) title 'id vs vd'
hardcopy gds_vd.ps @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds] vs v(d) ylog title 'gds vs vd'

.endc
"}
