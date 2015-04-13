.data
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"

.text
main:
b A_Main
L_0:
lw $s7, 0($sp)
li $s7,1
sw $s7, 0($sp)
L_1:
lw $s7, 4($sp)
li $s7,2
sw $s7, 4($sp)
L_2:
lw $s7, 8($sp)
li $s7,3
sw $s7, 8($sp)
L_3:
lw $s7, 12($sp)
li $s7,4
sw $s7, 12($sp)
L_4:
lw $s7, 16($sp)
li $s7,5
sw $s7, 16($sp)
L_5:
lw $s7, 20($sp)
li $s7,6
sw $s7, 20($sp)
L_6:
lw $s7, 24($sp)
li $s7,7
sw $s7, 24($sp)
L_7:
lw $s7, 28($sp)
li $s7,8
sw $s7, 28($sp)
L_8:
lw $s7, 32($sp)
li $s7,9
sw $s7, 32($sp)
L_9:
lw $s7, 36($sp)
li $s7,10
sw $s7, 36($sp)
L_10:
li $s7, 0
lw $s6, 0($sp)
li $s5, 4
mult $s7, $s5
mflo $s5
addi $s5, $s5, 40
add $s5, $sp, $s5
sw $s6, ($s5)
L_11:
li $s4, 1
lw $s3, 4($sp)
li $s2, 4
mult $s4, $s2
mflo $s2
addi $s2, $s2, 40
add $s2, $sp, $s2
sw $s3, ($s2)
L_12:
li $s1, 2
lw $s0, 8($sp)
li $t7, 4
mult $s1, $t7
mflo $t7
addi $t7, $t7, 40
add $t7, $sp, $t7
sw $s0, ($t7)
L_13:
li $t6, 3
lw $t5, 12($sp)
li $t4, 4
mult $t6, $t4
mflo $t4
addi $t4, $t4, 40
add $t4, $sp, $t4
sw $t5, ($t4)
L_14:
li $t3, 4
lw $t2, 16($sp)
li $t1, 4
mult $t3, $t1
mflo $t1
addi $t1, $t1, 40
add $t1, $sp, $t1
sw $t2, ($t1)
L_15:
li $t0, 5
lw $s7, 20($sp)
li $s6, 4
mult $t0, $s6
mflo $s6
addi $s6, $s6, 40
add $s6, $sp, $s6
sw $s7, ($s6)
L_16:
li $s5, 6
lw $s4, 24($sp)
li $s3, 4
mult $s5, $s3
mflo $s3
addi $s3, $s3, 40
add $s3, $sp, $s3
sw $s4, ($s3)
L_17:
li $s2, 7
lw $s1, 28($sp)
li $s0, 4
mult $s2, $s0
mflo $s0
addi $s0, $s0, 40
add $s0, $sp, $s0
sw $s1, ($s0)
L_18:
li $t7, 8
lw $t6, 32($sp)
li $t5, 4
mult $t7, $t5
mflo $t5
addi $t5, $t5, 40
add $t5, $sp, $t5
sw $t6, ($t5)
L_19:
li $t4, 9
lw $t3, 36($sp)
li $t2, 4
mult $t4, $t2
mflo $t2
addi $t2, $t2, 40
add $t2, $sp, $t2
sw $t3, ($t2)
L_20:
Binary_binary:
L_21:
sw $ra, 0($sp)
L_22:
lw $t1, 8($sp)
lw $t0, 12($sp)
lw $s7, 20($sp)
sgt $s7, $t1, $t0
sw $s7, 20($sp)
L_23:
lw $s7, 20($sp)
beqz $s7, L_28
L_24:
lw $s6, 24($sp)
li $s6,1
sw $s6, 24($sp)
L_25:
lw $s6, 24($sp)
lw $s5, 28($sp)
neg $s5, $s6
sw $s5, 28($sp)
L_26:
lw $s5, 28($sp)
move $v0, $s5
L_27:
lw $ra, 0($sp)
jr $ra
L_28:
lw $t1, 8($sp)
lw $t0, 12($sp)
lw $s4, 24($sp)
add $s4, $t1, $t0
sw $s4, 24($sp)
L_29:
lw $s4, 28($sp)
li $s4,2
sw $s4, 28($sp)
L_30:
lw $s4, 24($sp)
lw $s3, 28($sp)
lw $s2, 32($sp)
div $s4, $s3
mflo $s2
sw $s2, 32($sp)
L_31:
lw $s2, 36($sp)
lw $s1, 32($sp)
move $s2, $s1
sw $s2, 36($sp)
L_32:
lw $t1, 8($sp)
lw $t0, 12($sp)
lw $s2, 40($sp)
seq $s2, $t1, $t0
sw $s2, 40($sp)
L_33:
lw $s2, 40($sp)
beqz $s2, L_44
L_34:
lw $s0, 36($sp)
lw $t7, 44($sp)
li $t6, 4
mult $s0, $t6
mflo $t6
addi $t6, $t6, 40
lw $t5, 4($sp)
add $t6, $t5, $t6
lw $t7, ($t6)
sw $t7, 44($sp)
L_35:
lw $t7, 44($sp)
lw $t4, 16($sp)
lw $t3, 48($sp)
seq $t3, $t7, $t4
sw $t3, 48($sp)
L_36:
lw $t3, 48($sp)
beqz $t3, L_40
L_37:
lw $s0, 36($sp)
move $v0, $s0
L_38:
lw $ra, 0($sp)
jr $ra
L_39:
b L_44
L_40:
lw $t2, 52($sp)
li $t2,1
sw $t2, 52($sp)
L_41:
lw $t2, 52($sp)
lw $t1, 56($sp)
neg $t1, $t2
sw $t1, 56($sp)
L_42:
lw $t1, 56($sp)
move $v0, $t1
L_43:
lw $ra, 0($sp)
jr $ra
L_44:
lw $s0, 36($sp)
lw $t0, 44($sp)
li $s7, 4
mult $s0, $s7
mflo $s7
addi $s7, $s7, 40
lw $s6, 4($sp)
add $s7, $s6, $s7
lw $t0, ($s7)
sw $t0, 44($sp)
L_45:
lw $t0, 44($sp)
lw $t4, 16($sp)
lw $s5, 48($sp)
seq $s5, $t0, $t4
sw $s5, 48($sp)
L_46:
lw $s5, 48($sp)
beqz $s5, L_50
L_47:
lw $s0, 36($sp)
move $v0, $s0
L_48:
lw $ra, 0($sp)
jr $ra
L_49:
b L_74
L_50:
lw $s0, 36($sp)
lw $s4, 52($sp)
li $s3, 4
mult $s0, $s3
mflo $s3
addi $s3, $s3, 40
lw $s1, 4($sp)
add $s3, $s1, $s3
lw $s4, ($s3)
sw $s4, 52($sp)
L_51:
lw $s4, 52($sp)
lw $t4, 16($sp)
lw $s2, 56($sp)
sgt $s2, $s4, $t4
sw $s2, 56($sp)
L_52:
lw $s2, 56($sp)
beqz $s2, L_64
L_53:
lw $s0, 60($sp)
li $s0,1
sw $s0, 60($sp)
L_54:
lw $s0, 36($sp)
lw $t6, 60($sp)
lw $t5, 64($sp)
sub $t5, $s0, $t6
sw $t5, 64($sp)
L_55:
lw $t5, 4($sp)
sw $t5, -68($sp)
L_56:
lw $t7, 8($sp)
sw $t7, -64($sp)
L_57:
lw $t4, 64($sp)
sw $t4, -60($sp)
L_58:
lw $t3, 16($sp)
sw $t3, -56($sp)
L_59:
sub $sp, $sp, 72
jal Binary_binary
add $sp, $sp, 72
L_60:
lw $t2, 68($sp)
move $t2, $v0
sw $t2, 68($sp)
L_61:
lw $t2, 68($sp)
move $v0, $t2
L_62:
lw $ra, 0($sp)
jr $ra
L_63:
b L_74
L_64:
lw $t1, 60($sp)
li $t1,1
sw $t1, 60($sp)
L_65:
lw $s0, 36($sp)
lw $t1, 60($sp)
lw $s7, 64($sp)
add $s7, $s0, $t1
sw $s7, 64($sp)
L_66:
lw $s7, 4($sp)
sw $s7, -68($sp)
L_67:
lw $s6, 64($sp)
sw $s6, -64($sp)
L_68:
lw $t0, 12($sp)
sw $t0, -60($sp)
L_69:
lw $t3, 16($sp)
sw $t3, -56($sp)
L_70:
sub $sp, $sp, 72
jal Binary_binary
add $sp, $sp, 72
L_71:
lw $s5, 68($sp)
move $s5, $v0
sw $s5, 68($sp)
L_72:
lw $s5, 68($sp)
move $v0, $s5
L_73:
lw $ra, 0($sp)
jr $ra
L_74:
lw $ra, 0($sp)
jr $ra
L_75:
A_Main:
L_76:
sw $ra, 0($sp)
L_77:
li $a0, 84
li $v0, 9
syscall
lw $s3, 12($sp)
move $s3, $v0
sw $s3, 12($sp)
L_78:
lw $s3, 16($sp)
lw $s1, 12($sp)
move $s3, $s1
sw $s3, 16($sp)
L_79:
lw $s3, 24($sp)
li $s3,0
sw $s3, 24($sp)
L_80:
lw $s3, 20($sp)
lw $s4, 24($sp)
move $s3, $s4
sw $s3, 20($sp)
L_81:
lw $s3, 28($sp)
li $s3,10
sw $s3, 28($sp)
L_82:
lw $s3, 20($sp)
lw $s2, 28($sp)
lw $s0, 32($sp)
slt $s0, $s3, $s2
sw $s0, 32($sp)
L_83:
lw $s0, 32($sp)
beqz $s0, L_93
L_84:
b L_89
L_85:
lw $t6, 36($sp)
li $t6,1
sw $t6, 36($sp)
L_86:
lw $s3, 20($sp)
lw $t6, 36($sp)
lw $t5, 40($sp)
add $t5, $s3, $t6
sw $t5, 40($sp)
L_87:
lw $s3, 20($sp)
lw $t5, 40($sp)
move $s3, $t5
sw $s3, 20($sp)
L_88:
b L_81
L_89:
lw $s3, 44($sp)
lw $t7, 16($sp)
lw $s3, 40($t7)
sw $s3, 44($sp)
L_90:
lw $s3, 44($sp)
move $a0, $s3
li $v0, 1
syscall
L_91:
la $a0, s0
li $v0, 4
syscall
L_92:
b L_85
L_93:
lw $t4, 8($sp)
move $a0, $t4
li $v0, 1
syscall
L_94:
la $a0, s1
li $v0, 4
syscall
L_95:
lw $ra, 0($sp)
jr $ra
L_96:
sub $sp, $sp, 48
jal A_Main
add $sp, $sp, 48
L_97:
li $v0, 10
syscall
