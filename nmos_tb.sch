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
C {devices/code.sym} -240 -50 0 0 {name=SIM
only_toplevel=true 
value="
Vg G 0 1.8
Vs S 0 0
Vd D 0 1.8
Vb B 0 0

.dc Vd 0 1.8 0.1 Vg 0 1.8 0.6
.save v(G) v(D) v(S) v(B)
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gmbs]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vth]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vbs]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vgs]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vds]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgg]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgs]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgd]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbg]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbd]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbs]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdg]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdd]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cds]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csg]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csd]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[css]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cgb]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cdb]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[csb]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[cbb]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[capbd]
.save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[capbs]


*.control
*save all
*dc Vd 0 1.8 0.05 Vg 0 1.8 0.3
*plot all.vd1#branch vs D1v8
*plot all.vd2#branch vs D1v8
*plot all.vd3#branch vs D3v3
*plot all.vd4#branch vs D5v0
*plot all.vd5#branch vs D10v5
*plot all.vd6#branch vs D16v0
*plot all.vd8#branch vs D1v8
*plot all.vd7#branch vs D1v8
*save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
*op
*write test_nmos.raw
*.endc
"}
C {devices/code.sym} -410 -50 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_01v8/sky130_fd_pr__nfet_01v8__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_01v8_lvt/sky130_fd_pr__nfet_01v8_lvt__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8/sky130_fd_pr__pfet_01v8__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_03v3_nvt/sky130_fd_pr__nfet_03v3_nvt__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_05v0_nvt/sky130_fd_pr__nfet_05v0_nvt__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/esd_nfet_01v8/sky130_fd_pr__esd_nfet_01v8__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8_lvt/sky130_fd_pr__pfet_01v8_lvt__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8_hvt/sky130_fd_pr__pfet_01v8_hvt__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/esd_pfet_g5v0d10v5/sky130_fd_pr__esd_pfet_g5v0d10v5__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_g5v0d10v5/sky130_fd_pr__pfet_g5v0d10v5__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_g5v0d16v0/sky130_fd_pr__pfet_g5v0d16v0__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_g5v0d10v5/sky130_fd_pr__nfet_g5v0d10v5__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_g5v0d16v0/sky130_fd_pr__nfet_g5v0d16v0__tt_discrete.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/esd_nfet_g5v0d10v5/sky130_fd_pr__esd_nfet_g5v0d10v5__tt.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/models/corners/tt/nonfet.spice
* Mismatch parameters
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_01v8/sky130_fd_pr__nfet_01v8__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8/sky130_fd_pr__pfet_01v8__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_01v8_lvt/sky130_fd_pr__nfet_01v8_lvt__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8_lvt/sky130_fd_pr__pfet_01v8_lvt__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_01v8_hvt/sky130_fd_pr__pfet_01v8_hvt__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_g5v0d10v5/sky130_fd_pr__nfet_g5v0d10v5__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/pfet_g5v0d10v5/sky130_fd_pr__pfet_g5v0d10v5__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_05v0_nvt/sky130_fd_pr__nfet_05v0_nvt__mismatch.corner.spice
.include \\\\$::SKYWATER_MODELS\\\\/cells/nfet_03v3_nvt/sky130_fd_pr__nfet_03v3_nvt__mismatch.corner.spice
* Resistor\\\\$::SKYWATER_MODELS\\\\/Capacitor
.include \\\\$::SKYWATER_MODELS\\\\/models/r+c/res_typical__cap_typical.spice
.include \\\\$::SKYWATER_MODELS\\\\/models/r+c/res_typical__cap_typical__lin.spice
* Special cells
.include \\\\$::SKYWATER_MODELS\\\\/models/corners/tt/specialized_cells.spice
* All models
.include \\\\$::SKYWATER_MODELS\\\\/models/all.spice
* Corner
.include \\\\$::SKYWATER_MODELS\\\\/models/corners/tt/rf.spice
"}
