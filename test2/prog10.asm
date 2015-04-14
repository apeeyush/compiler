.data
s1:	.asciiz	"\n"
s0:	.asciiz	"Minimum = "

.text
main:
b Main_Main
L_0:
segTree_initialize:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
lw $s6, 4($sp)
sw $s7, 20000($s6)
L_3:
lw $s5, 16($sp)
li $s5,0
sw $s5, 16($sp)
L_4:
lw $s5, 12($sp)
lw $s4, 16($sp)
move $s5, $s4
sw $s5, 12($sp)
L_5:
lw $s5, 20($sp)
lw $s3, 4($sp)
lw $s5, 20000($s3)
sw $s5, 20($sp)
L_6:
lw $s5, 12($sp)
lw $s2, 20($sp)
lw $s1, 24($sp)
slt $s1, $s5, $s2
sw $s1, 24($sp)
L_7:
lw $s1, 24($sp)
beqz $s1, L_17
L_8:
b L_13
L_9:
lw $s0, 28($sp)
li $s0,1
sw $s0, 28($sp)
L_10:
lw $s5, 12($sp)
lw $s0, 28($sp)
lw $t7, 32($sp)
add $t7, $s5, $s0
sw $t7, 32($sp)
L_11:
lw $s5, 12($sp)
lw $t7, 32($sp)
move $s5, $t7
sw $s5, 12($sp)
L_12:
b L_5
L_13:
lw $s5, 36($sp)
li $s5,0
sw $s5, 36($sp)
L_14:
lw $s5, 12($sp)
lw $t6, 36($sp)
li $t5, 4
mult $s5, $t5
mflo $t5
addi $t5, $t5, 16000
lw $t4, 4($sp)
add $t5, $t4, $t5
sw $t6, ($t5)
L_15:
lw $s5, 12($sp)
lw $t3, 40($sp)
li $t2, 4
mult $s5, $t2
mflo $t2
addi $t2, $t2, 16000
lw $t1, 4($sp)
add $t2, $t1, $t2
lw $t3, ($t2)
sw $t3, 40($sp)
L_16:
b L_9
L_17:
lw $t3, 36($sp)
li $t3,0
sw $t3, 36($sp)
L_18:
lw $s5, 12($sp)
lw $t3, 36($sp)
move $s5, $t3
sw $s5, 12($sp)
L_19:
lw $s5, 40($sp)
lw $t0, 4($sp)
lw $s5, 20000($t0)
sw $s5, 40($sp)
L_20:
lw $s5, 44($sp)
li $s5,4
sw $s5, 44($sp)
L_21:
lw $s5, 40($sp)
lw $s7, 44($sp)
lw $s6, 48($sp)
mult $s5, $s7
mflo $s6
sw $s6, 48($sp)
L_22:
lw $s6, 12($sp)
lw $s4, 48($sp)
lw $s3, 52($sp)
slt $s3, $s6, $s4
sw $s3, 52($sp)
L_23:
lw $s3, 52($sp)
beqz $s3, L_33
L_24:
b L_29
L_25:
lw $s2, 56($sp)
li $s2,1
sw $s2, 56($sp)
L_26:
lw $s6, 12($sp)
lw $s2, 56($sp)
lw $s1, 60($sp)
add $s1, $s6, $s2
sw $s1, 60($sp)
L_27:
lw $s6, 12($sp)
lw $s1, 60($sp)
move $s6, $s1
sw $s6, 12($sp)
L_28:
b L_19
L_29:
lw $s6, 64($sp)
li $s6,0
sw $s6, 64($sp)
L_30:
lw $s6, 12($sp)
lw $s0, 64($sp)
li $t7, 4
mult $s6, $t7
mflo $t7
addi $t7, $t7, 0
lw $t6, 4($sp)
add $t7, $t6, $t7
sw $s0, ($t7)
L_31:
lw $s6, 12($sp)
lw $t5, 68($sp)
li $t4, 4
mult $s6, $t4
mflo $t4
addi $t4, $t4, 0
lw $t2, 4($sp)
add $t4, $t2, $t4
lw $t5, ($t4)
sw $t5, 68($sp)
L_32:
b L_25
L_33:
lw $ra, 0($sp)
jr $ra
L_34:
segTree_query:
L_35:
sw $ra, 0($sp)
L_36:
lw $t5, 12($sp)
lw $t1, 24($sp)
lw $t3, 28($sp)
sgt $t3, $t5, $t1
sw $t3, 28($sp)
L_37:
lw $t3, 32($sp)
li $t3,1
sw $t3, 32($sp)
L_38:
lw $t3, 28($sp)
lw $t0, 32($sp)
beq $t3, $t0, L_42
L_39:
lw $s5, 20($sp)
lw $s7, 16($sp)
lw $s4, 36($sp)
sgt $s4, $s5, $s7
sw $s4, 36($sp)
L_40:
lw $s4, 40($sp)
lw $s3, 36($sp)
move $s4, $s3
sw $s4, 40($sp)
L_41:
b L_43
L_42:
lw $s4, 40($sp)
li $s4,1
sw $s4, 40($sp)
L_43:
lw $s4, 40($sp)
beqz $s4, L_47
L_44:
lw $s2, 44($sp)
li $s2,100000000
sw $s2, 44($sp)
L_45:
lw $s2, 44($sp)
move $v0, $s2
L_46:
lw $ra, 0($sp)
jr $ra
L_47:
lw $t5, 12($sp)
lw $s5, 20($sp)
lw $s1, 44($sp)
sge $s1, $t5, $s5
sw $s1, 44($sp)
L_48:
lw $s1, 48($sp)
li $s1,0
sw $s1, 48($sp)
L_49:
lw $s1, 44($sp)
lw $s6, 48($sp)
beq $s1, $s6, L_53
L_50:
lw $s7, 16($sp)
lw $t1, 24($sp)
lw $s0, 52($sp)
sle $s0, $s7, $t1
sw $s0, 52($sp)
L_51:
lw $s0, 56($sp)
lw $t7, 52($sp)
move $s0, $t7
sw $s0, 56($sp)
L_52:
b L_54
L_53:
lw $s0, 56($sp)
li $s0,0
sw $s0, 56($sp)
L_54:
lw $s0, 56($sp)
beqz $s0, L_58
L_55:
lw $t6, 8($sp)
lw $t4, 60($sp)
li $t2, 4
mult $t6, $t2
mflo $t2
addi $t2, $t2, 0
lw $t5, 4($sp)
add $t2, $t5, $t2
lw $t4, ($t2)
sw $t4, 60($sp)
L_56:
lw $t4, 60($sp)
move $v0, $t4
L_57:
lw $ra, 0($sp)
jr $ra
L_58:
lw $t1, 12($sp)
lw $s7, 16($sp)
lw $t3, 60($sp)
add $t3, $t1, $s7
sw $t3, 60($sp)
L_59:
lw $t3, 64($sp)
li $t3,2
sw $t3, 64($sp)
L_60:
lw $t3, 60($sp)
lw $t0, 64($sp)
lw $s5, 68($sp)
div $t3, $t0
mflo $s5
sw $s5, 68($sp)
L_61:
lw $s5, 72($sp)
lw $s7, 68($sp)
move $s5, $s7
sw $s5, 72($sp)
L_62:
lw $s5, 76($sp)
li $s5,2
sw $s5, 76($sp)
L_63:
lw $s5, 76($sp)
lw $t6, 8($sp)
lw $s3, 80($sp)
mult $s5, $t6
mflo $s3
sw $s3, 80($sp)
L_64:
lw $s3, 84($sp)
li $s3,1
sw $s3, 84($sp)
L_65:
lw $s3, 80($sp)
lw $s4, 84($sp)
lw $s2, 88($sp)
add $s2, $s3, $s4
sw $s2, 88($sp)
L_66:
lw $s2, 4($sp)
sw $s2, -136($sp)
L_67:
lw $s1, 88($sp)
sw $s1, -132($sp)
L_68:
lw $t1, 12($sp)
sw $t1, -128($sp)
L_69:
lw $s6, 72($sp)
sw $s6, -124($sp)
L_70:
lw $t7, 20($sp)
sw $t7, -120($sp)
L_71:
lw $s0, 24($sp)
sw $s0, -116($sp)
L_72:
sub $sp, $sp, 140
jal segTree_query
add $sp, $sp, 140
L_73:
lw $t6, 92($sp)
move $t6, $v0
sw $t6, 92($sp)
L_74:
lw $t6, 96($sp)
lw $t2, 92($sp)
move $t6, $t2
sw $t6, 96($sp)
L_75:
lw $t6, 100($sp)
li $t6,2
sw $t6, 100($sp)
L_76:
lw $t6, 100($sp)
lw $t5, 8($sp)
lw $t4, 104($sp)
mult $t6, $t5
mflo $t4
sw $t4, 104($sp)
L_77:
lw $t4, 108($sp)
li $t4,2
sw $t4, 108($sp)
L_78:
lw $t4, 104($sp)
lw $t1, 108($sp)
lw $t3, 112($sp)
add $t3, $t4, $t1
sw $t3, 112($sp)
L_79:
lw $t3, 116($sp)
li $t3,1
sw $t3, 116($sp)
L_80:
lw $s6, 72($sp)
lw $t3, 116($sp)
lw $t0, 120($sp)
add $t0, $s6, $t3
sw $t0, 120($sp)
L_81:
lw $t0, 4($sp)
sw $t0, -136($sp)
L_82:
lw $s7, 112($sp)
sw $s7, -132($sp)
L_83:
lw $s5, 120($sp)
sw $s5, -128($sp)
L_84:
lw $s3, 16($sp)
sw $s3, -124($sp)
L_85:
lw $t7, 20($sp)
sw $t7, -120($sp)
L_86:
lw $s0, 24($sp)
sw $s0, -116($sp)
L_87:
sub $sp, $sp, 140
jal segTree_query
add $sp, $sp, 140
L_88:
lw $s4, 124($sp)
move $s4, $v0
sw $s4, 124($sp)
L_89:
lw $s4, 128($sp)
lw $s2, 124($sp)
move $s4, $s2
sw $s4, 128($sp)
L_90:
lw $s4, 96($sp)
lw $s1, 128($sp)
lw $s6, 132($sp)
slt $s6, $s4, $s1
sw $s6, 132($sp)
L_91:
lw $s6, 132($sp)
beqz $s6, L_94
L_92:
lw $t7, 136($sp)
lw $s4, 96($sp)
move $t7, $s4
sw $t7, 136($sp)
L_93:
b L_95
L_94:
lw $t7, 136($sp)
lw $s1, 128($sp)
move $t7, $s1
sw $t7, 136($sp)
L_95:
lw $t7, 136($sp)
move $v0, $t7
L_96:
lw $ra, 0($sp)
jr $ra
L_97:
lw $ra, 0($sp)
jr $ra
L_98:
segTree_update:
L_99:
sw $ra, 0($sp)
L_100:
lw $s0, 20($sp)
lw $t2, 12($sp)
lw $t6, 28($sp)
sge $t6, $s0, $t2
sw $t6, 28($sp)
L_101:
lw $t6, 32($sp)
li $t6,0
sw $t6, 32($sp)
L_102:
lw $t6, 28($sp)
lw $t5, 32($sp)
beq $t6, $t5, L_106
L_103:
lw $t4, 16($sp)
lw $s0, 20($sp)
lw $t1, 36($sp)
sge $t1, $t4, $s0
sw $t1, 36($sp)
L_104:
lw $t1, 40($sp)
lw $t3, 36($sp)
move $t1, $t3
sw $t1, 40($sp)
L_105:
b L_107
L_106:
lw $t1, 40($sp)
li $t1,0
sw $t1, 40($sp)
L_107:
lw $t1, 40($sp)
beqz $t1, L_160
L_108:
lw $t2, 12($sp)
lw $t4, 16($sp)
lw $t0, 44($sp)
seq $t0, $t2, $t4
sw $t0, 44($sp)
L_109:
lw $t0, 44($sp)
beqz $t0, L_117
L_110:
lw $s0, 20($sp)
lw $s7, 24($sp)
li $s5, 4
mult $s0, $s5
mflo $s5
addi $s5, $s5, 16000
lw $s3, 4($sp)
add $s5, $s3, $s5
sw $s7, ($s5)
L_111:
lw $s0, 20($sp)
lw $s2, 48($sp)
li $s4, 4
mult $s0, $s4
mflo $s4
addi $s4, $s4, 16000
lw $s1, 4($sp)
add $s4, $s1, $s4
lw $s2, ($s4)
sw $s2, 48($sp)
L_112:
lw $s2, 8($sp)
lw $s7, 24($sp)
li $s6, 4
mult $s2, $s6
mflo $s6
addi $s6, $s6, 0
lw $t7, 4($sp)
add $s6, $t7, $s6
sw $s7, ($s6)
L_113:
lw $s2, 8($sp)
lw $s0, 52($sp)
li $t2, 4
mult $s2, $t2
mflo $t2
addi $t2, $t2, 0
lw $t6, 4($sp)
add $t2, $t6, $t2
lw $s0, ($t2)
sw $s0, 52($sp)
L_114:
lw $s2, 8($sp)
lw $s0, 56($sp)
li $t5, 4
mult $s2, $t5
mflo $t5
addi $t5, $t5, 0
lw $t4, 4($sp)
add $t5, $t4, $t5
lw $s0, ($t5)
sw $s0, 56($sp)
L_115:
lw $s0, 56($sp)
move $v0, $s0
L_116:
lw $ra, 0($sp)
jr $ra
L_117:
lw $t3, 12($sp)
lw $t1, 16($sp)
lw $t0, 48($sp)
add $t0, $t3, $t1
sw $t0, 48($sp)
L_118:
lw $t0, 52($sp)
li $t0,2
sw $t0, 52($sp)
L_119:
lw $t0, 48($sp)
lw $s7, 52($sp)
lw $s5, 56($sp)
div $t0, $s7
mflo $s5
sw $s5, 56($sp)
L_120:
lw $s5, 60($sp)
lw $s3, 56($sp)
move $s5, $s3
sw $s5, 60($sp)
L_121:
lw $s5, 64($sp)
li $s5,2
sw $s5, 64($sp)
L_122:
lw $s5, 64($sp)
lw $s2, 8($sp)
lw $s4, 68($sp)
mult $s5, $s2
mflo $s4
sw $s4, 68($sp)
L_123:
lw $s4, 72($sp)
li $s4,1
sw $s4, 72($sp)
L_124:
lw $s4, 68($sp)
lw $s1, 72($sp)
lw $s2, 76($sp)
add $s2, $s4, $s1
sw $s2, 76($sp)
L_125:
lw $s2, 4($sp)
sw $s2, -124($sp)
L_126:
lw $s6, 76($sp)
sw $s6, -120($sp)
L_127:
lw $t3, 12($sp)
sw $t3, -116($sp)
L_128:
lw $t7, 60($sp)
sw $t7, -112($sp)
L_129:
lw $t2, 20($sp)
sw $t2, -108($sp)
L_130:
lw $t6, 24($sp)
sw $t6, -104($sp)
L_131:
sub $sp, $sp, 128
jal segTree_update
add $sp, $sp, 128
L_132:
lw $t5, 80($sp)
move $t5, $v0
sw $t5, 80($sp)
L_133:
lw $t5, 84($sp)
lw $t4, 80($sp)
move $t5, $t4
sw $t5, 84($sp)
L_134:
lw $t5, 88($sp)
li $t5,2
sw $t5, 88($sp)
L_135:
lw $t5, 88($sp)
lw $s0, 8($sp)
lw $t3, 92($sp)
mult $t5, $s0
mflo $t3
sw $t3, 92($sp)
L_136:
lw $t3, 96($sp)
li $t3,2
sw $t3, 96($sp)
L_137:
lw $t3, 92($sp)
lw $t1, 96($sp)
lw $t0, 100($sp)
add $t0, $t3, $t1
sw $t0, 100($sp)
L_138:
lw $t0, 104($sp)
li $t0,1
sw $t0, 104($sp)
L_139:
lw $t7, 60($sp)
lw $t0, 104($sp)
lw $s7, 108($sp)
add $s7, $t7, $t0
sw $s7, 108($sp)
L_140:
lw $s7, 4($sp)
sw $s7, -124($sp)
L_141:
lw $s3, 100($sp)
sw $s3, -120($sp)
L_142:
lw $s5, 108($sp)
sw $s5, -116($sp)
L_143:
lw $s4, 16($sp)
sw $s4, -112($sp)
L_144:
lw $t2, 20($sp)
sw $t2, -108($sp)
L_145:
lw $t6, 24($sp)
sw $t6, -104($sp)
L_146:
sub $sp, $sp, 128
jal segTree_update
add $sp, $sp, 128
L_147:
lw $s1, 112($sp)
move $s1, $v0
sw $s1, 112($sp)
L_148:
lw $s1, 116($sp)
lw $s2, 112($sp)
move $s1, $s2
sw $s1, 116($sp)
L_149:
lw $s1, 84($sp)
lw $s6, 116($sp)
lw $t7, 120($sp)
slt $t7, $s1, $s6
sw $t7, 120($sp)
L_150:
lw $t7, 120($sp)
beqz $t7, L_154
L_151:
lw $s0, 8($sp)
lw $s1, 84($sp)
li $t2, 4
mult $s0, $t2
mflo $t2
addi $t2, $t2, 0
lw $t6, 4($sp)
add $t2, $t6, $t2
sw $s1, ($t2)
L_152:
lw $s0, 8($sp)
lw $t4, 124($sp)
li $t5, 4
mult $s0, $t5
mflo $t5
addi $t5, $t5, 0
lw $s0, 4($sp)
add $t5, $s0, $t5
lw $t4, ($t5)
sw $t4, 124($sp)
L_153:
b L_156
L_154:
lw $t4, 8($sp)
lw $s6, 116($sp)
li $t3, 4
mult $t4, $t3
mflo $t3
addi $t3, $t3, 0
lw $t1, 4($sp)
add $t3, $t1, $t3
sw $s6, ($t3)
L_155:
lw $t4, 8($sp)
lw $t0, 124($sp)
li $s7, 4
mult $t4, $s7
mflo $s7
addi $s7, $s7, 0
lw $s3, 4($sp)
add $s7, $s3, $s7
lw $t0, ($s7)
sw $t0, 124($sp)
L_156:
lw $t4, 8($sp)
lw $t0, 124($sp)
li $s5, 4
mult $t4, $s5
mflo $s5
addi $s5, $s5, 0
lw $s4, 4($sp)
add $s5, $s4, $s5
lw $t0, ($s5)
sw $t0, 124($sp)
L_157:
lw $t0, 124($sp)
move $v0, $t0
L_158:
lw $ra, 0($sp)
jr $ra
L_159:
b L_163
L_160:
lw $t4, 8($sp)
lw $s2, 44($sp)
li $s1, 4
mult $t4, $s1
mflo $s1
addi $s1, $s1, 0
lw $s6, 4($sp)
add $s1, $s6, $s1
lw $s2, ($s1)
sw $s2, 44($sp)
L_161:
lw $s2, 44($sp)
move $v0, $s2
L_162:
lw $ra, 0($sp)
jr $ra
L_163:
lw $ra, 0($sp)
jr $ra
L_164:
Main_Main:
L_165:
sw $ra, 0($sp)
L_166:
li $a0, 20004
li $v0, 9
syscall
lw $t7, 8($sp)
move $t7, $v0
sw $t7, 8($sp)
L_167:
lw $t7, 12($sp)
lw $t2, 8($sp)
move $t7, $t2
sw $t7, 12($sp)
L_168:
lw $t7, 16($sp)
li $t7,20
sw $t7, 16($sp)
L_169:
lw $t7, 12($sp)
sw $t7, -68($sp)
L_170:
lw $t6, 16($sp)
sw $t6, -64($sp)
L_171:
sub $sp, $sp, 72
jal segTree_initialize
add $sp, $sp, 72
L_172:
lw $t5, 20($sp)
li $v0, 5
syscall
move $t5, $v0
sw $t5, 20($sp)
L_173:
lw $t5, 36($sp)
li $t5,0
sw $t5, 36($sp)
L_174:
lw $t5, 20($sp)
lw $s0, 36($sp)
lw $t4, 40($sp)
sgt $t4, $t5, $s0
sw $t4, 40($sp)
L_175:
lw $t4, 40($sp)
beqz $t4, L_217
L_176:
lw $t3, 44($sp)
li $t3,1
sw $t3, 44($sp)
L_177:
lw $t5, 20($sp)
lw $t3, 44($sp)
lw $t1, 48($sp)
sub $t1, $t5, $t3
sw $t1, 48($sp)
L_178:
lw $t5, 20($sp)
lw $t1, 48($sp)
move $t5, $t1
sw $t5, 20($sp)
L_179:
lw $t5, 24($sp)
li $v0, 5
syscall
move $t5, $v0
sw $t5, 24($sp)
L_180:
lw $t5, 28($sp)
li $v0, 5
syscall
move $t5, $v0
sw $t5, 28($sp)
L_181:
lw $t5, 32($sp)
li $v0, 5
syscall
move $t5, $v0
sw $t5, 32($sp)
L_182:
lw $t5, 52($sp)
li $t5,0
sw $t5, 52($sp)
L_183:
lw $t5, 24($sp)
lw $s7, 52($sp)
lw $s3, 56($sp)
seq $s3, $t5, $s7
sw $s3, 56($sp)
L_184:
lw $s3, 56($sp)
beqz $s3, L_199
L_185:
lw $s5, 60($sp)
li $s5,0
sw $s5, 60($sp)
L_186:
lw $s5, 64($sp)
li $s5,0
sw $s5, 64($sp)
L_187:
lw $s5, 68($sp)
lw $s4, 12($sp)
lw $s5, 20000($s4)
sw $s5, 68($sp)
L_188:
lw $s5, 72($sp)
li $s5,1
sw $s5, 72($sp)
L_189:
lw $s5, 68($sp)
lw $t0, 72($sp)
lw $s1, 76($sp)
sub $s1, $s5, $t0
sw $s1, 76($sp)
L_190:
lw $s1, 12($sp)
sw $s1, -124($sp)
L_191:
lw $s6, 60($sp)
sw $s6, -120($sp)
L_192:
lw $s2, 64($sp)
sw $s2, -116($sp)
L_193:
lw $t2, 76($sp)
sw $t2, -112($sp)
L_194:
lw $t7, 28($sp)
sw $t7, -108($sp)
L_195:
lw $t6, 32($sp)
sw $t6, -104($sp)
L_196:
sub $sp, $sp, 128
jal segTree_update
add $sp, $sp, 128
L_197:
lw $s0, 80($sp)
move $s0, $v0
sw $s0, 80($sp)
L_198:
b L_216
L_199:
lw $s0, 60($sp)
li $s0,0
sw $s0, 60($sp)
L_200:
lw $s0, 64($sp)
li $s0,0
sw $s0, 64($sp)
L_201:
lw $s0, 68($sp)
lw $s4, 12($sp)
lw $s0, 20000($s4)
sw $s0, 68($sp)
L_202:
lw $s0, 72($sp)
li $s0,1
sw $s0, 72($sp)
L_203:
lw $s0, 68($sp)
lw $t4, 72($sp)
lw $t3, 76($sp)
sub $t3, $s0, $t4
sw $t3, 76($sp)
L_204:
lw $t3, 12($sp)
sw $t3, -136($sp)
L_205:
lw $t1, 60($sp)
sw $t1, -132($sp)
L_206:
lw $t5, 64($sp)
sw $t5, -128($sp)
L_207:
lw $s7, 76($sp)
sw $s7, -124($sp)
L_208:
lw $t7, 28($sp)
sw $t7, -120($sp)
L_209:
lw $t6, 32($sp)
sw $t6, -116($sp)
L_210:
sub $sp, $sp, 140
jal segTree_query
add $sp, $sp, 140
L_211:
lw $s3, 80($sp)
move $s3, $v0
sw $s3, 80($sp)
L_212:
lw $s3, 84($sp)
lw $s4, 80($sp)
move $s3, $s4
sw $s3, 84($sp)
L_213:
la $a0, s0
li $v0, 4
syscall
L_214:
lw $s3, 84($sp)
move $a0, $s3
li $v0, 1
syscall
L_215:
la $a0, s1
li $v0, 4
syscall
L_216:
b L_173
L_217:
lw $ra, 0($sp)
jr $ra
L_218:
sub $sp, $sp, 88
jal Main_Main
add $sp, $sp, 88
L_219:
li $v0, 10
syscall
