.data
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"

.text
main:
b A_Main
L_0:
Binary_setarr:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,1
sw $s7, 12($sp)
L_3:
lw $s7, 8($sp)
lw $s6, 12($sp)
move $s7, $s6
sw $s7, 8($sp)
L_4:
lw $s7, 16($sp)
li $s7,11
sw $s7, 16($sp)
L_5:
lw $s7, 8($sp)
lw $s5, 16($sp)
lw $s4, 20($sp)
slt $s4, $s7, $s5
sw $s4, 20($sp)
L_6:
lw $s4, 20($sp)
beqz $s4, L_17
L_7:
b L_12
L_8:
lw $s3, 24($sp)
li $s3,1
sw $s3, 24($sp)
L_9:
lw $s7, 8($sp)
lw $s3, 24($sp)
lw $s2, 28($sp)
add $s2, $s7, $s3
sw $s2, 28($sp)
L_10:
lw $s7, 8($sp)
lw $s2, 28($sp)
move $s7, $s2
sw $s7, 8($sp)
L_11:
b L_4
L_12:
lw $s7, 32($sp)
li $s7,1
sw $s7, 32($sp)
L_13:
lw $s7, 8($sp)
lw $s1, 32($sp)
lw $s0, 36($sp)
sub $s0, $s7, $s1
sw $s0, 36($sp)
L_14:
lw $s0, 36($sp)
lw $s7, 8($sp)
li $t7, 4
mult $s0, $t7
mflo $t7
addi $t7, $t7, 0
lw $t6, 4($sp)
add $t7, $t6, $t7
sw $s7, ($t7)
L_15:
lw $s0, 36($sp)
lw $t5, 40($sp)
li $t4, 4
mult $s0, $t4
mflo $t4
addi $t4, $t4, 0
lw $t3, 4($sp)
add $t4, $t3, $t4
lw $t5, ($t4)
sw $t5, 40($sp)
L_16:
b L_8
L_17:
lw $ra, 0($sp)
jr $ra
L_18:
lw $ra, 0($sp)
jr $ra
L_19:
Binary_binary:
L_20:
sw $ra, 0($sp)
L_21:
lw $t5, 8($sp)
lw $t2, 12($sp)
lw $t1, 20($sp)
sgt $t1, $t5, $t2
sw $t1, 20($sp)
L_22:
lw $t1, 20($sp)
beqz $t1, L_27
L_23:
lw $t0, 24($sp)
li $t0,1
sw $t0, 24($sp)
L_24:
lw $t0, 24($sp)
lw $s6, 28($sp)
neg $s6, $t0
sw $s6, 28($sp)
L_25:
lw $s6, 28($sp)
move $v0, $s6
L_26:
lw $ra, 0($sp)
jr $ra
L_27:
lw $t5, 8($sp)
lw $t2, 12($sp)
lw $s5, 24($sp)
add $s5, $t5, $t2
sw $s5, 24($sp)
L_28:
lw $s5, 28($sp)
li $s5,2
sw $s5, 28($sp)
L_29:
lw $s5, 24($sp)
lw $s4, 28($sp)
lw $s3, 32($sp)
div $s5, $s4
mflo $s3
sw $s3, 32($sp)
L_30:
lw $s3, 36($sp)
lw $s2, 32($sp)
move $s3, $s2
sw $s3, 36($sp)
L_31:
lw $t5, 8($sp)
lw $t2, 12($sp)
lw $s3, 40($sp)
seq $s3, $t5, $t2
sw $s3, 40($sp)
L_32:
lw $s3, 40($sp)
beqz $s3, L_43
L_33:
lw $s7, 36($sp)
lw $s1, 44($sp)
li $s0, 4
mult $s7, $s0
mflo $s0
addi $s0, $s0, 0
lw $t7, 4($sp)
add $s0, $t7, $s0
lw $s1, ($s0)
sw $s1, 44($sp)
L_34:
lw $s1, 44($sp)
lw $t6, 16($sp)
lw $t4, 48($sp)
seq $t4, $s1, $t6
sw $t4, 48($sp)
L_35:
lw $t4, 48($sp)
beqz $t4, L_39
L_36:
lw $s7, 36($sp)
move $v0, $s7
L_37:
lw $ra, 0($sp)
jr $ra
L_38:
b L_43
L_39:
lw $t3, 52($sp)
li $t3,1
sw $t3, 52($sp)
L_40:
lw $t3, 52($sp)
lw $t5, 56($sp)
neg $t5, $t3
sw $t5, 56($sp)
L_41:
lw $t5, 56($sp)
move $v0, $t5
L_42:
lw $ra, 0($sp)
jr $ra
L_43:
lw $s7, 36($sp)
lw $t2, 44($sp)
li $t1, 4
mult $s7, $t1
mflo $t1
addi $t1, $t1, 0
lw $t0, 4($sp)
add $t1, $t0, $t1
lw $t2, ($t1)
sw $t2, 44($sp)
L_44:
lw $t2, 44($sp)
lw $t6, 16($sp)
lw $s6, 48($sp)
seq $s6, $t2, $t6
sw $s6, 48($sp)
L_45:
lw $s6, 48($sp)
beqz $s6, L_49
L_46:
lw $s7, 36($sp)
move $v0, $s7
L_47:
lw $ra, 0($sp)
jr $ra
L_48:
b L_73
L_49:
lw $s7, 36($sp)
lw $s5, 52($sp)
li $s4, 4
mult $s7, $s4
mflo $s4
addi $s4, $s4, 0
lw $s2, 4($sp)
add $s4, $s2, $s4
lw $s5, ($s4)
sw $s5, 52($sp)
L_50:
lw $s5, 52($sp)
lw $t6, 16($sp)
lw $s3, 56($sp)
sgt $s3, $s5, $t6
sw $s3, 56($sp)
L_51:
lw $s3, 56($sp)
beqz $s3, L_63
L_52:
lw $s7, 60($sp)
li $s7,1
sw $s7, 60($sp)
L_53:
lw $s7, 36($sp)
lw $s0, 60($sp)
lw $t7, 64($sp)
sub $t7, $s7, $s0
sw $t7, 64($sp)
L_54:
lw $t7, 4($sp)
sw $t7, -68($sp)
L_55:
lw $s1, 8($sp)
sw $s1, -64($sp)
L_56:
lw $t6, 64($sp)
sw $t6, -60($sp)
L_57:
lw $t4, 16($sp)
sw $t4, -56($sp)
L_58:
sub $sp, $sp, 72
jal Binary_binary
add $sp, $sp, 72
L_59:
lw $t3, 68($sp)
move $t3, $v0
sw $t3, 68($sp)
L_60:
lw $t3, 68($sp)
move $v0, $t3
L_61:
lw $ra, 0($sp)
jr $ra
L_62:
b L_73
L_63:
lw $t5, 60($sp)
li $t5,1
sw $t5, 60($sp)
L_64:
lw $s7, 36($sp)
lw $t5, 60($sp)
lw $t1, 64($sp)
add $t1, $s7, $t5
sw $t1, 64($sp)
L_65:
lw $t1, 4($sp)
sw $t1, -68($sp)
L_66:
lw $t0, 64($sp)
sw $t0, -64($sp)
L_67:
lw $t2, 12($sp)
sw $t2, -60($sp)
L_68:
lw $t4, 16($sp)
sw $t4, -56($sp)
L_69:
sub $sp, $sp, 72
jal Binary_binary
add $sp, $sp, 72
L_70:
lw $s6, 68($sp)
move $s6, $v0
sw $s6, 68($sp)
L_71:
lw $s6, 68($sp)
move $v0, $s6
L_72:
lw $ra, 0($sp)
jr $ra
L_73:
lw $ra, 0($sp)
jr $ra
L_74:
A_Main:
L_75:
sw $ra, 0($sp)
L_76:
li $a0, 44
li $v0, 9
syscall
lw $s4, 8($sp)
move $s4, $v0
sw $s4, 8($sp)
L_77:
lw $s4, 12($sp)
lw $s2, 8($sp)
move $s4, $s2
sw $s4, 12($sp)
L_78:
lw $s4, 24($sp)
li $s4,0
sw $s4, 24($sp)
L_79:
lw $s4, 16($sp)
lw $s5, 24($sp)
move $s4, $s5
sw $s4, 16($sp)
L_80:
lw $s4, 28($sp)
li $s4,10
sw $s4, 28($sp)
L_81:
lw $s4, 16($sp)
lw $s3, 28($sp)
lw $s7, 32($sp)
slt $s7, $s4, $s3
sw $s7, 32($sp)
L_82:
lw $s7, 32($sp)
beqz $s7, L_93
L_83:
b L_88
L_84:
lw $s0, 36($sp)
li $s0,1
sw $s0, 36($sp)
L_85:
lw $s4, 16($sp)
lw $s0, 36($sp)
lw $t7, 40($sp)
add $t7, $s4, $s0
sw $t7, 40($sp)
L_86:
lw $s4, 16($sp)
lw $t7, 40($sp)
move $s4, $t7
sw $s4, 16($sp)
L_87:
b L_80
L_88:
lw $s4, 44($sp)
li $s4,1
sw $s4, 44($sp)
L_89:
lw $s4, 16($sp)
lw $s1, 44($sp)
lw $t6, 48($sp)
add $t6, $s4, $s1
sw $t6, 48($sp)
L_90:
lw $s4, 16($sp)
lw $t6, 48($sp)
li $t4, 4
mult $s4, $t4
mflo $t4
addi $t4, $t4, 0
lw $t3, 12($sp)
add $t4, $t3, $t4
sw $t6, ($t4)
L_91:
lw $s4, 16($sp)
lw $t5, 52($sp)
li $t1, 4
mult $s4, $t1
mflo $t1
addi $t1, $t1, 0
lw $t3, 12($sp)
add $t1, $t3, $t1
lw $t5, ($t1)
sw $t5, 52($sp)
L_92:
b L_84
L_93:
lw $t5, 44($sp)
li $t5,0
sw $t5, 44($sp)
L_94:
lw $s4, 16($sp)
lw $t5, 44($sp)
move $s4, $t5
sw $s4, 16($sp)
L_95:
lw $s4, 48($sp)
li $s4,10
sw $s4, 48($sp)
L_96:
lw $s4, 16($sp)
lw $t0, 48($sp)
lw $t2, 52($sp)
slt $t2, $s4, $t0
sw $t2, 52($sp)
L_97:
lw $t2, 52($sp)
beqz $t2, L_107
L_98:
b L_103
L_99:
lw $s6, 56($sp)
li $s6,1
sw $s6, 56($sp)
L_100:
lw $s4, 16($sp)
lw $s6, 56($sp)
lw $s2, 60($sp)
add $s2, $s4, $s6
sw $s2, 60($sp)
L_101:
lw $s4, 16($sp)
lw $s2, 60($sp)
move $s4, $s2
sw $s4, 16($sp)
L_102:
b L_95
L_103:
lw $s4, 16($sp)
lw $s5, 64($sp)
li $s3, 4
mult $s4, $s3
mflo $s3
addi $s3, $s3, 0
lw $t3, 12($sp)
add $s3, $t3, $s3
lw $s5, ($s3)
sw $s5, 64($sp)
L_104:
lw $s5, 64($sp)
move $a0, $s5
li $v0, 1
syscall
L_105:
la $a0, s0
li $v0, 4
syscall
L_106:
b L_99
L_107:
lw $s7, 64($sp)
li $s7,0
sw $s7, 64($sp)
L_108:
lw $s7, 68($sp)
li $s7,9
sw $s7, 68($sp)
L_109:
lw $s7, 72($sp)
li $s7,8
sw $s7, 72($sp)
L_110:
lw $s7, 12($sp)
sw $s7, -68($sp)
L_111:
lw $s0, 64($sp)
sw $s0, -64($sp)
L_112:
lw $t7, 68($sp)
sw $t7, -60($sp)
L_113:
lw $s1, 72($sp)
sw $s1, -56($sp)
L_114:
sub $sp, $sp, 72
jal Binary_binary
add $sp, $sp, 72
L_115:
lw $t6, 76($sp)
move $t6, $v0
sw $t6, 76($sp)
L_116:
lw $t6, 20($sp)
lw $t4, 76($sp)
move $t6, $t4
sw $t6, 20($sp)
L_117:
lw $t6, 20($sp)
move $a0, $t6
li $v0, 1
syscall
L_118:
la $a0, s1
li $v0, 4
syscall
L_119:
lw $ra, 0($sp)
jr $ra
L_120:
sub $sp, $sp, 80
jal A_Main
add $sp, $sp, 80
L_121:
li $v0, 10
syscall
