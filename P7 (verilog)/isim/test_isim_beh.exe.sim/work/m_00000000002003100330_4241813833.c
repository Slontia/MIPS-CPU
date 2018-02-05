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
static const char *ng0 = "D:/Projects/ISE/mips2/ext.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static int ng4[] = {16, 0};
static int ng5[] = {2, 0};



static void Cont_27_0(char *t0)
{
    char t4[8];
    char t20[8];
    char t21[8];
    char t32[8];
    char t35[8];
    char t51[8];
    char t52[8];
    char t62[8];
    char t66[8];
    char t74[8];
    char t75[8];
    char t78[8];
    char t94[8];
    char t96[8];
    char t106[8];
    char t107[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t63;
    char *t64;
    char *t65;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t76;
    char *t77;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t95;
    char *t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;

LAB0:    t1 = (t0 + 1444U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB7;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t4) = 1;

LAB7:    t22 = (t0 + 600U);
    t23 = *((char **)t22);
    memset(t21, 0, 8);
    t22 = (t21 + 4);
    t24 = (t23 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (t25 >> 0);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 0);
    *((unsigned int *)t22) = t28;
    t29 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t29 & 65535U);
    t30 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t30 & 65535U);
    t31 = ((char*)((ng2)));
    xsi_vlogtype_concat(t20, 32, 32, 2U, t31, 16, t21, 16);
    memset(t32, 0, 8);
    xsi_vlog_unsigned_multiply(t32, 32, t4, 32, t20, 32);
    t33 = (t0 + 692U);
    t34 = *((char **)t33);
    t33 = ((char*)((ng3)));
    memset(t35, 0, 8);
    t36 = (t34 + 4);
    t37 = (t33 + 4);
    t38 = *((unsigned int *)t34);
    t39 = *((unsigned int *)t33);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t36);
    t42 = *((unsigned int *)t37);
    t43 = (t41 ^ t42);
    t44 = (t40 | t43);
    t45 = *((unsigned int *)t36);
    t46 = *((unsigned int *)t37);
    t47 = (t45 | t46);
    t48 = (~(t47));
    t49 = (t44 & t48);
    if (t49 != 0)
        goto LAB11;

LAB8:    if (t47 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t35) = 1;

LAB11:    t53 = (t0 + 600U);
    t54 = *((char **)t53);
    memset(t52, 0, 8);
    t53 = (t52 + 4);
    t55 = (t54 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (t56 >> 0);
    *((unsigned int *)t52) = t57;
    t58 = *((unsigned int *)t55);
    t59 = (t58 >> 0);
    *((unsigned int *)t53) = t59;
    t60 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t60 & 65535U);
    t61 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t61 & 65535U);
    t63 = ((char*)((ng4)));
    t64 = (t0 + 600U);
    t65 = *((char **)t64);
    memset(t66, 0, 8);
    t64 = (t66 + 4);
    t67 = (t65 + 4);
    t68 = *((unsigned int *)t65);
    t69 = (t68 >> 15);
    t70 = (t69 & 1);
    *((unsigned int *)t66) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 >> 15);
    t73 = (t72 & 1);
    *((unsigned int *)t64) = t73;
    xsi_vlog_mul_concat(t62, 16, 1, t63, 1U, t66, 1);
    xsi_vlogtype_concat(t51, 32, 32, 2U, t62, 16, t52, 16);
    memset(t74, 0, 8);
    xsi_vlog_unsigned_multiply(t74, 32, t35, 32, t51, 32);
    memset(t75, 0, 8);
    xsi_vlog_unsigned_add(t75, 32, t32, 32, t74, 32);
    t76 = (t0 + 692U);
    t77 = *((char **)t76);
    t76 = ((char*)((ng5)));
    memset(t78, 0, 8);
    t79 = (t77 + 4);
    t80 = (t76 + 4);
    t81 = *((unsigned int *)t77);
    t82 = *((unsigned int *)t76);
    t83 = (t81 ^ t82);
    t84 = *((unsigned int *)t79);
    t85 = *((unsigned int *)t80);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t88 = *((unsigned int *)t79);
    t89 = *((unsigned int *)t80);
    t90 = (t88 | t89);
    t91 = (~(t90));
    t92 = (t87 & t91);
    if (t92 != 0)
        goto LAB15;

LAB12:    if (t90 != 0)
        goto LAB14;

LAB13:    *((unsigned int *)t78) = 1;

LAB15:    t95 = ((char*)((ng2)));
    t97 = (t0 + 600U);
    t98 = *((char **)t97);
    memset(t96, 0, 8);
    t97 = (t96 + 4);
    t99 = (t98 + 4);
    t100 = *((unsigned int *)t98);
    t101 = (t100 >> 0);
    *((unsigned int *)t96) = t101;
    t102 = *((unsigned int *)t99);
    t103 = (t102 >> 0);
    *((unsigned int *)t97) = t103;
    t104 = *((unsigned int *)t96);
    *((unsigned int *)t96) = (t104 & 65535U);
    t105 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t105 & 65535U);
    xsi_vlogtype_concat(t94, 32, 32, 2U, t96, 16, t95, 16);
    memset(t106, 0, 8);
    xsi_vlog_unsigned_multiply(t106, 32, t78, 32, t94, 32);
    memset(t107, 0, 8);
    xsi_vlog_unsigned_add(t107, 32, t75, 32, t106, 32);
    t108 = (t0 + 1684);
    t109 = (t108 + 32U);
    t110 = *((char **)t109);
    t111 = (t110 + 40U);
    t112 = *((char **)t111);
    memcpy(t112, t107, 8);
    xsi_driver_vfirst_trans(t108, 0, 31);
    t113 = (t0 + 1640);
    *((int *)t113) = 1;

LAB1:    return;
LAB6:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

LAB10:    t50 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t50) = 1;
    goto LAB11;

LAB14:    t93 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t93) = 1;
    goto LAB15;

}


extern void work_m_00000000002003100330_4241813833_init()
{
	static char *pe[] = {(void *)Cont_27_0};
	xsi_register_didat("work_m_00000000002003100330_4241813833", "isim/test_isim_beh.exe.sim/work/m_00000000002003100330_4241813833.didat");
	xsi_register_executes(pe);
}
