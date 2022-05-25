module bgr_top (
    input porst,
    output va, 
    output vb,
    output vbg
 );
    wire vc;
    // ============================= amp ===============================
    amplifier amp(
        .va(va),
        .vb(vb),
        .vc(vc)
    );
    // ======================== current_mirror ========================
    current_mirror CM(
        .va(va),
        .vb(vb),
        .vc(vc),
        .vbg(vbg)
    );
    // =================================set up ========================
    sky130_asc_nfet_01v8_lvt_9 M10(
        .GATE(porst),
        .SOURCE(VSS),
        .DRAIN(vc)
    );

    wire l17, l18, l19, l20;
    resistor R17 (
        .Rin(vbg),
        .Rout(l17)
    );
    resistor R18(
        .Rin(l17),
        .Rout(l18)
    );
    resistor R19(
        .Rin(l18),
        .Rout(l19)
    );
    resistor R20(
        .Rin(l19),
        .Rout(l20)
    );
    sky130_asc_res_xhigh_po_2p85_2 R21(
        .Rin(l20),
        .Rout(VSS)
    );
    // ===================================== module core =============================
    wire vbneg, l6, l7, l8, l10, l11;
    wire l1, l2, l4, l5, l12;
    cap_array C2 (
        .Cin(va),
        .Cout(VSS)
    );
    resistor R6 (
        .Rin(va),
        .Rout(l6)
    );
    resistor R7 (
        .Rin(l6),
        .Rout(l7)
    );
    resistor R8 (
        .Rin(l7),
        .Rout(l8)
    );
    resistor R10 (
        .Rin(l8),
        .Rout(l10)
    );
    resistor R11 (
        .Rin(l10),
        .Rout(l11)
    );
    sky130_asc_res_xhigh_po_2p85_2 R9 (
        .Rin(l11),
        .Rout(VSS)
    );
    sky130_asc_pnp_05v5_W3p40L3p40_1 pnp_va (
        .Emitter(va),
        .Base(VSS),
        .Collector(VSS)
    );
    resistor R3 (
        .Rin(vb),
        .Rout(vbneg)
    );
    pnp_array pnp_vb (
        .Emitter(vbneg),
        .Collector(VSS),
        .Base(VSS)
    );

    resistor R1 (
        .Rin(l1),
        .Rout(vb)
    );
    resistor R2 (
        .Rin(l1),
        .Rout(l2)
    );
    resistor R4 (
        .Rin(l2),
        .Rout(l4)
    );
    resistor R5 (
        .Rin(l4),
        .Rout(l5)
    );
    resistor R12 (
        .Rin(l5),
        .Rout(l12)
    );
    sky130_asc_res_xhigh_po_2p85_2 R13 (
        .Rin(l12),
        .Rout(VSS)
    );
endmodule

// ============================================ module amplifier =====================================
module amplifier (
    output va,
    output vb,
    output vc
 );
    wire vg, vq, vx;
    sky130_asc_pfet_01v8_lvt_6 M4 (
        .GATE(vg),
        .SOURCE(VDD),
        .DRAIN(vg)
    );

    sky130_asc_pfet_01v8_lvt_6 M8 (
        .GATE(vg),
        .SOURCE(VDD),
        .DRAIN(vc)
    );

    sky130_asc_nfet_01v8_lvt_9 M9 (
        .GATE(vb),
        .SOURCE(vq),
        .DRAIN(vg)
    );

    sky130_asc_nfet_01v8_lvt_9 M5 (
        .GATE(va),
        .SOURCE(vq),
        .DRAIN(vc)
    );

    sky130_asc_nfet_01v8_lvt_1 M6 (
        .GATE(vx),
        .SOURCE(VSS),
        .DRAIN(vq)
    );

    sky130_asc_nfet_01v8_lvt_1 M7 (
        .GATE(vx),
        .SOURCE(VSS),
        .DRAIN(vx)
    );

    sky130_asc_pfet_01v8_lvt_12 M13 (
        .GATE(vc),
        .SOURCE(VDD),
        .DRAIN(vx)
    );
endmodule


module resistor (
    input Rin,
    output Rout
);
    wire l;
    sky130_asc_res_xhigh_po_2p85_1 sub1(
        .Rin(Rin),
        .Rout(l)
    );
    sky130_asc_res_xhigh_po_2p85_1 sub2(
        .Rin(l),
        .Rout(Rout)
    );
endmodule

module cap_array(
    input Cin,
    output Cout
);
    sky130_asc_cap_mim_m3_1 CA1 (
        .Cin(Cin),
        .Cout(Cout)
    );
    sky130_asc_cap_mim_m3_1 CA2 (
        .Cin(Cin),
        .Cout(Cout)
    );
    sky130_asc_cap_mim_m3_1 CA3 (
        .Cin(Cin),
        .Cout(Cout)
    );
    sky130_asc_cap_mim_m3_1 CA4 (
        .Cin(Cin),
        .Cout(Cout)
    );
    sky130_asc_cap_mim_m3_1 CA5 (
        .Cin(Cin),
        .Cout(Cout)
    );
endmodule

module pnp_array (
    input Emitter,
    input Base,
    output Collector
 );
 sky130_asc_pnp_05v5_W3p40L3p40_8 PA1(
     .Emitter(Emitter),
     .Collector(Collector),
     .Base(Base)
 );
 sky130_asc_pnp_05v5_W3p40L3p40_8 PA2(
     .Emitter(Emitter),
     .Collector(Collector),
     .Base(Base)
 );
 sky130_asc_pnp_05v5_W3p40L3p40_8 PA3(
     .Emitter(Emitter),
     .Collector(Collector),
     .Base(Base)
 );
 sky130_asc_pnp_05v5_W3p40L3p40_8 PA4(
     .Emitter(Emitter),
     .Collector(Collector),
     .Base(Base)
 );
 sky130_asc_pnp_05v5_W3p40L3p40_7 PA5(
     .Emitter(Emitter),
     .Collector(Collector),
     .Base(Base)
 );
endmodule

// ============================================== current mirror =================================
module current_mirror (
    input va,
    input vb,
    input vc,
    output vbg
 );
    cap_array C1 (
        .Cin(VDD),
        .Cout(vc)
    );
    sky130_asc_pfet_01v8_lvt_12 M17 (
        .GATE(VDD),
        .SOURCE(VDD),
        .DRAIN(va)
    );
    sky130_asc_pfet_01v8_lvt_60 M1 (
        .GATE(vc),
        .SOURCE(VDD),
        .DRAIN(va)
    );
    sky130_asc_pfet_01v8_lvt_60 M2 (
        .GATE(vc),
        .SOURCE(VDD),
        .DRAIN(vb)
    );
    sky130_asc_pfet_01v8_lvt_60 M3 (
        .GATE(vc),
        .SOURCE(VDD),
        .DRAIN(vbg)
    );
endmodule