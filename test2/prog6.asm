.data
s2:	.asciiz	"\n"
s1:	.asciiz	"\nEnter a character:\n"
s0:	.asciiz	" "

.text
main:
b Program_Main
L_0:
B_fun1:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
lw $s6, 4($sp)
lw $s7, 0($s6)
sw $s7, 8($sp)
L_3:
lw $s7, 12($sp)
lw $s5, 4($sp)
lw $s7, 0($s5)
sw $s7, 12($sp)
L_4:
lw $s7, 8($sp)
lw $s4, 12($sp)
lw $s3, 16($sp)
mult $s7, $s4
mflo $s3
sw $s3, 16($sp)
L_5:
lw $s3, 16($sp)
move $v0, $s3
L_6:
lw $ra, 0($sp)
jr $ra
L_7:
lw $ra, 0($sp)
jr $ra
L_8:
B_fun2:
L_9:
sw $ra, 0($sp)
L_10:
lw $s2, 16($sp)
li $s2,5
sw $s2, 16($sp)
L_11:
lw $s2, 20($sp)
lw $s1, 16($sp)
move $s2, $s1
sw $s2, 20($sp)
L_12:
lw $s2, 24($sp)
li $s2,4
sw $s2, 24($sp)
L_13:
lw $s2, 28($sp)
li $s2,2
sw $s2, 28($sp)
L_14:
lw $s2, 24($sp)
lw $s0, 28($sp)
lw $t7, 32($sp)
slt $t7, $s2, $s0
sw $t7, 32($sp)
L_15:
lw $t7, 36($sp)
li $t7,1
sw $t7, 36($sp)
L_16:
lw $t7, 40($sp)
li $t7,2
sw $t7, 40($sp)
L_17:
lw $t7, 32($sp)
beqz $t7, L_20
L_18:
lw $t6, 44($sp)
lw $t5, 36($sp)
move $t6, $t5
sw $t6, 44($sp)
L_19:
b L_21
L_20:
lw $t6, 44($sp)
lw $t4, 40($sp)
move $t6, $t4
sw $t6, 44($sp)
L_21:
lw $t6, 48($sp)
lw $t3, 44($sp)
move $t6, $t3
sw $t6, 48($sp)
L_22:
lw $t6, 48($sp)
move $v0, $t6
L_23:
lw $ra, 0($sp)
jr $ra
L_24:
lw $ra, 0($sp)
jr $ra
L_25:
Program_fun1:
L_26:
sw $ra, 0($sp)
L_27:
lw $t2, 8($sp)
move $v0, $t2
L_28:
lw $ra, 0($sp)
jr $ra
L_29:
lw $ra, 0($sp)
jr $ra
L_30:
Program_Main:
L_31:
sw $ra, 0($sp)
L_32:
lw $t1, 8($sp)
li $t1,10
sw $t1, 8($sp)
L_33:
lw $t1, 12($sp)
lw $t0, 8($sp)
move $t1, $t0
sw $t1, 12($sp)
L_34:
li $a0, 4
li $v0, 9
syscall
lw $t1, 16($sp)
move $t1, $v0
sw $t1, 16($sp)
L_35:
lw $t1, 20($sp)
lw $s6, 16($sp)
move $t1, $s6
sw $t1, 20($sp)
L_36:
lw $t1, 24($sp)
li $t1,20
sw $t1, 24($sp)
L_37:
lw $t1, 12($sp)
lw $s5, 24($sp)
lw $s7, 28($sp)
slt $s7, $t1, $s5
sw $s7, 28($sp)
L_38:
lw $s7, 28($sp)
beqz $s7, L_49
L_39:
lw $t1, 12($sp)
lw $s4, 20($sp)
sw $t1, 0($s4)
L_40:
lw $s3, 32($sp)
lw $s4, 20($sp)
lw $s3, 0($s4)
sw $s3, 32($sp)
L_41:
lw $s3, 20($sp)
sw $s3, -16($sp)
L_42:
sub $sp, $sp, 20
jal B_fun1
add $sp, $sp, 20
L_43:
lw $s1, 36($sp)
move $s1, $v0
sw $s1, 36($sp)
L_44:
lw $s1, 36($sp)
move $a0, $s1
li $v0, 1
syscall
L_45:
la $a0, s0
li $v0, 4
syscall
L_46:
lw $s2, 40($sp)
li $s2,1
sw $s2, 40($sp)
L_47:
lw $s2, 40($sp)
lw $t1, 12($sp)
add $t1, $t1, $s2
sw $t1, 12($sp)
L_48:
b L_36
L_49:
la $a0, s1
li $v0, 4
syscall
L_50:
lw $t1, 32($sp)
li $v0, 12
syscall
move $t1, $v0
sw $t1, 32($sp)
L_51:
lw $t1, 32($sp)
move $a0, $t1
li $v0, 11
syscall
L_52:
la $a0, s2
li $v0, 4
syscall
L_53:
lw $ra, 0($sp)
jr $ra
L_54:
sub $sp, $sp, 44
jal Program_Main
add $sp, $sp, 44
L_55:
li $v0, 10
syscall
