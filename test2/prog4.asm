.data
s9:	.asciiz	" = "
s8:	.asciiz	" and "
s10:	.asciiz	"\n"
s3:	.asciiz	"\n"
s2:	.asciiz	" =  "
s1:	.asciiz	" in field of "
s0:	.asciiz	"Modular inverse of "
s7:	.asciiz	"GCD of "
s6:	.asciiz	"\n"
s5:	.asciiz	") = "
s4:	.asciiz	"Factorial("

.text
main:
b A_Main
L_0:
A_power:
L_1:
sw $ra, 0($sp)
L_2:
lw $t0, 20($sp)
li $t0,1
sw $t0, 20($sp)
L_3:
lw $t1, 24($sp)
lw $t2, 20($sp)
move $t1, $t2
sw $t1, 24($sp)
L_4:
lw $t3, 28($sp)
li $t3,0
sw $t3, 28($sp)
L_5:
lw $t4, 12($sp)
lw $t5, 28($sp)
lw $t6, 32($sp)
sgt $t6, $t4, $t5
sw $t6, 32($sp)
L_6:
lw $t7, 32($sp)
beqz $t7, L_22
L_7:
lw $s0, 36($sp)
li $s0,1
sw $s0, 36($sp)
L_8:
lw $s1, 12($sp)
lw $s2, 36($sp)
lw $s3, 40($sp)
and $s3, $s1, $s2
sw $s3, 40($sp)
L_9:
lw $s4, 44($sp)
li $s4,1
sw $s4, 44($sp)
L_10:
lw $s5, 40($sp)
lw $s6, 44($sp)
lw $s7, 48($sp)
seq $s7, $s5, $s6
sw $s7, 48($sp)
L_11:
lw $t0, 48($sp)
beqz $t0, L_15
L_12:
lw $t1, 24($sp)
lw $t2, 8($sp)
lw $t3, 52($sp)
mult $t1, $t2
mflo $t3
sw $t3, 52($sp)
L_13:
lw $t6, 52($sp)
lw $t4, 16($sp)
lw $t5, 56($sp)
div $t6, $t4
mfhi $t5
sw $t5, 56($sp)
L_14:
lw $t7, 24($sp)
lw $s0, 56($sp)
move $t7, $s0
sw $t7, 24($sp)
L_15:
lw $s3, 8($sp)
lw $s3, 8($sp)
lw $s1, 52($sp)
mult $s3, $s3
mflo $s1
sw $s1, 52($sp)
L_16:
lw $s2, 52($sp)
lw $s4, 16($sp)
lw $s7, 56($sp)
div $s2, $s4
mfhi $s7
sw $s7, 56($sp)
L_17:
lw $s5, 8($sp)
lw $s6, 56($sp)
move $s5, $s6
sw $s5, 8($sp)
L_18:
lw $t0, 60($sp)
li $t0,1
sw $t0, 60($sp)
L_19:
lw $t3, 12($sp)
lw $t1, 60($sp)
lw $t2, 64($sp)
srlv $t2, $t3, $t1
sw $t2, 64($sp)
L_20:
lw $t5, 12($sp)
lw $t6, 64($sp)
move $t5, $t6
sw $t5, 12($sp)
L_21:
b L_4
L_22:
lw $t4, 24($sp)
lw $t7, 16($sp)
lw $s0, 36($sp)
div $t4, $t7
mfhi $s0
sw $s0, 36($sp)
L_23:
lw $s1, 36($sp)
move $v0, $s1
L_24:
lw $ra, 0($sp)
jr $ra
L_25:
lw $ra, 0($sp)
jr $ra
L_26:
A_gcd:
L_27:
sw $ra, 0($sp)
L_28:
lw $s3, 8($sp)
lw $s7, 12($sp)
lw $s2, 16($sp)
slt $s2, $s3, $s7
sw $s2, 16($sp)
L_29:
lw $s4, 16($sp)
beqz $s4, L_37
L_30:
lw $s5, 4($sp)
sw $s5, -32($sp)
L_31:
lw $s6, 12($sp)
sw $s6, -28($sp)
L_32:
lw $t0, 8($sp)
sw $t0, -24($sp)
L_33:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_34:
lw $t2, 20($sp)
move $t2, $v0
sw $t2, 20($sp)
L_35:
lw $t3, 20($sp)
move $v0, $t3
L_36:
lw $ra, 0($sp)
jr $ra
L_37:
lw $t1, 20($sp)
li $t1,0
sw $t1, 20($sp)
L_38:
lw $t5, 12($sp)
lw $t6, 20($sp)
lw $s0, 24($sp)
seq $s0, $t5, $t6
sw $s0, 24($sp)
L_39:
lw $t4, 24($sp)
beqz $t4, L_43
L_40:
lw $t7, 8($sp)
move $v0, $t7
L_41:
lw $ra, 0($sp)
jr $ra
L_42:
b L_51
L_43:
lw $s1, 8($sp)
lw $s2, 12($sp)
lw $s3, 28($sp)
div $s1, $s2
mfhi $s3
sw $s3, 28($sp)
L_44:
lw $s7, 4($sp)
sw $s7, -32($sp)
L_45:
lw $s4, 12($sp)
sw $s4, -28($sp)
L_46:
lw $s5, 28($sp)
sw $s5, -24($sp)
L_47:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_48:
lw $s6, 32($sp)
move $s6, $v0
sw $s6, 32($sp)
L_49:
lw $t0, 32($sp)
move $v0, $t0
L_50:
lw $ra, 0($sp)
jr $ra
L_51:
lw $ra, 0($sp)
jr $ra
L_52:
A_Main:
L_53:
sw $ra, 0($sp)
L_54:
lw $t2, 8($sp)
li $t2,1
sw $t2, 8($sp)
L_55:
lw $t3, 12($sp)
li $t3,17
sw $t3, 12($sp)
L_56:
lw $t1, 16($sp)
lw $s0, 8($sp)
move $t1, $s0
sw $t1, 16($sp)
L_57:
lw $t5, 20($sp)
lw $t6, 12($sp)
move $t5, $t6
sw $t5, 20($sp)
L_58:
lw $t4, 16($sp)
lw $t7, 20($sp)
lw $s3, 24($sp)
slt $s3, $t4, $t7
sw $s3, 24($sp)
L_59:
lw $s1, 24($sp)
beqz $s1, L_79
L_60:
lw $s2, 28($sp)
li $s2,2
sw $s2, 28($sp)
L_61:
lw $s7, 20($sp)
lw $s4, 28($sp)
lw $s5, 32($sp)
sub $s5, $s7, $s4
sw $s5, 32($sp)
L_62:
lw $s6, 4($sp)
sw $s6, -64($sp)
L_63:
lw $t0, 16($sp)
sw $t0, -60($sp)
L_64:
lw $t2, 32($sp)
sw $t2, -56($sp)
L_65:
lw $t3, 20($sp)
sw $t3, -52($sp)
L_66:
sub $sp, $sp, 68
jal A_power
add $sp, $sp, 68
L_67:
lw $t1, 36($sp)
move $t1, $v0
sw $t1, 36($sp)
L_68:
la $a0, s0
li $v0, 4
syscall
L_69:
lw $s0, 16($sp)
move $a0, $s0
li $v0, 1
syscall
L_70:
la $a0, s1
li $v0, 4
syscall
L_71:
lw $t5, 20($sp)
move $a0, $t5
li $v0, 1
syscall
L_72:
la $a0, s2
li $v0, 4
syscall
L_73:
lw $t6, 36($sp)
move $a0, $t6
li $v0, 1
syscall
L_74:
la $a0, s3
li $v0, 4
syscall
L_75:
lw $s3, 40($sp)
li $s3,1
sw $s3, 40($sp)
L_76:
lw $t4, 16($sp)
lw $t7, 40($sp)
lw $s1, 44($sp)
add $s1, $t4, $t7
sw $s1, 44($sp)
L_77:
lw $s2, 16($sp)
lw $s5, 44($sp)
move $s2, $s5
sw $s2, 16($sp)
L_78:
b L_58
L_79:
lw $s7, 80($sp)
li $s7,0
sw $s7, 80($sp)
L_80:
lw $s4, 84($sp)
li $s4,1
sw $s4, 84($sp)
L_81:
lw $s6, 80($sp)
lw $t0, 84($sp)
li $t2, 4
mult $s6, $t2
mflo $t2
addi $t2, $t2, 28
add $t2, $sp, $t2
sw $t0, ($t2)
L_82:
lw $t3, 80($sp)
lw $t1, 88($sp)
li $s0, 4
mult $t3, $s0
mflo $s0
addi $s0, $s0, 28
add $s0, $sp, $s0
lw $t1, ($s0)
sw $t1, 88($sp)
L_83:
lw $t5, 92($sp)
li $t5,1
sw $t5, 92($sp)
L_84:
lw $t6, 16($sp)
lw $s3, 92($sp)
move $t6, $s3
sw $t6, 16($sp)
L_85:
lw $s1, 96($sp)
li $s1,13
sw $s1, 96($sp)
L_86:
lw $t4, 16($sp)
lw $t7, 96($sp)
lw $s2, 100($sp)
slt $s2, $t4, $t7
sw $s2, 100($sp)
L_87:
lw $s5, 100($sp)
beqz $s5, L_100
L_88:
b L_93
L_89:
lw $s7, 104($sp)
li $s7,1
sw $s7, 104($sp)
L_90:
lw $s4, 16($sp)
lw $s6, 104($sp)
lw $t0, 108($sp)
add $t0, $s4, $s6
sw $t0, 108($sp)
L_91:
lw $t2, 16($sp)
lw $t1, 108($sp)
move $t2, $t1
sw $t2, 16($sp)
L_92:
b L_85
L_93:
lw $t3, 112($sp)
li $t3,1
sw $t3, 112($sp)
L_94:
lw $s0, 16($sp)
lw $t5, 112($sp)
lw $t6, 116($sp)
sub $t6, $s0, $t5
sw $t6, 116($sp)
L_95:
lw $s3, 116($sp)
lw $s1, 120($sp)
li $s2, 4
mult $s3, $s2
mflo $s2
addi $s2, $s2, 28
add $s2, $sp, $s2
lw $s1, ($s2)
sw $s1, 120($sp)
L_96:
lw $t4, 120($sp)
lw $t7, 16($sp)
lw $s5, 124($sp)
mult $t4, $t7
mflo $s5
sw $s5, 124($sp)
L_97:
lw $s7, 16($sp)
lw $t0, 124($sp)
li $s4, 4
mult $s7, $s4
mflo $s4
addi $s4, $s4, 28
add $s4, $sp, $s4
sw $t0, ($s4)
L_98:
lw $s6, 16($sp)
lw $t2, 128($sp)
li $t1, 4
mult $s6, $t1
mflo $t1
addi $t1, $t1, 28
add $t1, $sp, $t1
lw $t2, ($t1)
sw $t2, 128($sp)
L_99:
b L_89
L_100:
lw $t3, 112($sp)
li $t3,0
sw $t3, 112($sp)
L_101:
lw $t6, 16($sp)
lw $s0, 112($sp)
move $t6, $s0
sw $t6, 16($sp)
L_102:
lw $t5, 116($sp)
li $t5,13
sw $t5, 116($sp)
L_103:
lw $s1, 16($sp)
lw $s3, 116($sp)
lw $s2, 120($sp)
slt $s2, $s1, $s3
sw $s2, 120($sp)
L_104:
lw $s5, 120($sp)
beqz $s5, L_117
L_105:
b L_110
L_106:
lw $t4, 124($sp)
li $t4,1
sw $t4, 124($sp)
L_107:
lw $t7, 16($sp)
lw $s7, 124($sp)
lw $t0, 128($sp)
add $t0, $t7, $s7
sw $t0, 128($sp)
L_108:
lw $s4, 16($sp)
lw $t2, 128($sp)
move $s4, $t2
sw $s4, 16($sp)
L_109:
b L_102
L_110:
lw $s6, 16($sp)
lw $t1, 132($sp)
li $t3, 4
mult $s6, $t3
mflo $t3
addi $t3, $t3, 28
add $t3, $sp, $t3
lw $t1, ($t3)
sw $t1, 132($sp)
L_111:
la $a0, s4
li $v0, 4
syscall
L_112:
lw $t6, 16($sp)
move $a0, $t6
li $v0, 1
syscall
L_113:
la $a0, s5
li $v0, 4
syscall
L_114:
lw $s0, 132($sp)
move $a0, $s0
li $v0, 1
syscall
L_115:
la $a0, s6
li $v0, 4
syscall
L_116:
b L_106
L_117:
lw $t5, 136($sp)
li $t5,1
sw $t5, 136($sp)
L_118:
lw $s2, 16($sp)
lw $s1, 136($sp)
move $s2, $s1
sw $s2, 16($sp)
L_119:
lw $s3, 140($sp)
li $s3,20
sw $s3, 140($sp)
L_120:
lw $s5, 16($sp)
lw $t4, 140($sp)
lw $t0, 144($sp)
sle $t0, $s5, $t4
sw $t0, 144($sp)
L_121:
lw $t7, 144($sp)
beqz $t7, L_152
L_122:
b L_127
L_123:
lw $s7, 148($sp)
li $s7,1
sw $s7, 148($sp)
L_124:
lw $s4, 16($sp)
lw $t2, 148($sp)
lw $t1, 152($sp)
add $t1, $s4, $t2
sw $t1, 152($sp)
L_125:
lw $s6, 16($sp)
lw $t3, 152($sp)
move $s6, $t3
sw $s6, 16($sp)
L_126:
b L_119
L_127:
lw $t6, 156($sp)
li $t6,1
sw $t6, 156($sp)
L_128:
lw $s0, 16($sp)
lw $t5, 156($sp)
lw $s2, 160($sp)
add $s2, $s0, $t5
sw $s2, 160($sp)
L_129:
lw $s1, 132($sp)
lw $s3, 160($sp)
move $s1, $s3
sw $s1, 132($sp)
L_130:
lw $t0, 164($sp)
li $t0,20
sw $t0, 164($sp)
L_131:
lw $s5, 132($sp)
lw $t4, 164($sp)
lw $t7, 168($sp)
sle $t7, $s5, $t4
sw $t7, 168($sp)
L_132:
lw $s7, 168($sp)
beqz $s7, L_151
L_133:
b L_138
L_134:
lw $t1, 172($sp)
li $t1,1
sw $t1, 172($sp)
L_135:
lw $s4, 132($sp)
lw $t2, 172($sp)
lw $s6, 176($sp)
add $s6, $s4, $t2
sw $s6, 176($sp)
L_136:
lw $t3, 132($sp)
lw $t6, 176($sp)
move $t3, $t6
sw $t3, 132($sp)
L_137:
b L_130
L_138:
lw $s2, 4($sp)
sw $s2, -32($sp)
L_139:
lw $s0, 16($sp)
sw $s0, -28($sp)
L_140:
lw $t5, 132($sp)
sw $t5, -24($sp)
L_141:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_142:
lw $s1, 180($sp)
move $s1, $v0
sw $s1, 180($sp)
L_143:
la $a0, s7
li $v0, 4
syscall
L_144:
lw $s3, 16($sp)
move $a0, $s3
li $v0, 1
syscall
L_145:
la $a0, s8
li $v0, 4
syscall
L_146:
lw $t0, 132($sp)
move $a0, $t0
li $v0, 1
syscall
L_147:
la $a0, s9
li $v0, 4
syscall
L_148:
lw $t7, 180($sp)
move $a0, $t7
li $v0, 1
syscall
L_149:
la $a0, s10
li $v0, 4
syscall
L_150:
b L_134
L_151:
b L_123
L_152:
lw $ra, 0($sp)
jr $ra
L_153:
sub $sp, $sp, 184
jal A_Main
add $sp, $sp, 184
L_154:
li $v0, 10
syscall
