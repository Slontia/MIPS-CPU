/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Projects/ISE/mips2/cpu.v";
static int ng1[] = {0, 0};
static int ng2[] = {12, 0};
static int ng3[] = {8, 0};



static void Cont_32_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 8068U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 6900);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 9356);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 9272);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_33_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 8212U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 6992);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 9392);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 9280);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_38_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 8356U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9428);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 63U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 5);

LAB1:    return;
}

static void Cont_48_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t20[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    t1 = (t0 + 8500U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1704U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t21 = *((unsigned int *)t4);
    t22 = (~(t21));
    t23 = *((unsigned int *)t12);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t29, 8);

LAB16:    t30 = (t0 + 9464);
    t31 = (t30 + 32U);
    t32 = *((char **)t31);
    t33 = (t32 + 40U);
    t34 = *((char **)t33);
    memcpy(t34, t3, 8);
    xsi_driver_vfirst_trans(t30, 0, 31);
    t35 = (t0 + 9288);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 6808);
    t17 = (t16 + 36U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng2)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_minus(t20, 32, t18, 32, t19, 32);
    goto LAB9;

LAB10:    t25 = (t0 + 6808);
    t26 = (t25 + 36U);
    t27 = *((char **)t26);
    t28 = ((char*)((ng3)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 32, t27, 32, t28, 32);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t20, 32, t29, 32);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

}

static void Cont_61_4(char *t0)
{
    char t4[8];
    char t18[8];
    char t25[8];
    char t53[8];
    char t67[8];
    char t74[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    int t98;
    int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;

LAB0:    t1 = (t0 + 8644U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (!(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    memcpy(t25, t4, 8);

LAB10:    memset(t53, 0, 8);
    t54 = (t25 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t25);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t54) != 0)
        goto LAB20;

LAB21:    t61 = (t53 + 4);
    t62 = *((unsigned int *)t53);
    t63 = *((unsigned int *)t61);
    t64 = (t62 || t63);
    if (t64 > 0)
        goto LAB22;

LAB23:    memcpy(t74, t53, 8);

LAB24:    t106 = (t0 + 9500);
    t107 = (t106 + 32U);
    t108 = *((char **)t107);
    t109 = (t108 + 40U);
    t110 = *((char **)t109);
    memset(t110, 0, 8);
    t111 = 1U;
    t112 = t111;
    t113 = (t74 + 4);
    t114 = *((unsigned int *)t74);
    t111 = (t111 & t114);
    t115 = *((unsigned int *)t113);
    t112 = (t112 & t115);
    t116 = (t110 + 4);
    t117 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t117 | t111);
    t118 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t118 | t112);
    xsi_driver_vfirst_trans(t106, 0, 0);
    t119 = (t0 + 9296);
    *((int *)t119) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1980U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t16 = (t17 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (~(t19));
    t21 = *((unsigned int *)t17);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t16) != 0)
        goto LAB13;

LAB14:    t26 = *((unsigned int *)t4);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = (t4 + 4);
    t30 = (t18 + 4);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t29);
    t33 = *((unsigned int *)t30);
    t34 = (t32 | t33);
    *((unsigned int *)t31) = t34;
    t35 = *((unsigned int *)t31);
    t36 = (t35 != 0);
    if (t36 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t18) = 1;
    goto LAB14;

LAB13:    t24 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB14;

LAB15:    t37 = *((unsigned int *)t25);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t25) = (t37 | t38);
    t39 = (t4 + 4);
    t40 = (t18 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (~(t41));
    t43 = *((unsigned int *)t4);
    t44 = (t43 & t42);
    t45 = *((unsigned int *)t40);
    t46 = (~(t45));
    t47 = *((unsigned int *)t18);
    t48 = (t47 & t46);
    t49 = (~(t44));
    t50 = (~(t48));
    t51 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t51 & t49);
    t52 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t52 & t50);
    goto LAB17;

LAB18:    *((unsigned int *)t53) = 1;
    goto LAB21;

LAB20:    t60 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB21;

LAB22:    t65 = (t0 + 1336U);
    t66 = *((char **)t65);
    memset(t67, 0, 8);
    t65 = (t66 + 4);
    t68 = *((unsigned int *)t65);
    t69 = (~(t68));
    t70 = *((unsigned int *)t66);
    t71 = (t70 & t69);
    t72 = (t71 & 1U);
    if (t72 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t65) != 0)
        goto LAB27;

LAB28:    t75 = *((unsigned int *)t53);
    t76 = *((unsigned int *)t67);
    t77 = (t75 & t76);
    *((unsigned int *)t74) = t77;
    t78 = (t53 + 4);
    t79 = (t67 + 4);
    t80 = (t74 + 4);
    t81 = *((unsigned int *)t78);
    t82 = *((unsigned int *)t79);
    t83 = (t81 | t82);
    *((unsigned int *)t80) = t83;
    t84 = *((unsigned int *)t80);
    t85 = (t84 != 0);
    if (t85 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB24;

LAB25:    *((unsigned int *)t67) = 1;
    goto LAB28;

LAB27:    t73 = (t67 + 4);
    *((unsigned int *)t67) = 1;
    *((unsigned int *)t73) = 1;
    goto LAB28;

LAB29:    t86 = *((unsigned int *)t74);
    t87 = *((unsigned int *)t80);
    *((unsigned int *)t74) = (t86 | t87);
    t88 = (t53 + 4);
    t89 = (t67 + 4);
    t90 = *((unsigned int *)t53);
    t91 = (~(t90));
    t92 = *((unsigned int *)t88);
    t93 = (~(t92));
    t94 = *((unsigned int *)t67);
    t95 = (~(t94));
    t96 = *((unsigned int *)t89);
    t97 = (~(t96));
    t98 = (t91 & t93);
    t99 = (t95 & t97);
    t100 = (~(t98));
    t101 = (~(t99));
    t102 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t102 & t100);
    t103 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t103 & t101);
    t104 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t104 & t100);
    t105 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t105 & t101);
    goto LAB31;

}

static void Cont_62_5(char *t0)
{
    char t4[8];
    char t17[8];
    char t24[8];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;

LAB0:    t1 = (t0 + 8788U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 2164U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t3);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t11 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t11);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB8;

LAB9:    memcpy(t24, t4, 8);

LAB10:    t56 = (t0 + 9536);
    t57 = (t56 + 32U);
    t58 = *((char **)t57);
    t59 = (t58 + 40U);
    t60 = *((char **)t59);
    memset(t60, 0, 8);
    t61 = 1U;
    t62 = t61;
    t63 = (t24 + 4);
    t64 = *((unsigned int *)t24);
    t61 = (t61 & t64);
    t65 = *((unsigned int *)t63);
    t62 = (t62 & t65);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t67 | t61);
    t68 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t68 | t62);
    xsi_driver_vfirst_trans(t56, 0, 0);
    t69 = (t0 + 9304);
    *((int *)t69) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t10 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB7;

LAB8:    t15 = (t0 + 1336U);
    t16 = *((char **)t15);
    memset(t17, 0, 8);
    t15 = (t16 + 4);
    t18 = *((unsigned int *)t15);
    t19 = (~(t18));
    t20 = *((unsigned int *)t16);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t15) != 0)
        goto LAB13;

LAB14:    t25 = *((unsigned int *)t4);
    t26 = *((unsigned int *)t17);
    t27 = (t25 & t26);
    *((unsigned int *)t24) = t27;
    t28 = (t4 + 4);
    t29 = (t17 + 4);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t28);
    t32 = *((unsigned int *)t29);
    t33 = (t31 | t32);
    *((unsigned int *)t30) = t33;
    t34 = *((unsigned int *)t30);
    t35 = (t34 != 0);
    if (t35 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t17) = 1;
    goto LAB14;

LAB13:    t23 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB14;

LAB15:    t36 = *((unsigned int *)t24);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t24) = (t36 | t37);
    t38 = (t4 + 4);
    t39 = (t17 + 4);
    t40 = *((unsigned int *)t4);
    t41 = (~(t40));
    t42 = *((unsigned int *)t38);
    t43 = (~(t42));
    t44 = *((unsigned int *)t17);
    t45 = (~(t44));
    t46 = *((unsigned int *)t39);
    t47 = (~(t46));
    t48 = (t41 & t43);
    t49 = (t45 & t47);
    t50 = (~(t48));
    t51 = (~(t49));
    t52 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t52 & t50);
    t53 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t53 & t51);
    t54 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t54 & t50);
    t55 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t55 & t51);
    goto LAB17;

}

static void Initial_85_6(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(85, ng0);

LAB2:    xsi_set_current_line(86, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 6072);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(87, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 6256);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(88, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 6716);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(89, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7176);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Always_92_7(char *t0)
{
    char t6[8];
    char t18[8];
    char t25[8];
    char t61[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    int t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;

LAB0:    t1 = (t0 + 9076U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 9312);
    *((int *)t2) = 1;
    t3 = (t0 + 9104);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(92, ng0);

LAB5:    xsi_set_current_line(93, ng0);
    t4 = (t0 + 5660U);
    t5 = *((char **)t4);
    t4 = (t0 + 5980);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t2) != 0)
        goto LAB8;

LAB9:    t5 = (t6 + 4);
    t12 = *((unsigned int *)t6);
    t13 = (!(t12));
    t14 = *((unsigned int *)t5);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB10;

LAB11:    memcpy(t25, t6, 8);

LAB12:    t53 = (t25 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t25);
    t57 = (t56 & t55);
    t58 = (t57 != 0);
    if (t58 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 5384U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB22:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 5476U);
    t3 = *((char **)t2);
    t2 = (t0 + 692U);
    t4 = *((char **)t2);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t4);
    t9 = (t7 | t8);
    *((unsigned int *)t25) = t9;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t16 = (t25 + 4);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t5);
    t12 = (t10 | t11);
    *((unsigned int *)t16) = t12;
    t13 = *((unsigned int *)t16);
    t14 = (t13 != 0);
    if (t14 == 1)
        goto LAB40;

LAB41:
LAB42:    t29 = (t0 + 1336U);
    t30 = *((char **)t29);
    t35 = *((unsigned int *)t25);
    t36 = *((unsigned int *)t30);
    t37 = (t35 | t36);
    *((unsigned int *)t61) = t37;
    t29 = (t25 + 4);
    t31 = (t30 + 4);
    t39 = (t61 + 4);
    t38 = *((unsigned int *)t29);
    t41 = *((unsigned int *)t31);
    t42 = (t38 | t41);
    *((unsigned int *)t39) = t42;
    t43 = *((unsigned int *)t39);
    t45 = (t43 != 0);
    if (t45 == 1)
        goto LAB43;

LAB44:
LAB45:    memset(t18, 0, 8);
    t59 = (t61 + 4);
    t65 = *((unsigned int *)t59);
    t66 = (~(t65));
    t67 = *((unsigned int *)t61);
    t68 = (t67 & t66);
    t69 = (t68 & 1U);
    if (t69 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t59) != 0)
        goto LAB48;

LAB49:    t70 = (t18 + 4);
    t71 = *((unsigned int *)t18);
    t72 = *((unsigned int *)t70);
    t73 = (t71 || t72);
    if (t73 > 0)
        goto LAB50;

LAB51:    t75 = *((unsigned int *)t18);
    t76 = (~(t75));
    t77 = *((unsigned int *)t70);
    t78 = (t76 || t77);
    if (t78 > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t70) > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t18) > 0)
        goto LAB56;

LAB57:    memcpy(t6, t80, 8);

LAB58:    t79 = (t0 + 6256);
    xsi_vlogvar_wait_assign_value(t79, t6, 0, 0, 32, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2624U);
    t3 = *((char **)t2);
    t2 = (t0 + 6348);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2716U);
    t3 = *((char **)t2);
    t2 = (t0 + 6440);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t0 + 6532);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2900U);
    t3 = *((char **)t2);
    t2 = (t0 + 6624);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 1336U);
    t4 = *((char **)t2);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t4);
    t9 = (t7 | t8);
    *((unsigned int *)t25) = t9;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t16 = (t25 + 4);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t5);
    t12 = (t10 | t11);
    *((unsigned int *)t16) = t12;
    t13 = *((unsigned int *)t16);
    t14 = (t13 != 0);
    if (t14 == 1)
        goto LAB59;

LAB60:
LAB61:    memset(t18, 0, 8);
    t29 = (t25 + 4);
    t35 = *((unsigned int *)t29);
    t36 = (~(t35));
    t37 = *((unsigned int *)t25);
    t38 = (t37 & t36);
    t41 = (t38 & 1U);
    if (t41 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t29) != 0)
        goto LAB64;

LAB65:    t31 = (t18 + 4);
    t42 = *((unsigned int *)t18);
    t43 = *((unsigned int *)t31);
    t45 = (t42 || t43);
    if (t45 > 0)
        goto LAB66;

LAB67:    t46 = *((unsigned int *)t18);
    t47 = (~(t46));
    t49 = *((unsigned int *)t31);
    t50 = (t47 || t49);
    if (t50 > 0)
        goto LAB68;

LAB69:    if (*((unsigned int *)t31) > 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t18) > 0)
        goto LAB72;

LAB73:    memcpy(t6, t53, 8);

LAB74:    t40 = (t0 + 6716);
    xsi_vlogvar_wait_assign_value(t40, t6, 0, 0, 32, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 3636U);
    t3 = *((char **)t2);
    t2 = (t0 + 6808);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 3728U);
    t3 = *((char **)t2);
    t2 = (t0 + 6900);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3820U);
    t3 = *((char **)t2);
    t2 = (t0 + 6992);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3912U);
    t3 = *((char **)t2);
    t2 = (t0 + 7084);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t18, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB75;

LAB76:    if (*((unsigned int *)t2) != 0)
        goto LAB77;

LAB78:    t5 = (t18 + 4);
    t12 = *((unsigned int *)t18);
    t13 = *((unsigned int *)t5);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB79;

LAB80:    t15 = *((unsigned int *)t18);
    t19 = (~(t15));
    t20 = *((unsigned int *)t5);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t5) > 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t18) > 0)
        goto LAB85;

LAB86:    memcpy(t6, t24, 8);

LAB87:    t17 = (t0 + 7176);
    xsi_vlogvar_wait_assign_value(t17, t6, 0, 0, 32, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 4096U);
    t3 = *((char **)t2);
    t2 = (t0 + 7268);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4188U);
    t3 = *((char **)t2);
    t2 = (t0 + 7360);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4280U);
    t3 = *((char **)t2);
    t2 = (t0 + 7452);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 4372U);
    t3 = *((char **)t2);
    t2 = (t0 + 7544);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1520U);
    t3 = *((char **)t2);
    t2 = (t0 + 5888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t4 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    t16 = (t0 + 1336U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t16 = (t17 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (~(t19));
    t21 = *((unsigned int *)t17);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t16) != 0)
        goto LAB15;

LAB16:    t26 = *((unsigned int *)t6);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    *((unsigned int *)t25) = t28;
    t29 = (t6 + 4);
    t30 = (t18 + 4);
    t31 = (t25 + 4);
    t32 = *((unsigned int *)t29);
    t33 = *((unsigned int *)t30);
    t34 = (t32 | t33);
    *((unsigned int *)t31) = t34;
    t35 = *((unsigned int *)t31);
    t36 = (t35 != 0);
    if (t36 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t18) = 1;
    goto LAB16;

LAB15:    t24 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB16;

LAB17:    t37 = *((unsigned int *)t25);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t25) = (t37 | t38);
    t39 = (t6 + 4);
    t40 = (t18 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (~(t41));
    t43 = *((unsigned int *)t6);
    t44 = (t43 & t42);
    t45 = *((unsigned int *)t40);
    t46 = (~(t45));
    t47 = *((unsigned int *)t18);
    t48 = (t47 & t46);
    t49 = (~(t44));
    t50 = (~(t48));
    t51 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t51 & t49);
    t52 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t52 & t50);
    goto LAB19;

LAB20:    xsi_set_current_line(96, ng0);
    t59 = ((char*)((ng1)));
    t60 = (t0 + 6072);
    xsi_vlogvar_wait_assign_value(t60, t59, 0, 0, 32, 0LL);
    goto LAB22;

LAB23:    xsi_set_current_line(97, ng0);

LAB26:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 3360U);
    t5 = *((char **)t4);
    memset(t18, 0, 8);
    t4 = (t5 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (~(t12));
    t14 = *((unsigned int *)t5);
    t15 = (t14 & t13);
    t19 = (t15 & 1U);
    if (t19 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t4) != 0)
        goto LAB29;

LAB30:    t17 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = *((unsigned int *)t17);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB31;

LAB32:    t23 = *((unsigned int *)t18);
    t26 = (~(t23));
    t27 = *((unsigned int *)t17);
    t28 = (t26 || t27);
    if (t28 > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t17) > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t18) > 0)
        goto LAB37;

LAB38:    memcpy(t6, t30, 8);

LAB39:    t29 = (t0 + 6072);
    xsi_vlogvar_wait_assign_value(t29, t6, 0, 0, 32, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2440U);
    t3 = *((char **)t2);
    t2 = (t0 + 6164);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    goto LAB25;

LAB27:    *((unsigned int *)t18) = 1;
    goto LAB30;

LAB29:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB30;

LAB31:    t24 = ((char*)((ng1)));
    goto LAB32;

LAB33:    t29 = (t0 + 2348U);
    t30 = *((char **)t29);
    goto LAB34;

LAB35:    xsi_vlog_unsigned_bit_combine(t6, 32, t24, 32, t30, 32);
    goto LAB39;

LAB37:    memcpy(t6, t24, 8);
    goto LAB39;

LAB40:    t15 = *((unsigned int *)t25);
    t19 = *((unsigned int *)t16);
    *((unsigned int *)t25) = (t15 | t19);
    t17 = (t3 + 4);
    t24 = (t4 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t44 = (t22 & t21);
    t23 = *((unsigned int *)t24);
    t26 = (~(t23));
    t27 = *((unsigned int *)t4);
    t48 = (t27 & t26);
    t28 = (~(t44));
    t32 = (~(t48));
    t33 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t33 & t28);
    t34 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t34 & t32);
    goto LAB42;

LAB43:    t46 = *((unsigned int *)t61);
    t47 = *((unsigned int *)t39);
    *((unsigned int *)t61) = (t46 | t47);
    t40 = (t25 + 4);
    t53 = (t30 + 4);
    t49 = *((unsigned int *)t40);
    t50 = (~(t49));
    t51 = *((unsigned int *)t25);
    t62 = (t51 & t50);
    t52 = *((unsigned int *)t53);
    t54 = (~(t52));
    t55 = *((unsigned int *)t30);
    t63 = (t55 & t54);
    t56 = (~(t62));
    t57 = (~(t63));
    t58 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t58 & t56);
    t64 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t64 & t57);
    goto LAB45;

LAB46:    *((unsigned int *)t18) = 1;
    goto LAB49;

LAB48:    t60 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB49;

LAB50:    t74 = ((char*)((ng1)));
    goto LAB51;

LAB52:    t79 = (t0 + 2532U);
    t80 = *((char **)t79);
    goto LAB53;

LAB54:    xsi_vlog_unsigned_bit_combine(t6, 32, t74, 32, t80, 32);
    goto LAB58;

LAB56:    memcpy(t6, t74, 8);
    goto LAB58;

LAB59:    t15 = *((unsigned int *)t25);
    t19 = *((unsigned int *)t16);
    *((unsigned int *)t25) = (t15 | t19);
    t17 = (t3 + 4);
    t24 = (t4 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t44 = (t22 & t21);
    t23 = *((unsigned int *)t24);
    t26 = (~(t23));
    t27 = *((unsigned int *)t4);
    t48 = (t27 & t26);
    t28 = (~(t44));
    t32 = (~(t48));
    t33 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t33 & t28);
    t34 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t34 & t32);
    goto LAB61;

LAB62:    *((unsigned int *)t18) = 1;
    goto LAB65;

LAB64:    t30 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB65;

LAB66:    t39 = ((char*)((ng1)));
    goto LAB67;

LAB68:    t40 = (t0 + 3544U);
    t53 = *((char **)t40);
    goto LAB69;

LAB70:    xsi_vlog_unsigned_bit_combine(t6, 32, t39, 32, t53, 32);
    goto LAB74;

LAB72:    memcpy(t6, t39, 8);
    goto LAB74;

LAB75:    *((unsigned int *)t18) = 1;
    goto LAB78;

LAB77:    t4 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB78;

LAB79:    t16 = ((char*)((ng1)));
    goto LAB80;

LAB81:    t17 = (t0 + 4004U);
    t24 = *((char **)t17);
    goto LAB82;

LAB83:    xsi_vlog_unsigned_bit_combine(t6, 32, t16, 32, t24, 32);
    goto LAB87;

LAB85:    memcpy(t6, t16, 8);
    goto LAB87;

}


extern void work_m_00000000000420335981_1200043877_init()
{
	static char *pe[] = {(void *)Cont_32_0,(void *)Cont_33_1,(void *)Cont_38_2,(void *)Cont_48_3,(void *)Cont_61_4,(void *)Cont_62_5,(void *)Initial_85_6,(void *)Always_92_7};
	xsi_register_didat("work_m_00000000000420335981_1200043877", "isim/test_isim_beh.exe.sim/work/m_00000000000420335981_1200043877.didat");
	xsi_register_executes(pe);
}
