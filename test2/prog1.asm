.data
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"

.text
main:
b Program_Main
L_0:
Program_helloworld:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
lw $s7, 12($sp)
lw $s6, 16($sp)
mult $s7, $s7
mflo $s6
sw $s6, 16($sp)
L_3:
lw $s6, 8($sp)
lw $s5, 16($sp)
lw $s4, 20($sp)
seq $s4, $s6, $s5
sw $s4, 20($sp)
L_4:
lw $s4, 20($sp)
beqz $s4, L_7
L_5:
lw $s6, 8($sp)
move $v0, $s6
L_6:
lw $ra, 0($sp)
jr $ra
L_7:
lw $s3, 24($sp)
li $s3,1
sw $s3, 24($sp)
L_8:
lw $s6, 8($sp)
lw $s3, 24($sp)
lw $s2, 28($sp)
add $s2, $s6, $s3
sw $s2, 28($sp)
L_9:
lw $s6, 8($sp)
lw $s2, 28($sp)
move $s6, $s2
sw $s6, 8($sp)
L_10:
lw $s6, 4($sp)
sw $s6, -32($sp)
L_11:
lw $s1, 8($sp)
sw $s1, -28($sp)
L_12:
lw $s7, 12($sp)
sw $s7, -24($sp)
L_13:
sub $sp, $sp, 36
jal Program_helloworld
add $sp, $sp, 36
L_14:
lw $s0, 32($sp)
move $s0, $v0
sw $s0, 32($sp)
L_15:
lw $s0, 32($sp)
move $v0, $s0
L_16:
lw $ra, 0($sp)
jr $ra
L_17:
lw $ra, 0($sp)
jr $ra
L_18:
Program_Main:
L_19:
sw $ra, 0($sp)
L_20:
lw $t7, 8($sp)
li $t7,0
sw $t7, 8($sp)
L_21:
lw $t7, 12($sp)
li $t7,5
sw $t7, 12($sp)
L_22:
lw $t7, 16($sp)
lw $t6, 8($sp)
move $t7, $t6
sw $t7, 16($sp)
L_23:
lw $t7, 20($sp)
lw $t5, 12($sp)
move $t7, $t5
sw $t7, 20($sp)
L_24:
lw $t7, 24($sp)
li $t7,1
sw $t7, 24($sp)
L_25:
lw $t7, 28($sp)
li $t7,1
sw $t7, 28($sp)
L_26:
lw $t7, 32($sp)
li $t7,0
sw $t7, 32($sp)
L_27:
lw $t7, 36($sp)
li $t7,0
sw $t7, 36($sp)
L_28:
lw $t7, 40($sp)
li $t7,1
sw $t7, 40($sp)
L_29:
li $t7, 0
lw $t4, 24($sp)
li $t3, 4
mult $t7, $t3
mflo $t3
addi $t3, $t3, 44
add $t3, $sp, $t3
sw $t4, ($t3)
L_30:
li $t2, 1
lw $t1, 28($sp)
li $t0, 4
mult $t2, $t0
mflo $t0
addi $t0, $t0, 44
add $t0, $sp, $t0
sw $t1, ($t0)
L_31:
li $s7, 2
lw $s5, 32($sp)
li $s4, 4
mult $s7, $s4
mflo $s4
addi $s4, $s4, 44
add $s4, $sp, $s4
sw $s5, ($s4)
L_32:
li $s3, 3
lw $s2, 36($sp)
li $s6, 4
mult $s3, $s6
mflo $s6
addi $s6, $s6, 44
add $s6, $sp, $s6
sw $s2, ($s6)
L_33:
li $s1, 4
lw $s0, 40($sp)
li $t6, 4
mult $s1, $t6
mflo $t6
addi $t6, $t6, 44
add $t6, $sp, $t6
sw $s0, ($t6)
L_34:
lw $t5, 4($sp)
sw $t5, -32($sp)
L_35:
lw $t7, 16($sp)
sw $t7, -28($sp)
L_36:
lw $t4, 20($sp)
sw $t4, -24($sp)
L_37:
sub $sp, $sp, 36
jal Program_helloworld
add $sp, $sp, 36
L_38:
lw $t3, 64($sp)
move $t3, $v0
sw $t3, 64($sp)
L_39:
lw $t3, 64($sp)
move $a0, $t3
li $v0, 1
syscall
L_40:
la $a0, s0
li $v0, 4
syscall
L_41:
lw $t2, 68($sp)
li $t2,0
sw $t2, 68($sp)
L_42:
lw $t1, 68($sp)
lw $t0, 72($sp)
li $t2, 1
xor $t0, $t1, $t2
sw $t0, 72($sp)
L_43:
lw $t7, 16($sp)
lw $t0, 72($sp)
li $s7, 4
mult $t7, $s7
mflo $s7
addi $s7, $s7, 44
add $s7, $sp, $s7
sw $t0, ($s7)
L_44:
lw $t7, 16($sp)
lw $s5, 76($sp)
li $s4, 4
mult $t7, $s4
mflo $s4
addi $s4, $s4, 44
add $s4, $sp, $s4
lw $s5, ($s4)
sw $s5, 76($sp)
L_45:
lw $s5, 80($sp)
li $s5,0
sw $s5, 80($sp)
L_46:
lw $s5, 84($sp)
li $s5,1
sw $s5, 84($sp)
L_47:
lw $s5, 80($sp)
lw $s3, 84($sp)
beq $s5, $s3, L_51
L_48:
lw $s2, 88($sp)
li $s2,1
sw $s2, 88($sp)
L_49:
lw $s2, 92($sp)
lw $s6, 88($sp)
move $s2, $s6
sw $s2, 92($sp)
L_50:
b L_52
L_51:
lw $s2, 92($sp)
li $s2,1
sw $s2, 92($sp)
L_52:
lw $s2, 92($sp)
beqz $s2, L_56
L_53:
lw $t7, 16($sp)
lw $s1, 96($sp)
li $s0, 4
mult $t7, $s0
mflo $s0
addi $s0, $s0, 44
add $s0, $sp, $s0
lw $s1, ($s0)
sw $s1, 96($sp)
L_54:
lw $s1, 96($sp)
move $a0, $s1
li $v0, 1
syscall
L_55:
la $a0, s1
li $v0, 4
syscall
L_56:
lw $t6, 96($sp)
li $t6,1
sw $t6, 96($sp)
L_57:
lw $t6, 96($sp)
lw $t7, 16($sp)
add $t7, $t7, $t6
sw $t7, 16($sp)
L_58:
lw $t7, 16($sp)
lw $t7, 16($sp)
move $t7, $t7
sw $t7, 16($sp)
L_59:
lw $t7, 16($sp)
lw $t4, 20($sp)
lw $t5, 64($sp)
slt $t5, $t7, $t4
sw $t5, 64($sp)
L_60:
lw $t5, 64($sp)
beqz $t5, L_62
L_61:
b L_34
L_62:
lw $t4, 68($sp)
li $t4,0
sw $t4, 68($sp)
L_63:
lw $t4, 68($sp)
move $v0, $t4
L_64:
lw $ra, 0($sp)
jr $ra
L_65:
lw $ra, 0($sp)
jr $ra
L_66:
sub $sp, $sp, 100
jal Program_Main
add $sp, $sp, 100
L_67:
li $v0, 10
syscall
