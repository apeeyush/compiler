.data
s0:	.asciiz	"\n"

.text
main:
b A_Main
L_0:
A_fact:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,1
sw $s7, 12($sp)
L_3:
lw $s7, 8($sp)
lw $s6, 12($sp)
lw $s5, 16($sp)
seq $s5, $s7, $s6
sw $s5, 16($sp)
L_4:
lw $s5, 16($sp)
beqz $s5, L_8
L_5:
lw $s4, 20($sp)
li $s4,1
sw $s4, 20($sp)
L_6:
lw $s4, 20($sp)
move $v0, $s4
L_7:
lw $ra, 0($sp)
jr $ra
L_8:
lw $s3, 20($sp)
li $s3,1
sw $s3, 20($sp)
L_9:
lw $s7, 8($sp)
lw $s3, 20($sp)
lw $s2, 24($sp)
sub $s2, $s7, $s3
sw $s2, 24($sp)
L_10:
lw $s2, 4($sp)
sw $s2, -32($sp)
L_11:
lw $s1, 24($sp)
sw $s1, -28($sp)
L_12:
sub $sp, $sp, 36
jal A_fact
add $sp, $sp, 36
L_13:
lw $s0, 28($sp)
move $s0, $v0
sw $s0, 28($sp)
L_14:
lw $s0, 28($sp)
lw $s7, 8($sp)
lw $t7, 32($sp)
mult $s0, $s7
mflo $t7
sw $t7, 32($sp)
L_15:
lw $t7, 32($sp)
move $v0, $t7
L_16:
lw $ra, 0($sp)
jr $ra
L_17:
lw $ra, 0($sp)
jr $ra
L_18:
A_Main:
L_19:
sw $ra, 0($sp)
L_20:
lw $t6, 8($sp)
li $t6,8
sw $t6, 8($sp)
L_21:
lw $t6, 12($sp)
li $t6,9
sw $t6, 12($sp)
L_22:
lw $t6, 16($sp)
li $t6,10
sw $t6, 16($sp)
L_23:
li $t6, 0
lw $t5, 8($sp)
li $t4, 4
mult $t6, $t4
mflo $t4
addi $t4, $t4, 20
add $t4, $sp, $t4
sw $t5, ($t4)
L_24:
li $t3, 1
lw $t2, 12($sp)
li $t1, 4
mult $t3, $t1
mflo $t1
addi $t1, $t1, 20
add $t1, $sp, $t1
sw $t2, ($t1)
L_25:
li $t0, 2
lw $s7, 16($sp)
li $s6, 4
mult $t0, $s6
mflo $s6
addi $s6, $s6, 20
add $s6, $sp, $s6
sw $s7, ($s6)
L_26:
lw $s5, 32($sp)
li $s5,0
sw $s5, 32($sp)
L_27:
lw $s5, 36($sp)
li $s5,0
sw $s5, 36($sp)
L_28:
lw $s5, 40($sp)
lw $s4, 32($sp)
move $s5, $s4
sw $s5, 40($sp)
L_29:
lw $s5, 44($sp)
lw $s3, 36($sp)
move $s5, $s3
sw $s5, 44($sp)
L_30:
lw $s5, 48($sp)
li $s5,0
sw $s5, 48($sp)
L_31:
lw $s5, 44($sp)
lw $s2, 48($sp)
move $s5, $s2
sw $s5, 44($sp)
L_32:
lw $s5, 52($sp)
li $s5,3
sw $s5, 52($sp)
L_33:
lw $s5, 44($sp)
lw $s1, 52($sp)
lw $s0, 56($sp)
slt $s0, $s5, $s1
sw $s0, 56($sp)
L_34:
lw $s0, 56($sp)
beqz $s0, L_51
L_35:
b L_40
L_36:
lw $t7, 60($sp)
li $t7,1
sw $t7, 60($sp)
L_37:
lw $s5, 44($sp)
lw $t7, 60($sp)
lw $t6, 64($sp)
add $t6, $s5, $t7
sw $t6, 64($sp)
L_38:
lw $s5, 44($sp)
lw $t6, 64($sp)
move $s5, $t6
sw $s5, 44($sp)
L_39:
b L_32
L_40:
lw $s5, 44($sp)
lw $t5, 68($sp)
li $t4, 4
mult $s5, $t4
mflo $t4
addi $t4, $t4, 20
add $t4, $sp, $t4
lw $t5, ($t4)
sw $t5, 68($sp)
L_41:
lw $t5, 40($sp)
lw $t3, 68($sp)
lw $t2, 72($sp)
add $t2, $t5, $t3
sw $t2, 72($sp)
L_42:
lw $t5, 40($sp)
lw $t2, 72($sp)
move $t5, $t2
sw $t5, 40($sp)
L_43:
lw $s5, 44($sp)
lw $t5, 76($sp)
li $t1, 4
mult $s5, $t1
mflo $t1
addi $t1, $t1, 20
add $t1, $sp, $t1
lw $t5, ($t1)
sw $t5, 76($sp)
L_44:
lw $t5, 4($sp)
sw $t5, -32($sp)
L_45:
lw $t0, 76($sp)
sw $t0, -28($sp)
L_46:
sub $sp, $sp, 36
jal A_fact
add $sp, $sp, 36
L_47:
lw $s7, 80($sp)
move $s7, $v0
sw $s7, 80($sp)
L_48:
lw $s7, 80($sp)
move $a0, $s7
li $v0, 1
syscall
L_49:
la $a0, s0
li $v0, 4
syscall
L_50:
b L_36
L_51:
lw $s6, 40($sp)
move $a0, $s6
li $v0, 1
syscall
L_52:
lw $s4, 68($sp)
li $s4,0
sw $s4, 68($sp)
L_53:
lw $s4, 68($sp)
move $v0, $s4
L_54:
lw $ra, 0($sp)
jr $ra
L_55:
lw $ra, 0($sp)
jr $ra
L_56:
sub $sp, $sp, 84
jal A_Main
add $sp, $sp, 84
L_57:
li $v0, 10
syscall
