function dydt = three_link2(t, y)

global L1 L2 L3 dth1 dth2 dth3 g lz1 lz2 lz3 m1 m2 m3 r1 r2 r3 tau1 tau2 tau3 th1 th2 th3

th1 = y(1);
dth1 = y(2);
th2 = y(3);
dth2 = y(4);
th3 = y(5);
dth3 = y(6);

t2 = cos(th1);
t3 = cos(th2);
t4 = cos(th3);
t5 = sin(th2);
t6 = sin(th3);
t7 = lz1.*lz3;
t8 = lz2.*lz3;
t9 = th1+th2;
t10 = th2+th3;
t11 = L1.^2;
t12 = L2.^2;
t13 = L3.^2;
t14 = dth1.^2;
t15 = dth2.^2;
t16 = dth3.^2;
t17 = m2.^2;
t18 = m3.^2;
t19 = m3.^3;
t20 = r2.^2;
t21 = r3.^2;
t31 = -tau2;
t32 = -tau3;
t52 = L1.*lz3.*m1.*r1.*2.0;
t53 = L2.*lz3.*m2.*r2.*2.0;
t54 = L3.*lz1.*m3.*r3.*2.0;
t55 = L3.*lz2.*m3.*r3.*2.0;
t75 = L1.*L3.*m1.*m3.*r1.*r3.*4.0;
t76 = L2.*L3.*m2.*m3.*r2.*r3.*4.0;
t82 = L1.*L2.*lz3.*m1.*m2.*r1.*r2.*4.0;
t176 = L1.*L2.*L3.*m1.*m2.*m3.*r1.*r2.*r3.*8.0;
t22 = t3.^2;
t23 = t4.^2;
t24 = L2.*t5;
t25 = L2.*t6;
t26 = lz2.*t7;
t27 = cos(t9);
t28 = cos(t10);
t29 = sin(t10);
t30 = t9+th3;
t34 = m1.*r1.*t2;
t36 = m2.*r2.*t5;
t37 = L1.*m2.*t2;
t38 = L1.*m3.*t2;
t40 = L2.*lz3.*m3.*t3;
t43 = lz3.*m2.*r2.*t3;
t45 = lz3.*m1.*t11;
t46 = lz3.*m2.*t11;
t47 = lz3.*m3.*t11;
t48 = lz3.*m2.*t12;
t49 = lz1.*m3.*t13;
t50 = lz3.*m3.*t12;
t51 = lz2.*m3.*t13;
t56 = m1.*t8.*t11;
t57 = m2.*t8.*t11;
t58 = m2.*t7.*t12;
t59 = m3.*t8.*t11;
t60 = m3.*t7.*t12;
t62 = L1.*m1.*r1.*t8.*2.0;
t63 = L2.*m2.*r2.*t7.*2.0;
t64 = lz2.*t54;
t68 = L2.*lz1.*m3.*r3.*t4;
t83 = lz2.*t75;
t84 = lz1.*t76;
t85 = m2.*m3.*r2.*t3.*t13;
t93 = L3.*m2.*m3.*r2.*r3.*t3.*2.0;
t97 = m1.*m3.*t11.*t13;
t98 = m2.*m3.*t11.*t13;
t99 = m2.*m3.*t12.*t13;
t101 = L1.*m1.*m3.*r1.*t13.*2.0;
t102 = L3.*m1.*m3.*r3.*t11.*2.0;
t103 = L2.*m2.*m3.*r2.*t13.*2.0;
t104 = L3.*m2.*m3.*r3.*t11.*2.0;
t105 = L3.*m2.*m3.*r3.*t12.*2.0;
t107 = L2.*L3.*r3.*t3.*t18.*2.0;
t114 = m1.*t11.*t55;
t115 = m2.*t11.*t55;
t116 = m2.*t12.*t54;
t117 = L2.*m2.*m3.*r2.*r3.*t3.*t4;
t122 = L2.*m1.*m3.*r3.*t4.*t11;
t123 = L2.*m2.*m3.*r3.*t4.*t11;
t124 = t11.*t13.*t18;
t125 = t12.*t13.*t18;
t126 = L1.*L2.*m1.*m3.*r1.*r3.*t4.*2.0;
t128 = L3.*r3.*t11.*t18.*2.0;
t129 = L3.*r3.*t12.*t18.*2.0;
t134 = L2.*t3.*t13.*t18;
t140 = L2.*lz3.*r2.*t11.*t17.*2.0;
t149 = L3.*lz2.*m1.*m3.*r3.*t11.*-2.0;
t150 = L3.*lz1.*m2.*m3.*r3.*t12.*-2.0;
t158 = L2.*r3.*t4.*t11.*t18;
t162 = lz3.*t11.*t12.*t17;
t163 = lz3.*t11.*t12.*t18;
t173 = L1.*L2.*m1.*m2.*m3.*r1.*r2.*t13.*4.0;
t174 = m2.*t12.*t75;
t175 = m1.*t11.*t76;
t178 = r3.*t3.*t4.*t12.*t18;
t182 = t11.*t12.*t13.*t19;
t183 = L3.*r3.*t11.*t12.*t19.*2.0;
t192 = L1.*L3.*m1.*r1.*r3.*t12.*t18.*4.0;
t193 = L2.*L3.*m2.*r2.*r3.*t11.*t18.*4.0;
t194 = L2.*L3.*m3.*r2.*r3.*t11.*t17.*4.0;
t196 = L1.*L3.*m1.*m2.*m3.*r1.*r3.*t12.*-4.0;
t197 = L2.*L3.*m1.*m2.*m3.*r2.*r3.*t11.*-4.0;
t205 = m3.*t11.*t12.*t13.*t17;
t208 = L2.*m3.*r2.*t11.*t13.*t17.*2.0;
t210 = L3.*m3.*r3.*t11.*t12.*t17.*2.0;
t226 = L3.*m1.*r3.*t11.*t12.*t18.*-2.0;
t33 = m3.*t24;
t35 = cos(t30);
t39 = t28.^2;
t41 = L1.*t29;
t42 = L1.*t36;
t44 = r3.*t29;
t61 = lz2.*t49;
t65 = L1.*t40;
t66 = L2.*m3.*t27;
t67 = L1.*t43;
t69 = m2.*r2.*t27;
t73 = lz2.*m3.*r3.*t28;
t77 = -t45;
t78 = -t48;
t79 = -t49;
t80 = -t51;
t87 = m3.*r3.*t14.*t25;
t88 = m3.*r3.*t15.*t25;
t89 = m3.*r3.*t16.*t25;
t90 = dth1.*dth2.*m3.*r3.*t25.*2.0;
t91 = dth1.*dth3.*m3.*r3.*t25.*2.0;
t92 = dth2.*dth3.*m3.*r3.*t25.*2.0;
t94 = -t56;
t95 = -t58;
t108 = L1.*m1.*r1.*t48.*2.0;
t109 = L1.*m1.*r1.*t50.*2.0;
t110 = L1.*m1.*r1.*t51.*2.0;
t111 = L2.*m2.*r2.*t45.*2.0;
t112 = L2.*m2.*r2.*t49.*2.0;
t113 = L2.*m3.*r2.*t46.*2.0;
t121 = L1.*t85;
t127 = L1.*t93;
t130 = -t101;
t131 = -t102;
t132 = -t103;
t133 = -t105;
t135 = m2.*t12.*t45;
t136 = m3.*t12.*t45;
t137 = m1.*t11.*t51;
t138 = m2.*t11.*t51;
t139 = m2.*t12.*t49;
t141 = lz2.*t128;
t142 = lz1.*t129;
t143 = m2.*m3.*r3.*t12.*t28;
t151 = L2.*m2.*m3.*r2.*r3.*t28.*2.0;
t152 = -t85;
t154 = L1.*t134;
t155 = L1.*t107;
t157 = L1.*t117;
t160 = -t98;
t164 = lz2.*t124;
t165 = lz1.*t125;
t170 = -t122;
t171 = -t124;
t172 = -t125;
t177 = r3.*t12.*t18.*t28;
t179 = -t134;
t185 = L1.*t178;
t187 = L1.*L2.*m2.*m3.*r2.*r3.*t28.*-2.0;
t188 = m2.*t12.*t97;
t189 = L1.*m1.*r1.*t99.*2.0;
t190 = L2.*m2.*r2.*t97.*2.0;
t191 = m2.*t12.*t102;
t195 = -t173;
t198 = -t162;
t202 = m2.*m3.*r2.*r3.*t3.*t11.*t28;
t204 = m1.*t12.*t124;
t206 = L1.*m1.*r1.*t125.*2.0;
t207 = L2.*m2.*r2.*t124.*2.0;
t209 = m1.*t12.*t128;
t211 = L2.*t4.*t18.*t21.*t28;
t212 = t12.*t18.*t21.*t23;
t214 = L2.*r3.*t3.*t11.*t18.*t28;
t216 = t22.*t163;
t217 = -t182;
t219 = L2.*m3.*r2.*t22.*t46.*-2.0;
t220 = lz3.*t11.*t17.*t20.*t22;
t225 = -t208;
t227 = -t210;
t241 = t22.*t182;
t242 = t22.*t183;
t243 = t11.*t12.*t19.*t21.*t23;
t244 = t22.*t193;
t246 = L3.*m3.*r3.*t11.*t17.*t20.*t22.*2.0;
t247 = L3.*r3.*t11.*t12.*t19.*t22.*-2.0;
t251 = L2.*L3.*m2.*r2.*r3.*t11.*t18.*t22.*-4.0;
t253 = m3.*t11.*t13.*t17.*t20.*t22;
t267 = t3.*t4.*t11.*t12.*t19.*t21.*t28.*2.0;
t70 = m3.*t44;
t71 = g.*t66;
t72 = g.*t69;
t74 = m3.*r3.*t35;
t81 = L1.*t14.*t33;
t86 = t14.*t42;
t96 = -t61;
t100 = L1.*t73;
t118 = -t91;
t119 = -t92;
t120 = -t73;
t144 = m3.*r3.*t14.*t41;
t145 = -t108;
t146 = -t110;
t147 = -t111;
t148 = -t112;
t153 = -t89;
t156 = t25+t41;
t159 = t24+t44;
t166 = -t151;
t167 = L1.*t143;
t168 = L1.*t151;
t169 = -t121;
t180 = m3.*t12.*t77;
t181 = m2.*t11.*t80;
t184 = L1.*t177;
t186 = -t154;
t199 = -t164;
t200 = -t165;
t201 = t22.*t113;
t213 = -t177;
t215 = L1.*t211;
t221 = lz1.*t212;
t222 = -t188;
t223 = -t206;
t224 = -t207;
t228 = -t202;
t229 = t11.*t18.*t21.*t39;
t230 = -t211;
t231 = -t212;
t232 = -t214;
t235 = -t216;
t236 = -t220;
t245 = L1.*m1.*r1.*t212.*2.0;
t250 = t22.*t207;
t252 = m1.*t11.*t212;
t254 = m2.*t11.*t212;
t256 = -t246;
t258 = t11.*t12.*t19.*t21.*t39;
t259 = -t243;
t266 = m2.*r2.*t3.*t11.*t211.*2.0;
t106 = g.*t74;
t161 = -t100;
t203 = L1.*m3.*t159;
t218 = -t184;
t233 = -t215;
t234 = lz2.*t229;
t237 = -t221;
t238 = m3.*r3.*t16.*t156;
t239 = dth1.*dth3.*m3.*r3.*t156.*2.0;
t240 = dth2.*dth3.*m3.*r3.*t156.*2.0;
t248 = t33+t36+t70;
t249 = -t229;
t255 = -t245;
t260 = m2.*t12.*t229;
t261 = L2.*m2.*r2.*t229.*2.0;
t262 = m2.*t11.*t231;
t263 = -t258;
t270 = t34+t37+t38+t66+t69+t74;
t275 = t40+t43+t93+t107+t117+t120+t143+t152+t166+t178+t179+t213+t230;
t257 = -t234;
t264 = t42+t203;
t265 = -t261;
t268 = L1.*t15.*t248;
t269 = L1.*dth1.*dth2.*t248.*2.0;
t271 = g.*t270;
t273 = t32+t87+t88+t90+t106+t144;
t274 = t31+t71+t72+t81+t86+t106+t118+t119+t144+t153;
t277 = t8+t50+t53+t55+t65+t67+t76+t78+t80+t99+t127+t129+t132+t133+t155+t169+t172+t186+t231+t233;
t278 = t7+t46+t47+t52+t54+t65+t67+t68+t75+t77+t79+t97+t104+t123+t126+t127+t128+t130+t131+t155+t157+t158+t160+t161+t167+t169+t170+t171+t185+t186+t187+t218+t228+t232+t233+t249;
t272 = -t271;
t279 = t26+t57+t59+t60+t62+t63+t64+t82+t83+t84+t94+t95+t96+t109+t113+t115+t135+t137+t139+t140+t141+t142+t145+t146+t147+t148+t149+t150+t163+t176+t180+t181+t183+t189+t190+t191+t192+t193+t194+t195+t196+t197+t198+t199+t200+t204+t205+t217+t219+t222+t223+t224+t225+t226+t227+t235+t236+t237+t241+t247+t250+t251+t252+t253+t255+t256+t257+t259+t260+t262+t263+t265+t266+t267;
t276 = t238+t239+t240+t268+t269+t272+tau1;
t280 = 1.0./t279;
dydt = [dth1;t276.*t280.*(t8+t50+t53+t55+t76+t78+t80+t99+t129+t132+t133+t172+t231)+t274.*t277.*t280-L1.*t273.*t275.*t280;dth2;-t280.*(t71+t72+t106+t118+t119+t153-tau2+t14.*t264).*(t7+t8+t46+t47+t50+t52+t53+t54+t55+t65.*2.0+t67.*2.0+t75+t76+t77+t78+t79+t80+t97+t99+t104-t121.*2.0+t128+t129+t130+t131+t132+t133-t154.*2.0+t160+t171+t172-t215.*2.0+t231+t249+L1.*L2.*L3.*r3.*t3.*t18.*4.0+L1.*L3.*m2.*m3.*r2.*r3.*t3.*4.0)+t278.*t280.*(t32+t88+t90+t106+m3.*r3.*t14.*t156)-t277.*t280.*(t238+t239+t240+t272+tau1+t15.*t264+dth1.*dth2.*t264.*2.0);dth3;t274.*t278.*t280-t273.*t280.*(t7+t46+t47+t52+t54+t68.*2.0+t75+t77+t79+t97+t104-t122.*2.0+t123.*2.0+t128+t130+t131+t158.*2.0+t160+t171-t202.*2.0-t214.*2.0+t249+lz1.*lz2-lz2.*m1.*t11-lz1.*m2.*t12+lz2.*m2.*t11+lz1.*m3.*t12+lz2.*m3.*t11-t11.*t12.*t17+t11.*t12.*t18+L2.*r2.*t11.*t17.*2.0+m1.*m2.*t11.*t12-m1.*m3.*t11.*t12-t11.*t12.*t18.*t22-t11.*t17.*t20.*t22+L1.*lz2.*m1.*r1.*2.0+L2.*lz1.*m2.*r2.*2.0-L1.*m1.*m2.*r1.*t12.*2.0+L1.*m1.*m3.*r1.*t12.*2.0-L2.*m1.*m2.*r2.*t11.*2.0+L2.*m2.*m3.*r2.*t11.*2.0+L1.*L2.*m1.*m2.*r1.*r2.*4.0-L2.*m2.*m3.*r2.*t11.*t22.*2.0+L1.*L2.*m1.*m3.*r1.*r3.*t4.*4.0)+L1.*t275.*t276.*t280];