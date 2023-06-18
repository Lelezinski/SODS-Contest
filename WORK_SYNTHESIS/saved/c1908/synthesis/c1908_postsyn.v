/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Sun Jun 18 03:03:16 2023
/////////////////////////////////////////////////////////////


module c1908 ( N1, N4, N7, N10, N13, N16, N19, N22, N25, N28, N31, N34, N37, 
        N40, N43, N46, N49, N53, N56, N60, N63, N66, N69, N72, N76, N79, N82, 
        N85, N88, N91, N94, N99, N104, N2753, N2754, N2755, N2756, N2762, 
        N2767, N2768, N2779, N2780, N2781, N2782, N2783, N2784, N2785, N2786, 
        N2787, N2811, N2886, N2887, N2888, N2889, N2890, N2891, N2892, N2899
 );
  input N1, N4, N7, N10, N13, N16, N19, N22, N25, N28, N31, N34, N37, N40, N43,
         N46, N49, N53, N56, N60, N63, N66, N69, N72, N76, N79, N82, N85, N88,
         N91, N94, N99, N104;
  output N2753, N2754, N2755, N2756, N2762, N2767, N2768, N2779, N2780, N2781,
         N2782, N2783, N2784, N2785, N2786, N2787, N2811, N2886, N2887, N2888,
         N2889, N2890, N2891, N2892, N2899;
  wire   n221, n1, n4, n5, n6, n7, n8, n10, n11, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32, n33, n34,
         n35, n38, n39, n40, n41, n42, n44, n45, n47, n48, n49, n50, n52, n54,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n66, n68, n69, n70, n71,
         n73, n75, n76, n77, n80, n82, n83, n84, n85, n87, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n101, n102, n103, n105, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n118, n119, n126, n128, n129,
         n130, n131, n132, n133, n134, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n149, n151, n152, n153, net1364,
         net1371, net1370, net1422, net1429, net1428, net1452, net1582,
         net1637, net1653, net1656, net1665, net1667, net1721, net1657,
         net1406, net1405, n36, n106, n104, n100, net1557, n86, n117, net1419,
         n37, n127, n125, n74, n55, n53, n2, net1579, net1578, n81, n79, n78,
         n46, n29, n116, n72, n123, n121, n120, n124, n172, n177, n178, n179,
         n182, n183, n186, n187, n188, n189, n190, n191, n192, n194, n195,
         n196, n197, n198, n199, n213, n214, n215, n216, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240;
  assign N2811 = n221;
  assign N2787 = net1637;

  HS65_LS_XOR3X18 U5 ( .A(n26), .B(n27), .C(n28), .Z(N2892) );
  HS65_LS_XOR3X18 U135 ( .A(n139), .B(n140), .C(n141), .Z(n59) );
  HS65_LS_IVX9 U181 ( .A(net1667), .Z(net1452) );
  HS65_LS_XOR2X18 U183 ( .A(n124), .B(n172), .Z(n32) );
  HS65_LS_XOR3X9 U184 ( .A(N37), .B(N34), .C(N31), .Z(n172) );
  HS65_LS_NAND2X7 U185 ( .A(n93), .B(n178), .Z(n38) );
  HS65_LS_NAND3AX6 U186 ( .A(n5), .B(n178), .C(n106), .Z(n44) );
  HS65_LS_NOR2X6 U187 ( .A(n102), .B(n101), .Z(n105) );
  HS65_LS_NOR2X19 U188 ( .A(n192), .B(n102), .Z(n82) );
  HS65_LS_XNOR2X18 U195 ( .A(N1), .B(n45), .Z(N2753) );
  HS65_LS_XNOR2X18 U196 ( .A(N7), .B(net1657), .Z(N2755) );
  HS65_LS_NAND4ABX13 U198 ( .A(n92), .B(n5), .C(n103), .D(n100), .Z(n23) );
  HS65_LS_OR3X4 U200 ( .A(n74), .B(n20), .C(n18), .Z(net1656) );
  HS65_LS_AND2X35 U201 ( .A(n29), .B(n36), .Z(n74) );
  HS65_LS_NOR2AX3 U202 ( .A(n95), .B(n87), .Z(n177) );
  HS65_LS_NOR2AX13 U203 ( .A(n95), .B(n87), .Z(n90) );
  HS65_LS_NAND3AX19 U205 ( .A(N79), .B(n20), .C(n133), .Z(n134) );
  HS65_LS_AND2X18 U206 ( .A(n95), .B(n104), .Z(n106) );
  HS65_LS_NAND2X11 U208 ( .A(n82), .B(net1653), .Z(n39) );
  HS65_LS_IVX7 U211 ( .A(n178), .Z(n179) );
  HS65_LS_NAND2X11 U212 ( .A(n92), .B(n103), .Z(n84) );
  HS65_LS_CBI4I1X11 U213 ( .A(n59), .B(n20), .C(n60), .D(n138), .Z(n102) );
  HS65_LS_NAND2X7 U215 ( .A(n187), .B(N43), .Z(n190) );
  HS65_LS_NAND2X14 U218 ( .A(n237), .B(n66), .Z(n149) );
  HS65_LSS_XNOR2X6 U220 ( .A(N16), .B(n216), .Z(n182) );
  HS65_LSS_XNOR2X6 U221 ( .A(n183), .B(n214), .Z(n145) );
  HS65_LS_IVX9 U222 ( .A(n182), .Z(n183) );
  HS65_LSS_XOR3X4 U223 ( .A(N7), .B(N43), .C(N34), .Z(n214) );
  HS65_LS_IVX9 U224 ( .A(n145), .Z(n11) );
  HS65_LS_NAND2X11 U231 ( .A(n190), .B(n191), .Z(n124) );
  HS65_LS_NOR3AX4 U232 ( .A(n94), .B(net1452), .C(n97), .Z(n111) );
  HS65_LS_XNOR2X18 U234 ( .A(N46), .B(N28), .Z(n187) );
  HS65_LS_CBI4I1X11 U235 ( .A(n66), .B(n20), .C(n18), .D(n149), .Z(n103) );
  HS65_LS_CBI4I1X5 U239 ( .A(n136), .B(N53), .C(N43), .D(n153), .Z(n152) );
  HS65_LS_IVX18 U240 ( .A(N94), .Z(n20) );
  HS65_LS_NOR2AX6 U242 ( .A(n40), .B(n49), .Z(n78) );
  HS65_LS_AND3X9 U244 ( .A(n82), .B(n178), .C(n81), .Z(n49) );
  HS65_LS_AND2ABX27 U245 ( .A(n50), .B(n198), .Z(N2887) );
  HS65_LS_NAND2X7 U250 ( .A(n188), .B(n189), .Z(n191) );
  HS65_LS_IVX2 U251 ( .A(N43), .Z(n189) );
  HS65_LS_NAND2X2 U252 ( .A(N49), .B(n119), .Z(n73) );
  HS65_LS_XOR2X35 U253 ( .A(n37), .B(n121), .Z(n72) );
  HS65_LS_XOR2X18 U254 ( .A(n126), .B(net1419), .Z(n37) );
  HS65_LS_AND4X13 U258 ( .A(n78), .B(net1579), .C(net1578), .D(n79), .Z(n29)
         );
  HS65_LS_NAND2X5 U259 ( .A(n93), .B(n83), .Z(n40) );
  HS65_LS_IVX9 U260 ( .A(n47), .Z(net1579) );
  HS65_LS_IVX9 U262 ( .A(n48), .Z(net1578) );
  HS65_LS_AND3X9 U263 ( .A(n82), .B(n83), .C(n81), .Z(n48) );
  HS65_LS_NOR4ABX9 U264 ( .A(n38), .B(n39), .C(n22), .D(n46), .Z(n79) );
  HS65_LS_AND3X18 U265 ( .A(n178), .B(n4), .C(n85), .Z(n22) );
  HS65_LS_NOR3AX4 U266 ( .A(n81), .B(n84), .C(n6), .Z(n46) );
  HS65_LS_XNOR2X4 U268 ( .A(n46), .B(N40), .Z(net1665) );
  HS65_LS_NAND2X2 U270 ( .A(N53), .B(n119), .Z(n117) );
  HS65_LS_NOR3AX2 U272 ( .A(n109), .B(net1452), .C(n116), .Z(n75) );
  HS65_LS_AND2ABX9 U274 ( .A(net1721), .B(N99), .Z(n50) );
  HS65_LS_CBI4I6X18 U277 ( .A(n17), .B(n2), .C(n54), .D(n55), .Z(n53) );
  HS65_LS_IVX9 U278 ( .A(N79), .Z(n17) );
  HS65_LS_XOR2X35 U280 ( .A(n126), .B(n32), .Z(n54) );
  HS65_LS_NOR3AX18 U281 ( .A(N79), .B(n54), .C(n2), .Z(n55) );
  HS65_LS_IVX2 U282 ( .A(n74), .Z(net1370) );
  HS65_LS_AND2X18 U286 ( .A(n102), .B(n101), .Z(n80) );
  HS65_LS_XOR2X18 U288 ( .A(N40), .B(N10), .Z(n131) );
  HS65_LS_NAND3X6 U292 ( .A(n83), .B(n100), .C(n82), .Z(n25) );
  HS65_LS_IVX9 U293 ( .A(N85), .Z(n19) );
  HS65_LS_NOR2X13 U294 ( .A(n103), .B(n92), .Z(n83) );
  HS65_LS_IVX9 U296 ( .A(n213), .Z(n141) );
  HS65_LS_IVX9 U297 ( .A(N66), .Z(n14) );
  HS65_LS_NAND2X7 U298 ( .A(n45), .B(n44), .Z(net1405) );
  HS65_LS_XOR2X18 U300 ( .A(n127), .B(n125), .Z(net1419) );
  HS65_LSS_XNOR2X3 U301 ( .A(N10), .B(N22), .Z(n127) );
  HS65_LS_XOR3X18 U302 ( .A(N1), .B(N7), .C(n10), .Z(n125) );
  HS65_LS_OAI21X2 U303 ( .A(N88), .B(net1721), .C(n37), .Z(n33) );
  HS65_LS_IVX9 U304 ( .A(N4), .Z(n10) );
  HS65_LS_XOR2X9 U305 ( .A(n125), .B(n130), .Z(net1422) );
  HS65_LS_IVX9 U306 ( .A(n117), .Z(net1557) );
  HS65_LS_NAND4X27 U309 ( .A(n25), .B(n24), .C(n41), .D(n23), .Z(net1406) );
  HS65_LS_NAND3X6 U310 ( .A(n100), .B(n80), .C(n7), .Z(n24) );
  HS65_LS_NAND3X6 U311 ( .A(n100), .B(n178), .C(n82), .Z(n41) );
  HS65_LS_NOR2X2 U312 ( .A(n36), .B(N104), .Z(n34) );
  HS65_LS_CBI4I1X21 U314 ( .A(net1364), .B(n20), .C(n17), .D(n134), .Z(n101)
         );
  HS65_LS_NAND3X2 U315 ( .A(N104), .B(n107), .C(N94), .Z(n96) );
  HS65_LS_NOR2X13 U318 ( .A(N104), .B(N72), .Z(n136) );
  HS65_LS_IVX2 U319 ( .A(N104), .Z(n21) );
  HS65_LS_NOR3X7 U322 ( .A(n6), .B(n87), .C(net1452), .Z(n85) );
  HS65_LS_AND2X9 U323 ( .A(n118), .B(n108), .Z(net1667) );
  HS65_LSS_XOR2X6 U325 ( .A(N13), .B(n41), .Z(n196) );
  HS65_LSS_XOR2X3 U326 ( .A(N4), .B(n44), .Z(n197) );
  HS65_LS_AND2X18 U328 ( .A(n177), .B(n91), .Z(net1653) );
  HS65_LS_IVX18 U330 ( .A(net1665), .Z(net1637) );
  HS65_LS_IVX18 U331 ( .A(n194), .Z(N2786) );
  HS65_LS_XNOR2X18 U332 ( .A(N16), .B(n25), .Z(N2780) );
  HS65_LS_IVX18 U334 ( .A(n240), .Z(N2768) );
  HS65_LS_IVX18 U336 ( .A(n238), .Z(N2781) );
  HS65_LS_IVX18 U337 ( .A(n195), .Z(N2782) );
  HS65_LS_IVX18 U339 ( .A(n239), .Z(N2762) );
  HS65_LS_IVX18 U340 ( .A(n196), .Z(N2779) );
  HS65_LS_IVX18 U342 ( .A(n222), .Z(N2767) );
  HS65_LS_IVX18 U343 ( .A(n197), .Z(N2754) );
  HS65_LS_IVX18 U344 ( .A(n186), .Z(N2783) );
  HS65_LS_XNOR2X4 U345 ( .A(n31), .B(n32), .Z(n30) );
  HS65_LS_NAND2AX7 U346 ( .A(n60), .B(n56), .Z(n58) );
  HS65_LS_NAND3X13 U348 ( .A(n16), .B(n20), .C(n69), .Z(n129) );
  HS65_LS_CB4I1X18 U353 ( .A(n62), .B(n20), .C(n19), .D(n143), .Z(n92) );
  HS65_LS_NAND2X14 U354 ( .A(n8), .B(n92), .Z(n115) );
  HS65_LS_AND3ABCX9 U355 ( .A(n115), .B(n5), .C(n97), .Z(n109) );
  HS65_LS_XOR2X18 U358 ( .A(n52), .B(n54), .Z(net1364) );
  HS65_LS_OAI32X9 U360 ( .A(n144), .B(N104), .C(n145), .D(n146), .E(n11), .Z(
        n62) );
  HS65_LS_XOR2X9 U361 ( .A(n62), .B(n63), .Z(n61) );
  HS65_LS_XOR3X4 U365 ( .A(N37), .B(N19), .C(N28), .Z(n139) );
  HS65_LS_NOR2X25 U367 ( .A(n50), .B(n61), .Z(N2889) );
  HS65_LS_NOR2X25 U368 ( .A(n50), .B(n70), .Z(N2886) );
  HS65_LS_NOR2X25 U369 ( .A(n50), .B(n57), .Z(N2890) );
  HS65_LS_NOR2X38 U370 ( .A(n50), .B(n64), .Z(N2888) );
  HS65_LS_XOR2X18 U371 ( .A(n66), .B(net1656), .Z(n64) );
  HS65_LS_XOR2X18 U372 ( .A(net1422), .B(n32), .Z(n69) );
  HS65_LSS_XOR2X6 U373 ( .A(n35), .B(n33), .Z(n215) );
  HS65_LS_XOR2X18 U374 ( .A(n215), .B(n34), .Z(N2891) );
  HS65_LS_IVX9 U375 ( .A(net1428), .Z(net1429) );
  HS65_LS_NAND2X7 U376 ( .A(N56), .B(n128), .Z(n60) );
  HS65_LS_IVX2 U377 ( .A(n111), .Z(n1) );
  HS65_LS_NAND2X2 U378 ( .A(N69), .B(N56), .Z(n144) );
  HS65_LS_AO12X4 U379 ( .A(N63), .B(N88), .C(net1721), .Z(n35) );
  HS65_LS_OAI12X2 U380 ( .A(N91), .B(net1721), .C(n30), .Z(n26) );
  HS65_LS_AO12X4 U381 ( .A(N66), .B(N91), .C(net1721), .Z(n28) );
  HS65_LS_NAND2X2 U383 ( .A(N69), .B(n20), .Z(n128) );
  HS65_LS_NAND2X2 U384 ( .A(N72), .B(N69), .Z(n107) );
  HS65_LS_NAND2X2 U385 ( .A(N60), .B(n128), .Z(n118) );
  HS65_LS_OR2X4 U386 ( .A(N72), .B(N94), .Z(n119) );
  HS65_LS_AO33X4 U388 ( .A(n111), .B(n7), .C(n89), .D(n111), .E(n105), .F(n83), 
        .Z(n110) );
  HS65_LS_OAI311X2 U389 ( .A(n1), .B(n179), .C(n5), .D(n112), .E(n113), .Z(n76) );
  HS65_LS_XOR2X18 U391 ( .A(N34), .B(n48), .Z(N2785) );
  HS65_LS_XOR2X18 U392 ( .A(N31), .B(n49), .Z(N2784) );
  HS65_LS_XNOR2X18 U393 ( .A(N10), .B(n42), .Z(N2756) );
  HS65_LS_NOR3AX2 U394 ( .A(N56), .B(n15), .C(N104), .Z(n146) );
  HS65_LS_IVX9 U395 ( .A(N82), .Z(n18) );
  HS65_LS_IVX9 U396 ( .A(N69), .Z(n15) );
  HS65_LS_CB4I1X18 U397 ( .A(n69), .B(n20), .C(n16), .D(n129), .Z(n108) );
  HS65_LS_IVX9 U398 ( .A(N76), .Z(n16) );
  HS65_LS_OA12X9 U399 ( .A(N91), .B(n96), .C(n97), .Z(n87) );
  HS65_LS_IVX9 U400 ( .A(net1370), .Z(net1371) );
  HS65_LS_AOI311X2 U401 ( .A(net1667), .B(n4), .C(n109), .D(N104), .E(n114), 
        .Z(n113) );
  HS65_LS_AOI13X2 U402 ( .A(n94), .B(n108), .C(n109), .D(n110), .Z(n77) );
  HS65_LS_NOR4ABX2 U403 ( .A(n94), .B(n105), .C(net1452), .D(n115), .Z(n114)
         );
  HS65_LS_AOI33X2 U404 ( .A(n94), .B(n95), .C(n109), .D(n82), .E(n7), .F(n111), 
        .Z(n112) );
  HS65_LS_XOR2X9 U363 ( .A(N10), .B(n142), .Z(n140) );
  HS65_LS_NOR4ABX13 U193 ( .A(net1657), .B(n42), .C(net1405), .D(net1406), .Z(
        n36) );
  HS65_LS_NAND2AX7 U230 ( .A(n6), .B(n106), .Z(net1428) );
  HS65_LS_CBI4I6X9 U357 ( .A(N104), .B(n14), .C(n131), .D(n132), .Z(n130) );
  HS65_LS_CBI4I1X5 U276 ( .A(n136), .B(N49), .C(N1), .D(n137), .Z(n52) );
  HS65_LS_NAND2AX7 U390 ( .A(n73), .B(n56), .Z(n71) );
  HS65_LS_IVX9 U216 ( .A(n187), .Z(n188) );
  HS65_LSS_XOR2X6 U290 ( .A(N40), .B(N25), .Z(n31) );
  HS65_LS_NAND2X7 U256 ( .A(N63), .B(net1721), .Z(n123) );
  HS65_LSS_XNOR2X3 U190 ( .A(N46), .B(n31), .Z(n213) );
  HS65_LS_NOR3AX4 U364 ( .A(N60), .B(N104), .C(n15), .Z(n142) );
  HS65_LS_NAND3X3 U180 ( .A(N43), .B(N53), .C(n136), .Z(n153) );
  HS65_LSS_XOR3X2 U238 ( .A(N22), .B(n10), .C(N31), .Z(n151) );
  HS65_LS_NAND3X2 U382 ( .A(N1), .B(N49), .C(n136), .Z(n137) );
  HS65_LS_XOR2X9 U237 ( .A(n151), .B(n141), .Z(n199) );
  HS65_LS_NAND3X5 U316 ( .A(n107), .B(net1721), .C(N99), .Z(n97) );
  HS65_LS_NAND3AX6 U329 ( .A(N85), .B(n20), .C(n62), .Z(n143) );
  HS65_LS_IVX9 U313 ( .A(n102), .Z(net1582) );
  HS65_LS_CBI4I6X9 U307 ( .A(n96), .B(N88), .C(n97), .D(n86), .Z(n104) );
  HS65_LS_NOR2AX13 U269 ( .A(n117), .B(n116), .Z(n94) );
  HS65_LS_IVX18 U241 ( .A(n103), .Z(n8) );
  HS65_LS_NOR3X7 U179 ( .A(n223), .B(n92), .C(n8), .Z(n91) );
  HS65_LS_AND2X18 U182 ( .A(n104), .B(net1667), .Z(n100) );
  HS65_LS_IVX9 U284 ( .A(n105), .Z(n5) );
  HS65_LS_IVX18 U351 ( .A(n115), .Z(n7) );
  HS65_LS_NAND3X5 U291 ( .A(n82), .B(n7), .C(n106), .Z(n45) );
  HS65_LS_AND3X9 U261 ( .A(n7), .B(n80), .C(n81), .Z(n47) );
  HS65_LS_NAND2X7 U194 ( .A(net1429), .B(n7), .Z(n42) );
  HS65_LS_NAND4X18 U229 ( .A(n106), .B(n83), .C(net1582), .D(n192), .Z(net1657) );
  HS65_LS_IVX31 U279 ( .A(n56), .Z(n2) );
  HS65_LS_NAND2X5 U362 ( .A(n56), .B(N85), .Z(n63) );
  HS65_LS_NAND2X7 U352 ( .A(N76), .B(n56), .Z(n68) );
  HS65_LS_NOR2X5 U209 ( .A(n29), .B(N104), .Z(n27) );
  HS65_LSS_XOR2X6 U347 ( .A(n58), .B(n59), .Z(n57) );
  HS65_LS_XOR2X9 U327 ( .A(n69), .B(n68), .Z(n198) );
  HS65_LSS_XNOR2X3 U283 ( .A(N37), .B(n47), .Z(n194) );
  HS65_LSS_XNOR2X3 U246 ( .A(N25), .B(n22), .Z(n186) );
  HS65_LSS_XOR2X6 U257 ( .A(n72), .B(n71), .Z(n70) );
  HS65_LS_NOR3X4 U285 ( .A(n14), .B(N104), .C(n131), .Z(n132) );
  HS65_LS_BFX9 U255 ( .A(n21), .Z(net1721) );
  HS65_LS_NAND3X6 U214 ( .A(n60), .B(n20), .C(n59), .Z(n138) );
  HS65_LS_NAND2X7 U226 ( .A(n236), .B(n72), .Z(n120) );
  HS65_LS_IVX9 U189 ( .A(n101), .Z(n192) );
  HS65_LS_IVX9 U197 ( .A(net1582), .Z(n226) );
  HS65_LS_BFX18 U199 ( .A(n86), .Z(n223) );
  HS65_LS_NAND2AX21 U210 ( .A(net1557), .B(n116), .Z(n86) );
  HS65_LS_NAND2X21 U217 ( .A(n120), .B(n228), .Z(n116) );
  HS65_LS_IVX7 U219 ( .A(n52), .Z(n227) );
  HS65_LS_NAND2AX14 U225 ( .A(n73), .B(n229), .Z(n228) );
  HS65_LS_NAND2AX14 U227 ( .A(N94), .B(n72), .Z(n229) );
  HS65_LS_XNOR2X18 U228 ( .A(n232), .B(n53), .Z(n231) );
  HS65_LS_IVX2 U233 ( .A(n52), .Z(n232) );
  HS65_LS_IVX2 U236 ( .A(n6), .Z(n89) );
  HS65_LS_IVX18 U243 ( .A(n84), .Z(n178) );
  HS65_LS_NOR2X13 U247 ( .A(n235), .B(n233), .Z(n81) );
  HS65_LS_IVX4 U248 ( .A(n95), .Z(n235) );
  HS65_LS_NAND2AX14 U249 ( .A(n101), .B(n226), .Z(n6) );
  HS65_LS_IVX7 U267 ( .A(n87), .Z(n234) );
  HS65_LSS_XNOR2X12 U271 ( .A(n199), .B(n230), .Z(n66) );
  HS65_LS_XNOR2X9 U273 ( .A(N13), .B(n152), .Z(n230) );
  HS65_LS_MUX21I1X12 U275 ( .D0(n123), .D1(n225), .S0(n224), .Z(n121) );
  HS65_LS_NAND2X5 U287 ( .A(N63), .B(net1721), .Z(n225) );
  HS65_LS_IVX13 U289 ( .A(n223), .Z(n4) );
  HS65_LSS_XOR2X3 U295 ( .A(N22), .B(n23), .Z(n195) );
  HS65_LSS_XOR2X3 U299 ( .A(N43), .B(n39), .Z(n222) );
  HS65_LS_XNOR2X18 U308 ( .A(N25), .B(n124), .Z(n224) );
  HS65_LSS_XNOR2X18 U317 ( .A(n227), .B(n54), .Z(n133) );
  HS65_LS_NOR2X50 U320 ( .A(n50), .B(n231), .Z(N2899) );
  HS65_LS_NAND2X14 U321 ( .A(n234), .B(n94), .Z(n233) );
  HS65_LS_NOR2X50 U324 ( .A(n20), .B(n74), .Z(n56) );
  HS65_LS_AND2X4 U335 ( .A(n20), .B(n73), .Z(n236) );
  HS65_LS_AND2X4 U338 ( .A(n18), .B(n20), .Z(n237) );
  HS65_LSS_XNOR3X4 U341 ( .A(N19), .B(N16), .C(N13), .Z(n126) );
  HS65_LSS_XOR2X3 U349 ( .A(N19), .B(n24), .Z(n238) );
  HS65_LS_XOR2X4 U356 ( .A(N28), .B(n40), .Z(n239) );
  HS65_LS_NAND4ABX25 U359 ( .A(n75), .B(n76), .C(n77), .D(net1371), .Z(n221)
         );
  HS65_LS_NOR2AX19 U204 ( .A(n118), .B(n108), .Z(n95) );
  HS65_LSS_XNOR2X6 U207 ( .A(N28), .B(N22), .Z(n216) );
  HS65_LS_AND3X27 U191 ( .A(n90), .B(n4), .C(n80), .Z(n93) );
  HS65_LSS_XOR2X3 U192 ( .A(N46), .B(n38), .Z(n240) );
endmodule

