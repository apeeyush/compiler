.data
s2:	.asciiz	"\n"
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"

.text
main:
b B_Main
L_0:
EnumProgram_Merge:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 100($sp)
li $s7,0
sw $s7, 100($sp)
L_3:
lw $s7, 104($sp)
li $s7,1
sw $s7, 104($sp)
L_4:
lw $s7, 12($sp)
lw $s6, 104($sp)
lw $s5, 108($sp)
add $s5, $s7, $s6
sw $s5, 108($sp)
L_5:
lw $s5, 112($sp)
lw $s4, 100($sp)
move $s5, $s4
sw $s5, 112($sp)
L_6:
lw $s5, 116($sp)
lw $s3, 8($sp)
move $s5, $s3
sw $s5, 116($sp)
L_7:
lw $s5, 120($sp)
lw $s2, 108($sp)
move $s5, $s2
sw $s5, 120($sp)
L_8:
lw $s5, 116($sp)
lw $s7, 12($sp)
lw $s1, 124($sp)
sle $s1, $s5, $s7
sw $s1, 124($sp)
L_9:
lw $s1, 128($sp)
li $s1,0
sw $s1, 128($sp)
L_10:
lw $s1, 124($sp)
lw $s0, 128($sp)
beq $s1, $s0, L_14
L_11:
lw $t7, 120($sp)
lw $t6, 16($sp)
lw $t5, 132($sp)
sle $t5, $t7, $t6
sw $t5, 132($sp)
L_12:
lw $t5, 136($sp)
lw $t4, 132($sp)
move $t5, $t4
sw $t5, 136($sp)
L_13:
b L_15
L_14:
lw $t5, 136($sp)
li $t5,0
sw $t5, 136($sp)
L_15:
lw $t5, 136($sp)
beqz $t5, L_40
L_16:
lw $s5, 116($sp)
lw $t3, 140($sp)
li $t2, 4
mult $s5, $t2
mflo $t2
addi $t2, $t2, 0
lw $t1, 4($sp)
add $t2, $t1, $t2
lw $t3, ($t2)
sw $t3, 140($sp)
L_17:
lw $t7, 120($sp)
lw $t3, 144($sp)
li $t0, 4
mult $t7, $t0
mflo $t0
addi $t0, $t0, 0
lw $s7, 4($sp)
add $t0, $s7, $t0
lw $t3, ($t0)
sw $t3, 144($sp)
L_18:
lw $t3, 140($sp)
lw $s6, 144($sp)
lw $s4, 148($sp)
slt $s4, $t3, $s6
sw $s4, 148($sp)
L_19:
lw $s4, 148($sp)
beqz $s4, L_30
L_20:
lw $s5, 116($sp)
lw $s3, 152($sp)
li $s2, 4
mult $s5, $s2
mflo $s2
addi $s2, $s2, 0
lw $s5, 4($sp)
add $s2, $s5, $s2
lw $s3, ($s2)
sw $s3, 152($sp)
L_21:
lw $s3, 112($sp)
lw $s1, 152($sp)
li $s0, 4
mult $s3, $s0
mflo $s0
addi $s0, $s0, 20
add $s0, $sp, $s0
sw $s1, ($s0)
L_22:
lw $s3, 112($sp)
lw $t7, 156($sp)
li $t6, 4
mult $s3, $t6
mflo $t6
addi $t6, $t6, 20
add $t6, $sp, $t6
lw $t7, ($t6)
sw $t7, 156($sp)
L_23:
lw $t7, 160($sp)
li $t7,1
sw $t7, 160($sp)
L_24:
lw $t7, 160($sp)
lw $t4, 116($sp)
lw $t5, 164($sp)
add $t5, $t7, $t4
sw $t5, 164($sp)
L_25:
lw $t4, 116($sp)
lw $t5, 164($sp)
move $t4, $t5
sw $t4, 116($sp)
L_26:
lw $t4, 168($sp)
li $t4,1
sw $t4, 168($sp)
L_27:
lw $t4, 168($sp)
lw $s3, 112($sp)
lw $t2, 172($sp)
add $t2, $t4, $s3
sw $t2, 172($sp)
L_28:
lw $s3, 112($sp)
lw $t2, 172($sp)
move $s3, $t2
sw $s3, 112($sp)
L_29:
b L_39
L_30:
lw $s3, 120($sp)
lw $t1, 152($sp)
li $t0, 4
mult $s3, $t0
mflo $t0
addi $t0, $t0, 0
lw $s7, 4($sp)
add $t0, $s7, $t0
lw $t1, ($t0)
sw $t1, 152($sp)
L_31:
lw $t1, 112($sp)
lw $t3, 152($sp)
li $s6, 4
mult $t1, $s6
mflo $s6
addi $s6, $s6, 20
add $s6, $sp, $s6
sw $t3, ($s6)
L_32:
lw $t1, 112($sp)
lw $s4, 156($sp)
li $s2, 4
mult $t1, $s2
mflo $s2
addi $s2, $s2, 20
add $s2, $sp, $s2
lw $s4, ($s2)
sw $s4, 156($sp)
L_33:
lw $s4, 160($sp)
li $s4,1
sw $s4, 160($sp)
L_34:
lw $s4, 160($sp)
lw $s3, 120($sp)
lw $s5, 164($sp)
add $s5, $s4, $s3
sw $s5, 164($sp)
L_35:
lw $s3, 120($sp)
lw $s5, 164($sp)
move $s3, $s5
sw $s3, 120($sp)
L_36:
lw $s3, 168($sp)
li $s3,1
sw $s3, 168($sp)
L_37:
lw $s3, 168($sp)
lw $t1, 112($sp)
lw $s1, 172($sp)
add $s1, $s3, $t1
sw $s1, 172($sp)
L_38:
lw $t1, 112($sp)
lw $s1, 172($sp)
move $t1, $s1
sw $t1, 112($sp)
L_39:
b L_8
L_40:
lw $t1, 116($sp)
lw $s0, 12($sp)
lw $t6, 140($sp)
sle $t6, $t1, $s0
sw $t6, 140($sp)
L_41:
lw $t6, 140($sp)
beqz $t6, L_52
L_42:
lw $t1, 116($sp)
lw $t7, 144($sp)
li $t5, 4
mult $t1, $t5
mflo $t5
addi $t5, $t5, 0
lw $t4, 4($sp)
add $t5, $t4, $t5
lw $t7, ($t5)
sw $t7, 144($sp)
L_43:
lw $t7, 112($sp)
lw $t2, 144($sp)
li $t0, 4
mult $t7, $t0
mflo $t0
addi $t0, $t0, 20
add $t0, $sp, $t0
sw $t2, ($t0)
L_44:
lw $t7, 112($sp)
lw $s7, 148($sp)
li $t3, 4
mult $t7, $t3
mflo $t3
addi $t3, $t3, 20
add $t3, $sp, $t3
lw $s7, ($t3)
sw $s7, 148($sp)
L_45:
lw $s7, 152($sp)
li $s7,1
sw $s7, 152($sp)
L_46:
lw $s7, 152($sp)
lw $t1, 116($sp)
lw $s6, 156($sp)
add $s6, $s7, $t1
sw $s6, 156($sp)
L_47:
lw $t1, 116($sp)
lw $s6, 156($sp)
move $t1, $s6
sw $t1, 116($sp)
L_48:
lw $t1, 160($sp)
li $t1,1
sw $t1, 160($sp)
L_49:
lw $t1, 160($sp)
lw $t7, 112($sp)
lw $s2, 164($sp)
add $s2, $t1, $t7
sw $s2, 164($sp)
L_50:
lw $t7, 112($sp)
lw $s2, 164($sp)
move $t7, $s2
sw $t7, 112($sp)
L_51:
b L_40
L_52:
lw $t7, 120($sp)
lw $s4, 16($sp)
lw $s5, 144($sp)
sle $s5, $t7, $s4
sw $s5, 144($sp)
L_53:
lw $s5, 144($sp)
beqz $s5, L_64
L_54:
lw $t7, 120($sp)
lw $s3, 148($sp)
li $s1, 4
mult $t7, $s1
mflo $s1
addi $s1, $s1, 0
lw $s0, 4($sp)
add $s1, $s0, $s1
lw $s3, ($s1)
sw $s3, 148($sp)
L_55:
lw $s3, 112($sp)
lw $t6, 148($sp)
li $t5, 4
mult $s3, $t5
mflo $t5
addi $t5, $t5, 20
add $t5, $sp, $t5
sw $t6, ($t5)
L_56:
lw $s3, 112($sp)
lw $t4, 152($sp)
li $t2, 4
mult $s3, $t2
mflo $t2
addi $t2, $t2, 20
add $t2, $sp, $t2
lw $t4, ($t2)
sw $t4, 152($sp)
L_57:
lw $t4, 156($sp)
li $t4,1
sw $t4, 156($sp)
L_58:
lw $t4, 156($sp)
lw $t7, 120($sp)
lw $t0, 160($sp)
add $t0, $t4, $t7
sw $t0, 160($sp)
L_59:
lw $t7, 120($sp)
lw $t0, 160($sp)
move $t7, $t0
sw $t7, 120($sp)
L_60:
lw $t7, 164($sp)
li $t7,1
sw $t7, 164($sp)
L_61:
lw $t7, 164($sp)
lw $s3, 112($sp)
lw $t3, 168($sp)
add $t3, $t7, $s3
sw $t3, 168($sp)
L_62:
lw $s3, 112($sp)
lw $t3, 168($sp)
move $s3, $t3
sw $s3, 112($sp)
L_63:
b L_52
L_64:
lw $s3, 152($sp)
li $s3,0
sw $s3, 152($sp)
L_65:
lw $s3, 148($sp)
lw $s7, 152($sp)
move $s3, $s7
sw $s3, 148($sp)
L_66:
lw $s3, 148($sp)
lw $s6, 112($sp)
lw $t1, 156($sp)
slt $t1, $s3, $s6
sw $t1, 156($sp)
L_67:
lw $t1, 156($sp)
beqz $t1, L_77
L_68:
b L_72
L_69:
lw $s2, 160($sp)
li $s2,1
sw $s2, 160($sp)
L_70:
lw $s2, 160($sp)
lw $s3, 148($sp)
add $s3, $s3, $s2
sw $s3, 148($sp)
L_71:
b L_66
L_72:
lw $s3, 148($sp)
lw $s4, 8($sp)
lw $s5, 164($sp)
add $s5, $s3, $s4
sw $s5, 164($sp)
L_73:
lw $s3, 148($sp)
lw $s5, 168($sp)
li $s1, 4
mult $s3, $s1
mflo $s1
addi $s1, $s1, 20
add $s1, $sp, $s1
lw $s5, ($s1)
sw $s5, 168($sp)
L_74:
lw $s5, 164($sp)
lw $s0, 168($sp)
li $t6, 4
mult $s5, $t6
mflo $t6
addi $t6, $t6, 0
lw $t5, 4($sp)
add $t6, $t5, $t6
sw $s0, ($t6)
L_75:
lw $s5, 164($sp)
lw $t2, 172($sp)
li $t4, 4
mult $s5, $t4
mflo $t4
addi $t4, $t4, 0
lw $t0, 4($sp)
add $t4, $t0, $t4
lw $t2, ($t4)
sw $t2, 172($sp)
L_76:
b L_69
L_77:
lw $ra, 0($sp)
jr $ra
L_78:
lw $ra, 0($sp)
jr $ra
L_79:
EnumProgram_MergeSort:
L_80:
sw $ra, 0($sp)
L_81:
lw $t2, 8($sp)
lw $t7, 12($sp)
lw $t3, 16($sp)
add $t3, $t2, $t7
sw $t3, 16($sp)
L_82:
lw $t3, 20($sp)
li $t3,2
sw $t3, 20($sp)
L_83:
lw $t3, 16($sp)
lw $s7, 20($sp)
lw $s6, 24($sp)
div $t3, $s7
mflo $s6
sw $s6, 24($sp)
L_84:
lw $s6, 28($sp)
lw $t1, 24($sp)
move $s6, $t1
sw $s6, 28($sp)
L_85:
lw $t2, 8($sp)
lw $t7, 12($sp)
lw $s6, 32($sp)
slt $s6, $t2, $t7
sw $s6, 32($sp)
L_86:
lw $s6, 32($sp)
beqz $s6, L_102
L_87:
lw $s2, 4($sp)
sw $s2, -40($sp)
L_88:
lw $t2, 8($sp)
sw $t2, -36($sp)
L_89:
lw $s3, 28($sp)
sw $s3, -32($sp)
L_90:
sub $sp, $sp, 44
jal EnumProgram_MergeSort
add $sp, $sp, 44
L_91:
lw $s4, 36($sp)
li $s4,1
sw $s4, 36($sp)
L_92:
lw $s3, 28($sp)
lw $s4, 36($sp)
lw $s1, 40($sp)
add $s1, $s3, $s4
sw $s1, 40($sp)
L_93:
lw $s1, 4($sp)
sw $s1, -40($sp)
L_94:
lw $s5, 40($sp)
sw $s5, -36($sp)
L_95:
lw $t7, 12($sp)
sw $t7, -32($sp)
L_96:
sub $sp, $sp, 44
jal EnumProgram_MergeSort
add $sp, $sp, 44
L_97:
lw $s0, 4($sp)
sw $s0, -172($sp)
L_98:
lw $t2, 8($sp)
sw $t2, -168($sp)
L_99:
lw $s3, 28($sp)
sw $s3, -164($sp)
L_100:
lw $t7, 12($sp)
sw $t7, -160($sp)
L_101:
sub $sp, $sp, 176
jal EnumProgram_Merge
add $sp, $sp, 176
L_102:
lw $ra, 0($sp)
jr $ra
L_103:
EnumProgram_binary:
L_104:
sw $ra, 0($sp)
L_105:
lw $t6, 8($sp)
lw $t5, 12($sp)
lw $t4, 20($sp)
sgt $t4, $t6, $t5
sw $t4, 20($sp)
L_106:
lw $t4, 20($sp)
beqz $t4, L_111
L_107:
lw $t0, 24($sp)
li $t0,1
sw $t0, 24($sp)
L_108:
lw $t0, 24($sp)
lw $t2, 28($sp)
neg $t2, $t0
sw $t2, 28($sp)
L_109:
lw $t2, 28($sp)
move $v0, $t2
L_110:
lw $ra, 0($sp)
jr $ra
L_111:
lw $t6, 8($sp)
lw $t5, 12($sp)
lw $t7, 24($sp)
add $t7, $t6, $t5
sw $t7, 24($sp)
L_112:
lw $t7, 28($sp)
li $t7,2
sw $t7, 28($sp)
L_113:
lw $t7, 24($sp)
lw $t3, 28($sp)
lw $s7, 32($sp)
div $t7, $t3
mflo $s7
sw $s7, 32($sp)
L_114:
lw $s7, 36($sp)
lw $t1, 32($sp)
move $s7, $t1
sw $s7, 36($sp)
L_115:
lw $t6, 8($sp)
lw $t5, 12($sp)
lw $s7, 40($sp)
seq $s7, $t6, $t5
sw $s7, 40($sp)
L_116:
lw $s7, 40($sp)
beqz $s7, L_127
L_117:
lw $s6, 36($sp)
lw $s2, 44($sp)
li $s3, 4
mult $s6, $s3
mflo $s3
addi $s3, $s3, 0
lw $s4, 4($sp)
add $s3, $s4, $s3
lw $s2, ($s3)
sw $s2, 44($sp)
L_118:
lw $s2, 44($sp)
lw $s1, 16($sp)
lw $s5, 48($sp)
seq $s5, $s2, $s1
sw $s5, 48($sp)
L_119:
lw $s5, 48($sp)
beqz $s5, L_123
L_120:
lw $s6, 36($sp)
move $v0, $s6
L_121:
lw $ra, 0($sp)
jr $ra
L_122:
b L_127
L_123:
lw $s0, 52($sp)
li $s0,1
sw $s0, 52($sp)
L_124:
lw $s0, 52($sp)
lw $t6, 56($sp)
neg $t6, $s0
sw $t6, 56($sp)
L_125:
lw $t6, 56($sp)
move $v0, $t6
L_126:
lw $ra, 0($sp)
jr $ra
L_127:
lw $s6, 36($sp)
lw $t5, 44($sp)
li $t4, 4
mult $s6, $t4
mflo $t4
addi $t4, $t4, 0
lw $t0, 4($sp)
add $t4, $t0, $t4
lw $t5, ($t4)
sw $t5, 44($sp)
L_128:
lw $t5, 44($sp)
lw $s1, 16($sp)
lw $t2, 48($sp)
seq $t2, $t5, $s1
sw $t2, 48($sp)
L_129:
lw $t2, 48($sp)
beqz $t2, L_133
L_130:
lw $s6, 36($sp)
move $v0, $s6
L_131:
lw $ra, 0($sp)
jr $ra
L_132:
b L_157
L_133:
lw $s6, 36($sp)
lw $t7, 52($sp)
li $t3, 4
mult $s6, $t3
mflo $t3
addi $t3, $t3, 0
lw $t1, 4($sp)
add $t3, $t1, $t3
lw $t7, ($t3)
sw $t7, 52($sp)
L_134:
lw $t7, 52($sp)
lw $s1, 16($sp)
lw $s7, 56($sp)
sgt $s7, $t7, $s1
sw $s7, 56($sp)
L_135:
lw $s7, 56($sp)
beqz $s7, L_147
L_136:
lw $s6, 60($sp)
li $s6,1
sw $s6, 60($sp)
L_137:
lw $s6, 36($sp)
lw $s3, 60($sp)
lw $s4, 64($sp)
sub $s4, $s6, $s3
sw $s4, 64($sp)
L_138:
lw $s4, 4($sp)
sw $s4, -68($sp)
L_139:
lw $s2, 8($sp)
sw $s2, -64($sp)
L_140:
lw $s1, 64($sp)
sw $s1, -60($sp)
L_141:
lw $s5, 16($sp)
sw $s5, -56($sp)
L_142:
sub $sp, $sp, 72
jal EnumProgram_binary
add $sp, $sp, 72
L_143:
lw $s0, 68($sp)
move $s0, $v0
sw $s0, 68($sp)
L_144:
lw $s0, 68($sp)
move $v0, $s0
L_145:
lw $ra, 0($sp)
jr $ra
L_146:
b L_157
L_147:
lw $t6, 60($sp)
li $t6,1
sw $t6, 60($sp)
L_148:
lw $s6, 36($sp)
lw $t6, 60($sp)
lw $t4, 64($sp)
add $t4, $s6, $t6
sw $t4, 64($sp)
L_149:
lw $t4, 4($sp)
sw $t4, -68($sp)
L_150:
lw $t0, 64($sp)
sw $t0, -64($sp)
L_151:
lw $t5, 12($sp)
sw $t5, -60($sp)
L_152:
lw $s5, 16($sp)
sw $s5, -56($sp)
L_153:
sub $sp, $sp, 72
jal EnumProgram_binary
add $sp, $sp, 72
L_154:
lw $t2, 68($sp)
move $t2, $v0
sw $t2, 68($sp)
L_155:
lw $t2, 68($sp)
move $v0, $t2
L_156:
lw $ra, 0($sp)
jr $ra
L_157:
lw $ra, 0($sp)
jr $ra
L_158:
B_MergeSort:
L_159:
sw $ra, 0($sp)
L_160:
lw $t3, 16($sp)
li $t3,0
sw $t3, 16($sp)
L_161:
lw $t3, 20($sp)
li $t3,1
sw $t3, 20($sp)
L_162:
lw $t3, 8($sp)
lw $t1, 20($sp)
lw $t7, 24($sp)
sub $t7, $t3, $t1
sw $t7, 24($sp)
L_163:
lw $t7, 12($sp)
sw $t7, -40($sp)
L_164:
lw $s7, 16($sp)
sw $s7, -36($sp)
L_165:
lw $s6, 24($sp)
sw $s6, -32($sp)
L_166:
sub $sp, $sp, 44
jal EnumProgram_MergeSort
add $sp, $sp, 44
L_167:
lw $s3, 32($sp)
li $s3,0
sw $s3, 32($sp)
L_168:
lw $s3, 28($sp)
lw $s4, 32($sp)
move $s3, $s4
sw $s3, 28($sp)
L_169:
lw $s3, 28($sp)
lw $t3, 8($sp)
lw $s2, 36($sp)
slt $s2, $s3, $t3
sw $s2, 36($sp)
L_170:
lw $s2, 36($sp)
beqz $s2, L_180
L_171:
b L_176
L_172:
lw $s1, 40($sp)
li $s1,1
sw $s1, 40($sp)
L_173:
lw $s3, 28($sp)
lw $s1, 40($sp)
lw $s5, 44($sp)
add $s5, $s3, $s1
sw $s5, 44($sp)
L_174:
lw $s3, 28($sp)
lw $s5, 44($sp)
move $s3, $s5
sw $s3, 28($sp)
L_175:
b L_169
L_176:
lw $s3, 28($sp)
lw $s0, 48($sp)
li $t6, 4
mult $s3, $t6
mflo $t6
addi $t6, $t6, 0
lw $t4, 12($sp)
add $t6, $t4, $t6
lw $s0, ($t6)
sw $s0, 48($sp)
L_177:
lw $s0, 48($sp)
move $a0, $s0
li $v0, 1
syscall
L_178:
la $a0, s0
li $v0, 4
syscall
L_179:
b L_172
L_180:
lw $ra, 0($sp)
jr $ra
L_181:
B_binary:
L_182:
sw $ra, 0($sp)
L_183:
lw $t0, 20($sp)
li $t0,0
sw $t0, 20($sp)
L_184:
lw $t0, 24($sp)
li $t0,1
sw $t0, 24($sp)
L_185:
lw $t0, 8($sp)
lw $t5, 24($sp)
lw $t2, 28($sp)
sub $t2, $t0, $t5
sw $t2, 28($sp)
L_186:
lw $t2, 16($sp)
sw $t2, -68($sp)
L_187:
lw $t3, 20($sp)
sw $t3, -64($sp)
L_188:
lw $t1, 28($sp)
sw $t1, -60($sp)
L_189:
lw $t7, 12($sp)
sw $t7, -56($sp)
L_190:
sub $sp, $sp, 72
jal EnumProgram_binary
add $sp, $sp, 72
L_191:
lw $s7, 32($sp)
move $s7, $v0
sw $s7, 32($sp)
L_192:
la $a0, s1
li $v0, 4
syscall
L_193:
lw $s7, 32($sp)
move $a0, $s7
li $v0, 1
syscall
L_194:
la $a0, s2
li $v0, 4
syscall
L_195:
lw $ra, 0($sp)
jr $ra
L_196:
B_Main:
L_197:
sw $ra, 0($sp)
L_198:
li $a0, 80
li $v0, 9
syscall
lw $s6, 8($sp)
move $s6, $v0
sw $s6, 8($sp)
L_199:
lw $s6, 12($sp)
lw $s4, 8($sp)
move $s6, $s4
sw $s6, 12($sp)
L_200:
lw $s6, 20($sp)
li $s6,0
sw $s6, 20($sp)
L_201:
lw $s6, 24($sp)
li $s6,1
sw $s6, 24($sp)
L_202:
lw $s6, 20($sp)
lw $s2, 24($sp)
li $s1, 4
mult $s6, $s1
mflo $s1
addi $s1, $s1, 0
lw $s5, 12($sp)
add $s1, $s5, $s1
sw $s2, ($s1)
L_203:
lw $s6, 20($sp)
lw $s3, 28($sp)
li $t6, 4
mult $s6, $t6
mflo $t6
addi $t6, $t6, 0
lw $s5, 12($sp)
add $t6, $s5, $t6
lw $s3, ($t6)
sw $s3, 28($sp)
L_204:
lw $s3, 32($sp)
li $s3,1
sw $s3, 32($sp)
L_205:
lw $s3, 36($sp)
li $s3,9
sw $s3, 36($sp)
L_206:
lw $s3, 32($sp)
lw $t4, 36($sp)
li $s0, 4
mult $s3, $s0
mflo $s0
addi $s0, $s0, 0
lw $s5, 12($sp)
add $s0, $s5, $s0
sw $t4, ($s0)
L_207:
lw $s3, 32($sp)
lw $t0, 40($sp)
li $t5, 4
mult $s3, $t5
mflo $t5
addi $t5, $t5, 0
lw $s5, 12($sp)
add $t5, $s5, $t5
lw $t0, ($t5)
sw $t0, 40($sp)
L_208:
lw $t0, 44($sp)
li $t0,2
sw $t0, 44($sp)
L_209:
lw $t0, 48($sp)
li $t0,12
sw $t0, 48($sp)
L_210:
lw $t0, 44($sp)
lw $t2, 48($sp)
li $t3, 4
mult $t0, $t3
mflo $t3
addi $t3, $t3, 0
lw $s5, 12($sp)
add $t3, $s5, $t3
sw $t2, ($t3)
L_211:
lw $t0, 44($sp)
lw $t1, 52($sp)
li $t7, 4
mult $t0, $t7
mflo $t7
addi $t7, $t7, 0
lw $s5, 12($sp)
add $t7, $s5, $t7
lw $t1, ($t7)
sw $t1, 52($sp)
L_212:
lw $t1, 56($sp)
li $t1,3
sw $t1, 56($sp)
L_213:
lw $t1, 60($sp)
li $t1,12
sw $t1, 60($sp)
L_214:
lw $t1, 60($sp)
lw $s7, 64($sp)
neg $s7, $t1
sw $s7, 64($sp)
L_215:
lw $s7, 56($sp)
lw $s4, 64($sp)
li $s6, 4
mult $s7, $s6
mflo $s6
addi $s6, $s6, 0
lw $s5, 12($sp)
add $s6, $s5, $s6
sw $s4, ($s6)
L_216:
lw $s7, 56($sp)
lw $s2, 68($sp)
li $s1, 4
mult $s7, $s1
mflo $s1
addi $s1, $s1, 0
lw $s5, 12($sp)
add $s1, $s5, $s1
lw $s2, ($s1)
sw $s2, 68($sp)
L_217:
lw $s2, 72($sp)
li $s2,4
sw $s2, 72($sp)
L_218:
lw $s2, 76($sp)
li $s2,34
sw $s2, 76($sp)
L_219:
lw $s2, 72($sp)
lw $s5, 76($sp)
li $t6, 4
mult $s2, $t6
mflo $t6
addi $t6, $t6, 0
lw $s3, 12($sp)
add $t6, $s3, $t6
sw $s5, ($t6)
L_220:
lw $s2, 72($sp)
lw $t4, 80($sp)
li $s0, 4
mult $s2, $s0
mflo $s0
addi $s0, $s0, 0
lw $s3, 12($sp)
add $s0, $s3, $s0
lw $t4, ($s0)
sw $t4, 80($sp)
L_221:
lw $t4, 84($sp)
li $t4,5
sw $t4, 84($sp)
L_222:
lw $t4, 88($sp)
li $t4,4
sw $t4, 88($sp)
L_223:
lw $t4, 88($sp)
lw $t5, 92($sp)
neg $t5, $t4
sw $t5, 92($sp)
L_224:
lw $t5, 84($sp)
lw $t0, 92($sp)
li $t2, 4
mult $t5, $t2
mflo $t2
addi $t2, $t2, 0
lw $s3, 12($sp)
add $t2, $s3, $t2
sw $t0, ($t2)
L_225:
lw $t5, 84($sp)
lw $t3, 96($sp)
li $t7, 4
mult $t5, $t7
mflo $t7
addi $t7, $t7, 0
lw $s3, 12($sp)
add $t7, $s3, $t7
lw $t3, ($t7)
sw $t3, 96($sp)
L_226:
lw $t3, 100($sp)
li $t3,6
sw $t3, 100($sp)
L_227:
lw $t3, 104($sp)
li $t3,0
sw $t3, 104($sp)
L_228:
lw $t3, 100($sp)
lw $t1, 104($sp)
li $s7, 4
mult $t3, $s7
mflo $s7
addi $s7, $s7, 0
lw $s3, 12($sp)
add $s7, $s3, $s7
sw $t1, ($s7)
L_229:
lw $t3, 100($sp)
lw $s4, 108($sp)
li $s6, 4
mult $t3, $s6
mflo $s6
addi $s6, $s6, 0
lw $s3, 12($sp)
add $s6, $s3, $s6
lw $s4, ($s6)
sw $s4, 108($sp)
L_230:
lw $s4, 112($sp)
li $s4,7
sw $s4, 112($sp)
L_231:
lw $s4, 116($sp)
li $s4,2
sw $s4, 116($sp)
L_232:
lw $s4, 112($sp)
lw $s1, 116($sp)
li $s2, 4
mult $s4, $s2
mflo $s2
addi $s2, $s2, 0
lw $s3, 12($sp)
add $s2, $s3, $s2
sw $s1, ($s2)
L_233:
lw $s4, 112($sp)
lw $s5, 120($sp)
li $t6, 4
mult $s4, $t6
mflo $t6
addi $t6, $t6, 0
lw $s3, 12($sp)
add $t6, $s3, $t6
lw $s5, ($t6)
sw $s5, 120($sp)
L_234:
lw $s5, 124($sp)
li $s5,8
sw $s5, 124($sp)
L_235:
lw $s5, 128($sp)
li $s5,1000000000
sw $s5, 128($sp)
L_236:
lw $s5, 124($sp)
lw $s3, 128($sp)
li $s0, 4
mult $s5, $s0
mflo $s0
addi $s0, $s0, 0
lw $t4, 12($sp)
add $s0, $t4, $s0
sw $s3, ($s0)
L_237:
lw $s5, 124($sp)
lw $t5, 132($sp)
li $t0, 4
mult $s5, $t0
mflo $t0
addi $t0, $t0, 0
lw $t4, 12($sp)
add $t0, $t4, $t0
lw $t5, ($t0)
sw $t5, 132($sp)
L_238:
lw $t5, 136($sp)
li $t5,9
sw $t5, 136($sp)
L_239:
lw $t5, 140($sp)
li $t5,1000000000
sw $t5, 140($sp)
L_240:
lw $t5, 140($sp)
lw $t2, 144($sp)
neg $t2, $t5
sw $t2, 144($sp)
L_241:
lw $t2, 136($sp)
lw $t7, 144($sp)
li $t3, 4
mult $t2, $t3
mflo $t3
addi $t3, $t3, 0
lw $t4, 12($sp)
add $t3, $t4, $t3
sw $t7, ($t3)
L_242:
lw $t2, 136($sp)
lw $t1, 148($sp)
li $s7, 4
mult $t2, $s7
mflo $s7
addi $s7, $s7, 0
lw $t4, 12($sp)
add $s7, $t4, $s7
lw $t1, ($s7)
sw $t1, 148($sp)
L_243:
lw $t1, 152($sp)
li $t1,10
sw $t1, 152($sp)
L_244:
lw $t1, 156($sp)
li $t1,99
sw $t1, 156($sp)
L_245:
lw $t1, 152($sp)
lw $s6, 156($sp)
li $s4, 4
mult $t1, $s4
mflo $s4
addi $s4, $s4, 0
lw $t4, 12($sp)
add $s4, $t4, $s4
sw $s6, ($s4)
L_246:
lw $t1, 152($sp)
lw $s1, 160($sp)
li $s2, 4
mult $t1, $s2
mflo $s2
addi $s2, $s2, 0
lw $t4, 12($sp)
add $s2, $t4, $s2
lw $s1, ($s2)
sw $s1, 160($sp)
L_247:
lw $s1, 164($sp)
li $s1,11
sw $s1, 164($sp)
L_248:
lw $s1, 168($sp)
li $s1,99
sw $s1, 168($sp)
L_249:
lw $s1, 164($sp)
lw $t6, 168($sp)
li $s5, 4
mult $s1, $s5
mflo $s5
addi $s5, $s5, 0
lw $t4, 12($sp)
add $s5, $t4, $s5
sw $t6, ($s5)
L_250:
lw $s1, 164($sp)
lw $s3, 172($sp)
li $s0, 4
mult $s1, $s0
mflo $s0
addi $s0, $s0, 0
lw $t4, 12($sp)
add $s0, $t4, $s0
lw $s3, ($s0)
sw $s3, 172($sp)
L_251:
lw $s3, 176($sp)
li $s3,12
sw $s3, 176($sp)
L_252:
lw $s3, 180($sp)
li $s3,127
sw $s3, 180($sp)
L_253:
lw $s3, 176($sp)
lw $t4, 180($sp)
li $t0, 4
mult $s3, $t0
mflo $t0
addi $t0, $t0, 0
lw $t5, 12($sp)
add $t0, $t5, $t0
sw $t4, ($t0)
L_254:
lw $s3, 176($sp)
lw $t2, 184($sp)
li $t7, 4
mult $s3, $t7
mflo $t7
addi $t7, $t7, 0
lw $t5, 12($sp)
add $t7, $t5, $t7
lw $t2, ($t7)
sw $t2, 184($sp)
L_255:
lw $t2, 188($sp)
li $t2,13
sw $t2, 188($sp)
L_256:
lw $t2, 192($sp)
li $t2,12
sw $t2, 192($sp)
L_257:
lw $t2, 192($sp)
lw $t3, 196($sp)
neg $t3, $t2
sw $t3, 196($sp)
L_258:
lw $t3, 188($sp)
lw $s7, 196($sp)
li $t1, 4
mult $t3, $t1
mflo $t1
addi $t1, $t1, 0
lw $t5, 12($sp)
add $t1, $t5, $t1
sw $s7, ($t1)
L_259:
lw $t3, 188($sp)
lw $s6, 200($sp)
li $s4, 4
mult $t3, $s4
mflo $s4
addi $s4, $s4, 0
lw $t5, 12($sp)
add $s4, $t5, $s4
lw $s6, ($s4)
sw $s6, 200($sp)
L_260:
lw $s6, 204($sp)
li $s6,14
sw $s6, 204($sp)
L_261:
lw $s6, 208($sp)
li $s6,39
sw $s6, 208($sp)
L_262:
lw $s6, 204($sp)
lw $s2, 208($sp)
li $s1, 4
mult $s6, $s1
mflo $s1
addi $s1, $s1, 0
lw $t5, 12($sp)
add $s1, $t5, $s1
sw $s2, ($s1)
L_263:
lw $s6, 204($sp)
lw $t6, 212($sp)
li $s5, 4
mult $s6, $s5
mflo $s5
addi $s5, $s5, 0
lw $t5, 12($sp)
add $s5, $t5, $s5
lw $t6, ($s5)
sw $t6, 212($sp)
L_264:
lw $t6, 216($sp)
li $t6,15
sw $t6, 216($sp)
L_265:
lw $t6, 220($sp)
li $t6,40
sw $t6, 220($sp)
L_266:
lw $t6, 220($sp)
lw $s0, 224($sp)
neg $s0, $t6
sw $s0, 224($sp)
L_267:
lw $s0, 216($sp)
lw $s3, 224($sp)
li $t4, 4
mult $s0, $t4
mflo $t4
addi $t4, $t4, 0
lw $t5, 12($sp)
add $t4, $t5, $t4
sw $s3, ($t4)
L_268:
lw $s0, 216($sp)
lw $t0, 228($sp)
li $t5, 4
mult $s0, $t5
mflo $t5
addi $t5, $t5, 0
lw $t7, 12($sp)
add $t5, $t7, $t5
lw $t0, ($t5)
sw $t0, 228($sp)
L_269:
lw $t0, 232($sp)
li $t0,16
sw $t0, 232($sp)
L_270:
lw $t0, 236($sp)
li $t0,90
sw $t0, 236($sp)
L_271:
lw $t0, 232($sp)
lw $t2, 236($sp)
li $t3, 4
mult $t0, $t3
mflo $t3
addi $t3, $t3, 0
lw $t7, 12($sp)
add $t3, $t7, $t3
sw $t2, ($t3)
L_272:
lw $t0, 232($sp)
lw $s7, 240($sp)
li $t1, 4
mult $t0, $t1
mflo $t1
addi $t1, $t1, 0
lw $t7, 12($sp)
add $t1, $t7, $t1
lw $s7, ($t1)
sw $s7, 240($sp)
L_273:
lw $s7, 244($sp)
li $s7,17
sw $s7, 244($sp)
L_274:
lw $s7, 248($sp)
li $s7,9
sw $s7, 248($sp)
L_275:
lw $s7, 244($sp)
lw $s4, 248($sp)
li $s6, 4
mult $s7, $s6
mflo $s6
addi $s6, $s6, 0
lw $t7, 12($sp)
add $s6, $t7, $s6
sw $s4, ($s6)
L_276:
lw $s7, 244($sp)
lw $s2, 252($sp)
li $s1, 4
mult $s7, $s1
mflo $s1
addi $s1, $s1, 0
lw $t7, 12($sp)
add $s1, $t7, $s1
lw $s2, ($s1)
sw $s2, 252($sp)
L_277:
lw $s2, 256($sp)
li $s2,18
sw $s2, 256($sp)
L_278:
lw $s2, 260($sp)
li $s2,2000000000
sw $s2, 260($sp)
L_279:
lw $s2, 256($sp)
lw $s5, 260($sp)
li $t6, 4
mult $s2, $t6
mflo $t6
addi $t6, $t6, 0
lw $t7, 12($sp)
add $t6, $t7, $t6
sw $s5, ($t6)
L_280:
lw $s2, 256($sp)
lw $s0, 264($sp)
li $s3, 4
mult $s2, $s3
mflo $s3
addi $s3, $s3, 0
lw $t7, 12($sp)
add $s3, $t7, $s3
lw $s0, ($s3)
sw $s0, 264($sp)
L_281:
lw $s0, 268($sp)
li $s0,19
sw $s0, 268($sp)
L_282:
lw $s0, 272($sp)
li $s0,200000000
sw $s0, 272($sp)
L_283:
lw $s0, 272($sp)
lw $t4, 276($sp)
neg $t4, $s0
sw $t4, 276($sp)
L_284:
lw $t4, 268($sp)
lw $t5, 276($sp)
li $t7, 4
mult $t4, $t7
mflo $t7
addi $t7, $t7, 0
lw $t0, 12($sp)
add $t7, $t0, $t7
sw $t5, ($t7)
L_285:
lw $t4, 268($sp)
lw $t2, 280($sp)
li $t3, 4
mult $t4, $t3
mflo $t3
addi $t3, $t3, 0
lw $t0, 12($sp)
add $t3, $t0, $t3
lw $t2, ($t3)
sw $t2, 280($sp)
L_286:
lw $t2, 284($sp)
li $t2,20
sw $t2, 284($sp)
L_287:
lw $t2, 4($sp)
sw $t2, -48($sp)
L_288:
lw $t1, 284($sp)
sw $t1, -44($sp)
L_289:
lw $t0, 12($sp)
sw $t0, -40($sp)
L_290:
sub $sp, $sp, 52
jal B_MergeSort
add $sp, $sp, 52
L_291:
lw $s7, 288($sp)
li $s7,20
sw $s7, 288($sp)
L_292:
lw $s7, 292($sp)
li $s7,99
sw $s7, 292($sp)
L_293:
lw $s7, 4($sp)
sw $s7, -32($sp)
L_294:
lw $s4, 288($sp)
sw $s4, -28($sp)
L_295:
lw $s6, 292($sp)
sw $s6, -24($sp)
L_296:
lw $t0, 12($sp)
sw $t0, -20($sp)
L_297:
sub $sp, $sp, 36
jal B_binary
add $sp, $sp, 36
L_298:
lw $ra, 0($sp)
jr $ra
L_299:
sub $sp, $sp, 296
jal B_Main
add $sp, $sp, 296
L_300:
li $v0, 10
syscall
