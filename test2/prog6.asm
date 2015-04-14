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
lw $s7, 8($sp)
lw $s6, 12($sp)
mult $s7, $s7
mflo $s6
sw $s6, 12($sp)
L_3:
lw $s6, 12($sp)
move $v0, $s6
L_4:
lw $ra, 0($sp)
jr $ra
L_5:
lw $ra, 0($sp)
jr $ra
L_6:
B_fun2:
L_7:
sw $ra, 0($sp)
L_8:
lw $s5, 16($sp)
li $s5,5
sw $s5, 16($sp)
L_9:
lw $s5, 20($sp)
lw $s4, 16($sp)
move $s5, $s4
sw $s5, 20($sp)
L_10:
lw $s5, 24($sp)
li $s5,4
sw $s5, 24($sp)
L_11:
lw $s5, 28($sp)
li $s5,2
sw $s5, 28($sp)
L_12:
lw $s5, 24($sp)
lw $s3, 28($sp)
lw $s2, 32($sp)
slt $s2, $s5, $s3
sw $s2, 32($sp)
L_13:
lw $s2, 36($sp)
li $s2,1
sw $s2, 36($sp)
L_14:
lw $s2, 40($sp)
li $s2,2
sw $s2, 40($sp)
L_15:
lw $s2, 32($sp)
beqz $s2, L_18
L_16:
lw $s1, 44($sp)
lw $s0, 36($sp)
move $s1, $s0
sw $s1, 44($sp)
L_17:
b L_19
L_18:
lw $s1, 44($sp)
lw $t7, 40($sp)
move $s1, $t7
sw $s1, 44($sp)
L_19:
lw $s1, 48($sp)
lw $t6, 44($sp)
move $s1, $t6
sw $s1, 48($sp)
L_20:
lw $s1, 48($sp)
move $v0, $s1
L_21:
lw $ra, 0($sp)
jr $ra
L_22:
lw $ra, 0($sp)
jr $ra
L_23:
Program_Main:
L_24:
sw $ra, 0($sp)
L_25:
lw $t5, 8($sp)
li $t5,10
sw $t5, 8($sp)
L_26:
lw $t5, 12($sp)
lw $t4, 8($sp)
move $t5, $t4
sw $t5, 12($sp)
L_27:
lw $t5, 16($sp)
li $t5,20
sw $t5, 16($sp)
L_28:
lw $t5, 12($sp)
lw $t3, 16($sp)
lw $t2, 20($sp)
slt $t2, $t5, $t3
sw $t2, 20($sp)
L_29:
lw $t2, 20($sp)
beqz $t2, L_39
L_30:
lw $t1, 4($sp)
sw $t1, -12($sp)
L_31:
lw $t5, 12($sp)
sw $t5, -8($sp)
L_32:
sub $sp, $sp, 16
jal B_fun1
add $sp, $sp, 16
L_33:
lw $t0, 24($sp)
move $t0, $v0
sw $t0, 24($sp)
L_34:
lw $t0, 24($sp)
move $a0, $t0
li $v0, 1
syscall
L_35:
la $a0, s0
li $v0, 4
syscall
L_36:
lw $s7, 28($sp)
li $s7,1
sw $s7, 28($sp)
L_37:
lw $s7, 28($sp)
lw $t5, 12($sp)
add $t5, $t5, $s7
sw $t5, 12($sp)
L_38:
b L_27
L_39:
la $a0, s1
li $v0, 4
syscall
L_40:
lw $t5, 24($sp)
li $v0, 12
syscall
move $t5, $v0
sw $t5, 24($sp)
L_41:
lw $t5, 24($sp)
move $a0, $t5
li $v0, 11
syscall
L_42:
la $a0, s2
li $v0, 4
syscall
L_43:
lw $ra, 0($sp)
jr $ra
L_44:
sub $sp, $sp, 32
jal Program_Main
add $sp, $sp, 32
L_45:
li $v0, 10
syscall
