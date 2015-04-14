.data
s2:	.asciiz	"\n"
s1:	.asciiz	" "
s0:	.asciiz	" "

.text
main:
b A_Main
L_0:
A_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
li $s7,1
sw $s7, 8($sp)
L_3:
lw $s7, 16($sp)
lw $s6, 8($sp)
move $s7, $s6
sw $s7, 16($sp)
L_4:
lw $s7, 20($sp)
li $s7,1
sw $s7, 20($sp)
L_5:
lw $s7, 24($sp)
li $s7,53
sw $s7, 24($sp)
L_6:
lw $s7, 28($sp)
li $s7,5
sw $s7, 28($sp)
L_7:
lw $s7, 32($sp)
li $s7,3
sw $s7, 32($sp)
L_8:
lw $s7, 36($sp)
li $s7,1
sw $s7, 36($sp)
L_9:
li $s7, 0
lw $s5, 20($sp)
li $s4, 4
mult $s7, $s4
mflo $s4
addi $s4, $s4, 40
add $s4, $sp, $s4
sw $s5, ($s4)
L_10:
li $s3, 1
lw $s2, 24($sp)
li $s1, 4
mult $s3, $s1
mflo $s1
addi $s1, $s1, 40
add $s1, $sp, $s1
sw $s2, ($s1)
L_11:
li $s0, 2
lw $t7, 28($sp)
li $t6, 4
mult $s0, $t6
mflo $t6
addi $t6, $t6, 40
add $t6, $sp, $t6
sw $t7, ($t6)
L_12:
li $t5, 3
lw $t4, 32($sp)
li $t3, 4
mult $t5, $t3
mflo $t3
addi $t3, $t3, 40
add $t3, $sp, $t3
sw $t4, ($t3)
L_13:
li $t2, 4
lw $t1, 36($sp)
li $t0, 4
mult $t2, $t0
mflo $t0
addi $t0, $t0, 40
add $t0, $sp, $t0
sw $t1, ($t0)
L_14:
lw $s6, 60($sp)
li $s6,0
sw $s6, 60($sp)
L_15:
lw $s6, 12($sp)
lw $s7, 60($sp)
move $s6, $s7
sw $s6, 12($sp)
L_16:
lw $s6, 64($sp)
li $s6,5
sw $s6, 64($sp)
L_17:
lw $s6, 12($sp)
lw $s5, 64($sp)
lw $s4, 68($sp)
slt $s4, $s6, $s5
sw $s4, 68($sp)
L_18:
lw $s4, 68($sp)
beqz $s4, L_54
L_19:
b L_24
L_20:
lw $s3, 72($sp)
li $s3,1
sw $s3, 72($sp)
L_21:
lw $s6, 12($sp)
lw $s3, 72($sp)
lw $s2, 76($sp)
add $s2, $s6, $s3
sw $s2, 76($sp)
L_22:
lw $s6, 12($sp)
lw $s2, 76($sp)
move $s6, $s2
sw $s6, 12($sp)
L_23:
b L_16
L_24:
b L_49
L_25:
lw $s6, 80($sp)
li $s6,0
sw $s6, 80($sp)
L_26:
lw $s6, 16($sp)
lw $s1, 80($sp)
lw $s0, 84($sp)
slt $s0, $s6, $s1
sw $s0, 84($sp)
L_27:
lw $s0, 84($sp)
beqz $s0, L_31
L_28:
lw $s6, 16($sp)
lw $t7, 88($sp)
neg $t7, $s6
sw $t7, 88($sp)
L_29:
lw $t7, 88($sp)
move $a0, $t7
li $v0, 1
syscall
L_30:
b L_34
L_31:
lw $t6, 12($sp)
lw $t5, 88($sp)
li $t4, 4
mult $t6, $t4
mflo $t4
addi $t4, $t4, 40
add $t4, $sp, $t4
lw $t5, ($t4)
sw $t5, 88($sp)
L_32:
lw $t5, 88($sp)
move $a0, $t5
li $v0, 1
syscall
L_33:
la $a0, s0
li $v0, 4
syscall
L_34:
b L_53
L_35:
lw $t3, 88($sp)
li $t3,0
sw $t3, 88($sp)
L_36:
lw $s6, 16($sp)
lw $t3, 88($sp)
lw $t2, 92($sp)
slt $t2, $s6, $t3
sw $t2, 92($sp)
L_37:
lw $t2, 92($sp)
beqz $t2, L_43
L_38:
lw $s6, 16($sp)
lw $t1, 96($sp)
neg $t1, $s6
sw $t1, 96($sp)
L_39:
lw $t1, 100($sp)
li $t1,2
sw $t1, 100($sp)
L_40:
lw $t1, 96($sp)
lw $t0, 100($sp)
lw $s7, 104($sp)
mult $t1, $t0
mflo $s7
sw $s7, 104($sp)
L_41:
lw $s7, 104($sp)
move $a0, $s7
li $v0, 1
syscall
L_42:
b L_48
L_43:
lw $t6, 12($sp)
lw $s5, 96($sp)
li $s4, 4
mult $t6, $s4
mflo $s4
addi $s4, $s4, 40
add $s4, $sp, $s4
lw $s5, ($s4)
sw $s5, 96($sp)
L_44:
lw $s5, 100($sp)
li $s5,2
sw $s5, 100($sp)
L_45:
lw $s5, 96($sp)
lw $s3, 100($sp)
lw $s2, 104($sp)
mult $s5, $s3
mflo $s2
sw $s2, 104($sp)
L_46:
lw $s2, 104($sp)
move $a0, $s2
li $v0, 1
syscall
L_47:
la $a0, s1
li $v0, 4
syscall
L_48:
b L_53
L_49:
lw $s6, 80($sp)
li $s6,1
sw $s6, 80($sp)
L_50:
lw $s6, 16($sp)
lw $s1, 80($sp)
beq $s6, $s1, L_25
L_51:
lw $s0, 84($sp)
li $s0,2
sw $s0, 84($sp)
L_52:
lw $s6, 16($sp)
lw $s0, 84($sp)
beq $s6, $s0, L_35
L_53:
b L_20
L_54:
la $a0, s2
li $v0, 4
syscall
L_55:
lw $ra, 0($sp)
jr $ra
L_56:
sub $sp, $sp, 108
jal A_Main
add $sp, $sp, 108
L_57:
li $v0, 10
syscall
