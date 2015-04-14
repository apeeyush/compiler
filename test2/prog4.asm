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
lw $s7, 20($sp)
li $s7,1
sw $s7, 20($sp)
L_3:
lw $s7, 24($sp)
lw $s6, 20($sp)
move $s7, $s6
sw $s7, 24($sp)
L_4:
lw $s7, 28($sp)
li $s7,0
sw $s7, 28($sp)
L_5:
lw $s7, 12($sp)
lw $s5, 28($sp)
lw $s4, 32($sp)
sgt $s4, $s7, $s5
sw $s4, 32($sp)
L_6:
lw $s4, 32($sp)
beqz $s4, L_22
L_7:
lw $s3, 36($sp)
li $s3,1
sw $s3, 36($sp)
L_8:
lw $s7, 12($sp)
lw $s3, 36($sp)
lw $s2, 40($sp)
and $s2, $s7, $s3
sw $s2, 40($sp)
L_9:
lw $s2, 44($sp)
li $s2,1
sw $s2, 44($sp)
L_10:
lw $s2, 40($sp)
lw $s1, 44($sp)
lw $s0, 48($sp)
seq $s0, $s2, $s1
sw $s0, 48($sp)
L_11:
lw $s0, 48($sp)
beqz $s0, L_15
L_12:
lw $t7, 24($sp)
lw $t6, 8($sp)
lw $t5, 52($sp)
mult $t7, $t6
mflo $t5
sw $t5, 52($sp)
L_13:
lw $t5, 52($sp)
lw $t4, 16($sp)
lw $t3, 56($sp)
div $t5, $t4
mfhi $t3
sw $t3, 56($sp)
L_14:
lw $t7, 24($sp)
lw $t3, 56($sp)
move $t7, $t3
sw $t7, 24($sp)
L_15:
lw $t6, 8($sp)
lw $t6, 8($sp)
lw $t7, 52($sp)
mult $t6, $t6
mflo $t7
sw $t7, 52($sp)
L_16:
lw $t7, 52($sp)
lw $t4, 16($sp)
lw $t2, 56($sp)
div $t7, $t4
mfhi $t2
sw $t2, 56($sp)
L_17:
lw $t6, 8($sp)
lw $t2, 56($sp)
move $t6, $t2
sw $t6, 8($sp)
L_18:
lw $t6, 60($sp)
li $t6,1
sw $t6, 60($sp)
L_19:
lw $s7, 12($sp)
lw $t6, 60($sp)
lw $t1, 64($sp)
srlv $t1, $s7, $t6
sw $t1, 64($sp)
L_20:
lw $s7, 12($sp)
lw $t1, 64($sp)
move $s7, $t1
sw $s7, 12($sp)
L_21:
b L_4
L_22:
lw $s7, 24($sp)
lw $t4, 16($sp)
lw $t0, 36($sp)
div $s7, $t4
mfhi $t0
sw $t0, 36($sp)
L_23:
lw $t0, 36($sp)
move $v0, $t0
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
lw $s6, 8($sp)
lw $s5, 12($sp)
lw $s4, 16($sp)
slt $s4, $s6, $s5
sw $s4, 16($sp)
L_29:
lw $s4, 16($sp)
beqz $s4, L_37
L_30:
lw $s3, 4($sp)
sw $s3, -32($sp)
L_31:
lw $s5, 12($sp)
sw $s5, -28($sp)
L_32:
lw $s6, 8($sp)
sw $s6, -24($sp)
L_33:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_34:
lw $s2, 20($sp)
move $s2, $v0
sw $s2, 20($sp)
L_35:
lw $s2, 20($sp)
move $v0, $s2
L_36:
lw $ra, 0($sp)
jr $ra
L_37:
lw $s1, 20($sp)
li $s1,0
sw $s1, 20($sp)
L_38:
lw $s5, 12($sp)
lw $s1, 20($sp)
lw $s0, 24($sp)
seq $s0, $s5, $s1
sw $s0, 24($sp)
L_39:
lw $s0, 24($sp)
beqz $s0, L_43
L_40:
lw $s6, 8($sp)
move $v0, $s6
L_41:
lw $ra, 0($sp)
jr $ra
L_42:
b L_51
L_43:
lw $s6, 8($sp)
lw $s5, 12($sp)
lw $t5, 28($sp)
div $s6, $s5
mfhi $t5
sw $t5, 28($sp)
L_44:
lw $t5, 4($sp)
sw $t5, -32($sp)
L_45:
lw $s5, 12($sp)
sw $s5, -28($sp)
L_46:
lw $t4, 28($sp)
sw $t4, -24($sp)
L_47:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_48:
lw $t3, 32($sp)
move $t3, $v0
sw $t3, 32($sp)
L_49:
lw $t3, 32($sp)
move $v0, $t3
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
lw $t7, 12($sp)
li $t7,1
sw $t7, 12($sp)
L_55:
lw $t7, 16($sp)
li $t7,17
sw $t7, 16($sp)
L_56:
lw $t7, 20($sp)
lw $t2, 12($sp)
move $t7, $t2
sw $t7, 20($sp)
L_57:
lw $t7, 24($sp)
lw $t6, 16($sp)
move $t7, $t6
sw $t7, 24($sp)
L_58:
lw $t7, 20($sp)
lw $t1, 24($sp)
lw $s7, 28($sp)
slt $s7, $t7, $t1
sw $s7, 28($sp)
L_59:
lw $s7, 28($sp)
beqz $s7, L_79
L_60:
lw $t0, 32($sp)
li $t0,2
sw $t0, 32($sp)
L_61:
lw $t1, 24($sp)
lw $t0, 32($sp)
lw $s6, 36($sp)
sub $s6, $t1, $t0
sw $s6, 36($sp)
L_62:
lw $s6, 4($sp)
sw $s6, -64($sp)
L_63:
lw $t7, 20($sp)
sw $t7, -60($sp)
L_64:
lw $s5, 36($sp)
sw $s5, -56($sp)
L_65:
lw $t1, 24($sp)
sw $t1, -52($sp)
L_66:
sub $sp, $sp, 68
jal A_power
add $sp, $sp, 68
L_67:
lw $s4, 40($sp)
move $s4, $v0
sw $s4, 40($sp)
L_68:
la $a0, s0
li $v0, 4
syscall
L_69:
lw $t7, 20($sp)
move $a0, $t7
li $v0, 1
syscall
L_70:
la $a0, s1
li $v0, 4
syscall
L_71:
lw $t1, 24($sp)
move $a0, $t1
li $v0, 1
syscall
L_72:
la $a0, s2
li $v0, 4
syscall
L_73:
lw $s4, 40($sp)
move $a0, $s4
li $v0, 1
syscall
L_74:
la $a0, s3
li $v0, 4
syscall
L_75:
lw $s3, 44($sp)
li $s3,1
sw $s3, 44($sp)
L_76:
lw $t7, 20($sp)
lw $s3, 44($sp)
lw $s2, 48($sp)
add $s2, $t7, $s3
sw $s2, 48($sp)
L_77:
lw $t7, 20($sp)
lw $s2, 48($sp)
move $t7, $s2
sw $t7, 20($sp)
L_78:
b L_58
L_79:
lw $t7, 84($sp)
li $t7,0
sw $t7, 84($sp)
L_80:
lw $t7, 88($sp)
li $t7,1
sw $t7, 88($sp)
L_81:
lw $t7, 84($sp)
lw $s1, 88($sp)
li $s0, 4
mult $t7, $s0
mflo $s0
addi $s0, $s0, 32
add $s0, $sp, $s0
sw $s1, ($s0)
L_82:
lw $t7, 84($sp)
lw $t5, 92($sp)
li $t4, 4
mult $t7, $t4
mflo $t4
addi $t4, $t4, 32
add $t4, $sp, $t4
lw $t5, ($t4)
sw $t5, 92($sp)
L_83:
lw $t5, 96($sp)
li $t5,1
sw $t5, 96($sp)
L_84:
lw $t5, 20($sp)
lw $t3, 96($sp)
move $t5, $t3
sw $t5, 20($sp)
L_85:
lw $t5, 100($sp)
li $t5,13
sw $t5, 100($sp)
L_86:
lw $t5, 20($sp)
lw $t2, 100($sp)
lw $t6, 104($sp)
slt $t6, $t5, $t2
sw $t6, 104($sp)
L_87:
lw $t6, 104($sp)
beqz $t6, L_100
L_88:
b L_93
L_89:
lw $t1, 108($sp)
li $t1,1
sw $t1, 108($sp)
L_90:
lw $t5, 20($sp)
lw $t1, 108($sp)
lw $s7, 112($sp)
add $s7, $t5, $t1
sw $s7, 112($sp)
L_91:
lw $t5, 20($sp)
lw $s7, 112($sp)
move $t5, $s7
sw $t5, 20($sp)
L_92:
b L_85
L_93:
lw $t5, 116($sp)
li $t5,1
sw $t5, 116($sp)
L_94:
lw $t5, 20($sp)
lw $t0, 116($sp)
lw $s6, 120($sp)
sub $s6, $t5, $t0
sw $s6, 120($sp)
L_95:
lw $s6, 120($sp)
lw $s5, 124($sp)
li $s4, 4
mult $s6, $s4
mflo $s4
addi $s4, $s4, 32
add $s4, $sp, $s4
lw $s5, ($s4)
sw $s5, 124($sp)
L_96:
lw $s5, 124($sp)
lw $t5, 20($sp)
lw $s3, 128($sp)
mult $s5, $t5
mflo $s3
sw $s3, 128($sp)
L_97:
lw $t5, 20($sp)
lw $s3, 128($sp)
li $s2, 4
mult $t5, $s2
mflo $s2
addi $s2, $s2, 32
add $s2, $sp, $s2
sw $s3, ($s2)
L_98:
lw $t5, 20($sp)
lw $t7, 132($sp)
li $s1, 4
mult $t5, $s1
mflo $s1
addi $s1, $s1, 32
add $s1, $sp, $s1
lw $t7, ($s1)
sw $t7, 132($sp)
L_99:
b L_89
L_100:
lw $t7, 116($sp)
li $t7,0
sw $t7, 116($sp)
L_101:
lw $t5, 20($sp)
lw $t7, 116($sp)
move $t5, $t7
sw $t5, 20($sp)
L_102:
lw $t5, 120($sp)
li $t5,13
sw $t5, 120($sp)
L_103:
lw $t5, 20($sp)
lw $s0, 120($sp)
lw $t4, 124($sp)
slt $t4, $t5, $s0
sw $t4, 124($sp)
L_104:
lw $t4, 124($sp)
beqz $t4, L_117
L_105:
b L_110
L_106:
lw $t3, 128($sp)
li $t3,1
sw $t3, 128($sp)
L_107:
lw $t5, 20($sp)
lw $t3, 128($sp)
lw $t2, 132($sp)
add $t2, $t5, $t3
sw $t2, 132($sp)
L_108:
lw $t5, 20($sp)
lw $t2, 132($sp)
move $t5, $t2
sw $t5, 20($sp)
L_109:
b L_102
L_110:
lw $t5, 20($sp)
lw $t6, 136($sp)
li $t1, 4
mult $t5, $t1
mflo $t1
addi $t1, $t1, 32
add $t1, $sp, $t1
lw $t6, ($t1)
sw $t6, 136($sp)
L_111:
la $a0, s4
li $v0, 4
syscall
L_112:
lw $t5, 20($sp)
move $a0, $t5
li $v0, 1
syscall
L_113:
la $a0, s5
li $v0, 4
syscall
L_114:
lw $t6, 136($sp)
move $a0, $t6
li $v0, 1
syscall
L_115:
la $a0, s6
li $v0, 4
syscall
L_116:
b L_106
L_117:
lw $s7, 140($sp)
li $s7,1
sw $s7, 140($sp)
L_118:
lw $t5, 20($sp)
lw $s7, 140($sp)
move $t5, $s7
sw $t5, 20($sp)
L_119:
lw $t5, 144($sp)
li $t5,20
sw $t5, 144($sp)
L_120:
lw $t5, 20($sp)
lw $t0, 144($sp)
lw $s6, 148($sp)
sle $s6, $t5, $t0
sw $s6, 148($sp)
L_121:
lw $s6, 148($sp)
beqz $s6, L_152
L_122:
b L_127
L_123:
lw $s4, 152($sp)
li $s4,1
sw $s4, 152($sp)
L_124:
lw $t5, 20($sp)
lw $s4, 152($sp)
lw $s5, 156($sp)
add $s5, $t5, $s4
sw $s5, 156($sp)
L_125:
lw $t5, 20($sp)
lw $s5, 156($sp)
move $t5, $s5
sw $t5, 20($sp)
L_126:
b L_119
L_127:
lw $t5, 160($sp)
li $t5,1
sw $t5, 160($sp)
L_128:
lw $t5, 20($sp)
lw $s3, 160($sp)
lw $s2, 164($sp)
add $s2, $t5, $s3
sw $s2, 164($sp)
L_129:
lw $s2, 136($sp)
lw $s1, 164($sp)
move $s2, $s1
sw $s2, 136($sp)
L_130:
lw $s2, 168($sp)
li $s2,20
sw $s2, 168($sp)
L_131:
lw $s2, 136($sp)
lw $t7, 168($sp)
lw $s0, 172($sp)
sle $s0, $s2, $t7
sw $s0, 172($sp)
L_132:
lw $s0, 172($sp)
beqz $s0, L_151
L_133:
b L_138
L_134:
lw $t4, 176($sp)
li $t4,1
sw $t4, 176($sp)
L_135:
lw $s2, 136($sp)
lw $t4, 176($sp)
lw $t3, 180($sp)
add $t3, $s2, $t4
sw $t3, 180($sp)
L_136:
lw $s2, 136($sp)
lw $t3, 180($sp)
move $s2, $t3
sw $s2, 136($sp)
L_137:
b L_130
L_138:
lw $s2, 4($sp)
sw $s2, -32($sp)
L_139:
lw $t5, 20($sp)
sw $t5, -28($sp)
L_140:
lw $t2, 136($sp)
sw $t2, -24($sp)
L_141:
sub $sp, $sp, 36
jal A_gcd
add $sp, $sp, 36
L_142:
lw $t1, 184($sp)
move $t1, $v0
sw $t1, 184($sp)
L_143:
la $a0, s7
li $v0, 4
syscall
L_144:
lw $t5, 20($sp)
move $a0, $t5
li $v0, 1
syscall
L_145:
la $a0, s8
li $v0, 4
syscall
L_146:
lw $t2, 136($sp)
move $a0, $t2
li $v0, 1
syscall
L_147:
la $a0, s9
li $v0, 4
syscall
L_148:
lw $t1, 184($sp)
move $a0, $t1
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
sub $sp, $sp, 188
jal A_Main
add $sp, $sp, 188
L_154:
li $v0, 10
syscall
