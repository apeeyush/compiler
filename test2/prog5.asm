.data
s3:	.asciiz	"\n"
s2:	.asciiz	"Enter number of plates:\n"
s1:	.asciiz	"->"
s0:	.asciiz	"\n"

.text
main:
b A_Main
L_0:
A_TOH:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 24($sp)
li $s7,0
sw $s7, 24($sp)
L_3:
lw $s7, 8($sp)
lw $s6, 24($sp)
lw $s5, 28($sp)
sgt $s5, $s7, $s6
sw $s5, 28($sp)
L_4:
lw $s5, 28($sp)
beqz $s5, L_25
L_5:
lw $s4, 32($sp)
li $s4,1
sw $s4, 32($sp)
L_6:
lw $s7, 8($sp)
lw $s4, 32($sp)
lw $s3, 36($sp)
sub $s3, $s7, $s4
sw $s3, 36($sp)
L_7:
lw $s3, 4($sp)
sw $s3, -44($sp)
L_8:
lw $s2, 36($sp)
sw $s2, -40($sp)
L_9:
lw $s1, 12($sp)
sw $s1, -36($sp)
L_10:
lw $s0, 20($sp)
sw $s0, -32($sp)
L_11:
lw $t7, 16($sp)
sw $t7, -28($sp)
L_12:
sub $sp, $sp, 48
jal A_TOH
add $sp, $sp, 48
L_13:
la $a0, s0
li $v0, 4
syscall
L_14:
lw $s1, 12($sp)
move $a0, $s1
li $v0, 11
syscall
L_15:
la $a0, s1
li $v0, 4
syscall
L_16:
lw $t7, 16($sp)
move $a0, $t7
li $v0, 11
syscall
L_17:
lw $t6, 40($sp)
li $t6,1
sw $t6, 40($sp)
L_18:
lw $s7, 8($sp)
lw $t6, 40($sp)
lw $t5, 44($sp)
sub $t5, $s7, $t6
sw $t5, 44($sp)
L_19:
lw $t5, 4($sp)
sw $t5, -44($sp)
L_20:
lw $t4, 44($sp)
sw $t4, -40($sp)
L_21:
lw $s0, 20($sp)
sw $s0, -36($sp)
L_22:
lw $t7, 16($sp)
sw $t7, -32($sp)
L_23:
lw $s1, 12($sp)
sw $s1, -28($sp)
L_24:
sub $sp, $sp, 48
jal A_TOH
add $sp, $sp, 48
L_25:
lw $ra, 0($sp)
jr $ra
L_26:
A_Main:
L_27:
sw $ra, 0($sp)
L_28:
la $a0, s2
li $v0, 4
syscall
L_29:
lw $t3, 8($sp)
li $v0, 5
syscall
move $t3, $v0
sw $t3, 8($sp)
L_30:
lw $t3, 12($sp)
li $t3,'A'
sw $t3, 12($sp)
L_31:
lw $t3, 16($sp)
li $t3,'B'
sw $t3, 16($sp)
L_32:
lw $t3, 20($sp)
li $t3,'C'
sw $t3, 20($sp)
L_33:
lw $t3, 4($sp)
sw $t3, -44($sp)
L_34:
lw $t2, 8($sp)
sw $t2, -40($sp)
L_35:
lw $t1, 12($sp)
sw $t1, -36($sp)
L_36:
lw $t0, 16($sp)
sw $t0, -32($sp)
L_37:
lw $s7, 20($sp)
sw $s7, -28($sp)
L_38:
sub $sp, $sp, 48
jal A_TOH
add $sp, $sp, 48
L_39:
la $a0, s3
li $v0, 4
syscall
L_40:
lw $s6, 24($sp)
li $s6,0
sw $s6, 24($sp)
L_41:
lw $s6, 24($sp)
move $v0, $s6
L_42:
lw $ra, 0($sp)
jr $ra
L_43:
lw $ra, 0($sp)
jr $ra
L_44:
sub $sp, $sp, 28
jal A_Main
add $sp, $sp, 28
L_45:
li $v0, 10
syscall
