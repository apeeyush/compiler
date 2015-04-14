.data
s0:	.asciiz	"\n"

.text
main:
b Program_Main
L_0:
sieve_initialize:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,1000
sw $s7, 12($sp)
L_3:
lw $s7, 12($sp)
lw $s6, 4($sp)
sw $s7, 4008($s6)
L_4:
lw $s5, 16($sp)
li $s5,0
sw $s5, 16($sp)
L_5:
lw $s5, 16($sp)
lw $s4, 4($sp)
sw $s5, 4004($s4)
L_6:
lw $s3, 20($sp)
li $s3,1
sw $s3, 20($sp)
L_7:
lw $s3, 24($sp)
li $s3,0
sw $s3, 24($sp)
L_8:
lw $s3, 20($sp)
lw $s2, 24($sp)
li $s1, 4
mult $s3, $s1
mflo $s1
addi $s1, $s1, 0
lw $s0, 4($sp)
add $s1, $s0, $s1
sw $s2, ($s1)
L_9:
lw $s3, 20($sp)
lw $t7, 28($sp)
li $t6, 4
mult $s3, $t6
mflo $t6
addi $t6, $t6, 0
lw $t5, 4($sp)
add $t6, $t5, $t6
lw $t7, ($t6)
sw $t7, 28($sp)
L_10:
lw $t7, 32($sp)
li $t7,2
sw $t7, 32($sp)
L_11:
lw $t7, 8($sp)
lw $t4, 32($sp)
move $t7, $t4
sw $t7, 8($sp)
L_12:
lw $t7, 36($sp)
lw $t3, 4($sp)
lw $t7, 4008($t3)
sw $t7, 36($sp)
L_13:
lw $t7, 8($sp)
lw $t2, 36($sp)
lw $t1, 40($sp)
sle $t1, $t7, $t2
sw $t1, 40($sp)
L_14:
lw $t1, 40($sp)
beqz $t1, L_24
L_15:
b L_20
L_16:
lw $t0, 44($sp)
li $t0,1
sw $t0, 44($sp)
L_17:
lw $t7, 8($sp)
lw $t0, 44($sp)
lw $s7, 48($sp)
add $s7, $t7, $t0
sw $s7, 48($sp)
L_18:
lw $t7, 8($sp)
lw $s7, 48($sp)
move $t7, $s7
sw $t7, 8($sp)
L_19:
b L_12
L_20:
lw $t7, 52($sp)
li $t7,1
sw $t7, 52($sp)
L_21:
lw $t7, 8($sp)
lw $s6, 52($sp)
li $s5, 4
mult $t7, $s5
mflo $s5
addi $s5, $s5, 0
lw $s4, 4($sp)
add $s5, $s4, $s5
sw $s6, ($s5)
L_22:
lw $t7, 8($sp)
lw $s3, 56($sp)
li $s2, 4
mult $t7, $s2
mflo $s2
addi $s2, $s2, 0
lw $s1, 4($sp)
add $s2, $s1, $s2
lw $s3, ($s2)
sw $s3, 56($sp)
L_23:
b L_16
L_24:
lw $ra, 0($sp)
jr $ra
L_25:
sieve_findPrimes:
L_26:
sw $ra, 0($sp)
L_27:
lw $s3, 20($sp)
li $s3,0
sw $s3, 20($sp)
L_28:
lw $s3, 24($sp)
li $s3,2
sw $s3, 24($sp)
L_29:
lw $s3, 20($sp)
lw $s0, 24($sp)
li $t6, 4
mult $s3, $t6
mflo $t6
addi $t6, $t6, 4012
lw $t5, 4($sp)
add $t6, $t5, $t6
sw $s0, ($t6)
L_30:
lw $s3, 20($sp)
lw $t4, 28($sp)
li $t3, 4
mult $s3, $t3
mflo $t3
addi $t3, $t3, 4012
lw $t2, 4($sp)
add $t3, $t2, $t3
lw $t4, ($t3)
sw $t4, 28($sp)
L_31:
lw $t4, 32($sp)
li $t4,1
sw $t4, 32($sp)
L_32:
lw $t4, 32($sp)
lw $t1, 4($sp)
sw $t4, 4004($t1)
L_33:
lw $t0, 36($sp)
li $t0,4
sw $t0, 36($sp)
L_34:
lw $t0, 8($sp)
lw $s7, 36($sp)
move $t0, $s7
sw $t0, 8($sp)
L_35:
lw $t0, 40($sp)
lw $t7, 4($sp)
lw $t0, 4008($t7)
sw $t0, 40($sp)
L_36:
lw $t0, 8($sp)
lw $s6, 40($sp)
lw $s5, 44($sp)
sle $s5, $t0, $s6
sw $s5, 44($sp)
L_37:
lw $s5, 44($sp)
beqz $s5, L_47
L_38:
b L_43
L_39:
lw $s4, 48($sp)
li $s4,2
sw $s4, 48($sp)
L_40:
lw $t0, 8($sp)
lw $s4, 48($sp)
lw $s2, 52($sp)
add $s2, $t0, $s4
sw $s2, 52($sp)
L_41:
lw $t0, 8($sp)
lw $s2, 52($sp)
move $t0, $s2
sw $t0, 8($sp)
L_42:
b L_35
L_43:
lw $t0, 56($sp)
li $t0,0
sw $t0, 56($sp)
L_44:
lw $t0, 8($sp)
lw $s1, 56($sp)
li $s3, 4
mult $t0, $s3
mflo $s3
addi $s3, $s3, 0
lw $s0, 4($sp)
add $s3, $s0, $s3
sw $s1, ($s3)
L_45:
lw $t0, 8($sp)
lw $t6, 60($sp)
li $t5, 4
mult $t0, $t5
mflo $t5
addi $t5, $t5, 0
lw $t3, 4($sp)
add $t5, $t3, $t5
lw $t6, ($t5)
sw $t6, 60($sp)
L_46:
b L_39
L_47:
lw $t6, 56($sp)
li $t6,3
sw $t6, 56($sp)
L_48:
lw $t0, 8($sp)
lw $t6, 56($sp)
move $t0, $t6
sw $t0, 8($sp)
L_49:
lw $t0, 8($sp)
lw $t0, 8($sp)
lw $t2, 60($sp)
mult $t0, $t0
mflo $t2
sw $t2, 60($sp)
L_50:
lw $t2, 64($sp)
lw $t4, 4($sp)
lw $t2, 4008($t4)
sw $t2, 64($sp)
L_51:
lw $t2, 60($sp)
lw $t1, 64($sp)
lw $s7, 68($sp)
sle $s7, $t2, $t1
sw $s7, 68($sp)
L_52:
lw $s7, 68($sp)
beqz $s7, L_86
L_53:
b L_58
L_54:
lw $t7, 72($sp)
li $t7,2
sw $t7, 72($sp)
L_55:
lw $t0, 8($sp)
lw $t7, 72($sp)
lw $s6, 76($sp)
add $s6, $t0, $t7
sw $s6, 76($sp)
L_56:
lw $t0, 8($sp)
lw $s6, 76($sp)
move $t0, $s6
sw $t0, 8($sp)
L_57:
b L_49
L_58:
lw $t0, 8($sp)
lw $s5, 80($sp)
li $s4, 4
mult $t0, $s4
mflo $s4
addi $s4, $s4, 0
lw $s2, 4($sp)
add $s4, $s2, $s4
lw $s5, ($s4)
sw $s5, 80($sp)
L_59:
lw $s5, 84($sp)
li $s5,1
sw $s5, 84($sp)
L_60:
lw $s5, 80($sp)
lw $s1, 84($sp)
lw $s3, 88($sp)
seq $s3, $s5, $s1
sw $s3, 88($sp)
L_61:
lw $s3, 88($sp)
beqz $s3, L_85
L_62:
lw $s0, 92($sp)
lw $t5, 4($sp)
lw $s0, 4004($t5)
sw $s0, 92($sp)
L_63:
lw $s0, 92($sp)
lw $t0, 8($sp)
li $t3, 4
mult $s0, $t3
mflo $t3
addi $t3, $t3, 4012
lw $t6, 4($sp)
add $t3, $t6, $t3
sw $t0, ($t3)
L_64:
lw $s0, 92($sp)
lw $t4, 96($sp)
li $t2, 4
mult $s0, $t2
mflo $t2
addi $t2, $t2, 4012
lw $t1, 4($sp)
add $t2, $t1, $t2
lw $t4, ($t2)
sw $t4, 96($sp)
L_65:
lw $t4, 100($sp)
lw $s7, 4($sp)
lw $t4, 4004($s7)
sw $t4, 100($sp)
L_66:
lw $t4, 104($sp)
li $t4,1
sw $t4, 104($sp)
L_67:
lw $t4, 100($sp)
lw $t7, 104($sp)
lw $s6, 108($sp)
add $s6, $t4, $t7
sw $s6, 108($sp)
L_68:
lw $s6, 108($sp)
lw $t0, 4($sp)
sw $s6, 4004($t0)
L_69:
lw $s4, 8($sp)
lw $s4, 8($sp)
lw $s2, 112($sp)
mult $s4, $s4
mflo $s2
sw $s2, 112($sp)
L_70:
lw $s2, 12($sp)
lw $s5, 112($sp)
move $s2, $s5
sw $s2, 12($sp)
L_71:
lw $s2, 116($sp)
li $s2,2
sw $s2, 116($sp)
L_72:
lw $s4, 8($sp)
lw $s2, 116($sp)
lw $s1, 120($sp)
mult $s4, $s2
mflo $s1
sw $s1, 120($sp)
L_73:
lw $s1, 16($sp)
lw $s3, 120($sp)
move $s1, $s3
sw $s1, 16($sp)
L_74:
lw $s1, 124($sp)
lw $t5, 4($sp)
lw $s1, 4008($t5)
sw $s1, 124($sp)
L_75:
lw $s1, 12($sp)
lw $s0, 124($sp)
lw $t3, 128($sp)
sle $t3, $s1, $s0
sw $t3, 128($sp)
L_76:
lw $t3, 128($sp)
beqz $t3, L_85
L_77:
b L_81
L_78:
lw $s1, 12($sp)
lw $t6, 16($sp)
lw $t2, 132($sp)
add $t2, $s1, $t6
sw $t2, 132($sp)
L_79:
lw $s1, 12($sp)
lw $t2, 132($sp)
move $s1, $t2
sw $s1, 12($sp)
L_80:
b L_74
L_81:
lw $s1, 136($sp)
li $s1,0
sw $s1, 136($sp)
L_82:
lw $s1, 12($sp)
lw $t1, 136($sp)
li $s7, 4
mult $s1, $s7
mflo $s7
addi $s7, $s7, 0
lw $t4, 4($sp)
add $s7, $t4, $s7
sw $t1, ($s7)
L_83:
lw $s1, 12($sp)
lw $t7, 140($sp)
li $s6, 4
mult $s1, $s6
mflo $s6
addi $s6, $s6, 0
lw $t0, 4($sp)
add $s6, $t0, $s6
lw $t7, ($s6)
sw $t7, 140($sp)
L_84:
b L_78
L_85:
b L_54
L_86:
lw $s4, 8($sp)
lw $s4, 8($sp)
move $s4, $s4
sw $s4, 8($sp)
L_87:
lw $s4, 80($sp)
lw $t7, 4($sp)
lw $s4, 4008($t7)
sw $s4, 80($sp)
L_88:
lw $s4, 8($sp)
lw $s5, 80($sp)
lw $s2, 84($sp)
sle $s2, $s4, $s5
sw $s2, 84($sp)
L_89:
lw $s2, 84($sp)
beqz $s2, L_107
L_90:
b L_95
L_91:
lw $s3, 88($sp)
li $s3,2
sw $s3, 88($sp)
L_92:
lw $s4, 8($sp)
lw $s3, 88($sp)
lw $t5, 92($sp)
add $t5, $s4, $s3
sw $t5, 92($sp)
L_93:
lw $s4, 8($sp)
lw $t5, 92($sp)
move $s4, $t5
sw $s4, 8($sp)
L_94:
b L_87
L_95:
lw $s4, 8($sp)
lw $s0, 96($sp)
li $t3, 4
mult $s4, $t3
mflo $t3
addi $t3, $t3, 0
lw $t6, 4($sp)
add $t3, $t6, $t3
lw $s0, ($t3)
sw $s0, 96($sp)
L_96:
lw $s0, 100($sp)
li $s0,1
sw $s0, 100($sp)
L_97:
lw $s0, 96($sp)
lw $t2, 100($sp)
lw $s1, 104($sp)
seq $s1, $s0, $t2
sw $s1, 104($sp)
L_98:
lw $s1, 104($sp)
beqz $s1, L_106
L_99:
lw $t1, 108($sp)
lw $s7, 4($sp)
lw $t1, 4004($s7)
sw $t1, 108($sp)
L_100:
lw $t1, 108($sp)
lw $s4, 8($sp)
li $t4, 4
mult $t1, $t4
mflo $t4
addi $t4, $t4, 4012
lw $s6, 4($sp)
add $t4, $s6, $t4
sw $s4, ($t4)
L_101:
lw $t1, 108($sp)
lw $t0, 112($sp)
li $t7, 4
mult $t1, $t7
mflo $t7
addi $t7, $t7, 4012
lw $s5, 4($sp)
add $t7, $s5, $t7
lw $t0, ($t7)
sw $t0, 112($sp)
L_102:
lw $t0, 116($sp)
lw $s2, 4($sp)
lw $t0, 4004($s2)
sw $t0, 116($sp)
L_103:
lw $t0, 120($sp)
li $t0,1
sw $t0, 120($sp)
L_104:
lw $t0, 116($sp)
lw $s3, 120($sp)
lw $t5, 124($sp)
add $t5, $t0, $s3
sw $t5, 124($sp)
L_105:
lw $t5, 124($sp)
lw $s4, 4($sp)
sw $t5, 4004($s4)
L_106:
b L_91
L_107:
lw $ra, 0($sp)
jr $ra
L_108:
Program_Main:
L_109:
sw $ra, 0($sp)
L_110:
li $a0, 8012
li $v0, 9
syscall
lw $t3, 12($sp)
move $t3, $v0
sw $t3, 12($sp)
L_111:
lw $t3, 16($sp)
lw $t6, 12($sp)
move $t3, $t6
sw $t3, 16($sp)
L_112:
lw $t3, 16($sp)
sw $t3, -56($sp)
L_113:
sub $sp, $sp, 60
jal sieve_initialize
add $sp, $sp, 60
L_114:
lw $s0, 16($sp)
sw $s0, -140($sp)
L_115:
sub $sp, $sp, 144
jal sieve_findPrimes
add $sp, $sp, 144
L_116:
lw $t2, 20($sp)
li $t2,0
sw $t2, 20($sp)
L_117:
lw $t2, 8($sp)
lw $s1, 20($sp)
move $t2, $s1
sw $t2, 8($sp)
L_118:
lw $t2, 24($sp)
lw $s7, 16($sp)
lw $t2, 4004($s7)
sw $t2, 24($sp)
L_119:
lw $t2, 8($sp)
lw $t1, 24($sp)
lw $t4, 28($sp)
slt $t4, $t2, $t1
sw $t4, 28($sp)
L_120:
lw $t4, 28($sp)
beqz $t4, L_130
L_121:
b L_126
L_122:
lw $s6, 32($sp)
li $s6,1
sw $s6, 32($sp)
L_123:
lw $t2, 8($sp)
lw $s6, 32($sp)
lw $t7, 36($sp)
add $t7, $t2, $s6
sw $t7, 36($sp)
L_124:
lw $t2, 8($sp)
lw $t7, 36($sp)
move $t2, $t7
sw $t2, 8($sp)
L_125:
b L_118
L_126:
lw $t2, 8($sp)
lw $s5, 40($sp)
li $s2, 4
mult $t2, $s2
mflo $s2
addi $s2, $s2, 4012
lw $s7, 16($sp)
add $s2, $s7, $s2
lw $s5, ($s2)
sw $s5, 40($sp)
L_127:
lw $s5, 40($sp)
move $a0, $s5
li $v0, 1
syscall
L_128:
la $a0, s0
li $v0, 4
syscall
L_129:
b L_122
L_130:
lw $ra, 0($sp)
jr $ra
L_131:
sub $sp, $sp, 44
jal Program_Main
add $sp, $sp, 44
L_132:
li $v0, 10
syscall
