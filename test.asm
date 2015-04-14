.data
s2:	.asciiz	"\n"
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"
.text
main:
sub $sp, $sp, 152
jal Program_Main
add $sp, $sp, 152
li $v0, 10
syscall
L_0:
Program_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $t0, 8($sp)
li $t0,0
sw $t0, 8($sp)
L_3:
lw $t1, 12($sp)
li $t1,5
sw $t1, 12($sp)
L_4:
lw $t2, 16($sp)
lw $t3, 8($sp)
move $t2, $t3
sw $t2, 16($sp)
L_5:
lw $t4, 20($sp)
lw $t5, 12($sp)
move $t4, $t5
sw $t4, 20($sp)
L_6:
lw $t6, 24($sp)
li $t6,1
sw $t6, 24($sp)
L_7:
lw $t7, 28($sp)
li $t7,2
sw $t7, 28($sp)
L_8:
lw $s0, 32($sp)
li $s0,3
sw $s0, 32($sp)
L_9:
lw $s1, 36($sp)
li $s1,4
sw $s1, 36($sp)
L_10:
lw $s2, 40($sp)
li $s2,5
sw $s2, 40($sp)
L_11:
li $s3, 0
lw $s4, 24($sp)
li $s5, 4
mult $s3, $s5
mflo $s5
addi $s5, $s5, 44
add $s5, $sp, $s5
sw $s4, ($s5)
L_12:
li $s6, 1
lw $s7, 28($sp)
li $t0, 4
mult $s6, $t0
mflo $t0
addi $t0, $t0, 44
add $t0, $sp, $t0
sw $s7, ($t0)
L_13:
li $t1, 2
lw $t2, 32($sp)
li $t3, 4
mult $t1, $t3
mflo $t3
addi $t3, $t3, 44
add $t3, $sp, $t3
sw $t2, ($t3)
L_14:
li $t4, 3
lw $t5, 36($sp)
li $t6, 4
mult $t4, $t6
mflo $t6
addi $t6, $t6, 44
add $t6, $sp, $t6
sw $t5, ($t6)
L_15:
li $t7, 4
lw $s0, 40($sp)
li $s1, 4
mult $t7, $s1
mflo $s1
addi $s1, $s1, 44
add $s1, $sp, $s1
sw $s0, ($s1)
L_16:
lw $s2, 64($sp)
li $s2,1
sw $s2, 64($sp)
L_17:
lw $s3, 68($sp)
li $s3,2
sw $s3, 68($sp)
L_18:
lw $s4, 72($sp)
li $s4,3
sw $s4, 72($sp)
L_19:
lw $s5, 76($sp)
li $s5,4
sw $s5, 76($sp)
L_20:
lw $s6, 80($sp)
li $s6,5
sw $s6, 80($sp)
L_21:
li $s7, 0
lw $t0, 64($sp)
li $t1, 4
mult $s7, $t1
mflo $t1
addi $t1, $t1, 84
add $t1, $sp, $t1
sw $t0, ($t1)
L_22:
li $t2, 1
lw $t3, 68($sp)
li $t4, 4
mult $t2, $t4
mflo $t4
addi $t4, $t4, 84
add $t4, $sp, $t4
sw $t3, ($t4)
L_23:
li $t5, 2
lw $t6, 72($sp)
li $t7, 4
mult $t5, $t7
mflo $t7
addi $t7, $t7, 84
add $t7, $sp, $t7
sw $t6, ($t7)
L_24:
li $s0, 3
lw $s1, 76($sp)
li $s2, 4
mult $s0, $s2
mflo $s2
addi $s2, $s2, 84
add $s2, $sp, $s2
sw $s1, ($s2)
L_25:
li $s3, 4
lw $s4, 80($sp)
li $s5, 4
mult $s3, $s5
mflo $s5
addi $s5, $s5, 84
add $s5, $sp, $s5
sw $s4, ($s5)
L_26:
lw $s6, 104($sp)
li $s6,5
sw $s6, 104($sp)
L_27:
lw $s7, 16($sp)
lw $t0, 104($sp)
lw $t1, 108($sp)
slt $t1, $s7, $t0
sw $t1, 108($sp)
L_28:
lw $t2, 108($sp)
beqz $t2, L_56
L_29:
lw $t3, 112($sp)
li $t3,3
sw $t3, 112($sp)
L_30:
lw $t5, 112($sp)
lw $t6, 116($sp)
li $t4, -1
xor $t6, $t5, $t4
sw $t6, 116($sp)
L_31:
lw $t7, 16($sp)
lw $s0, 116($sp)
li $s1, 4
mult $t7, $s1
mflo $s1
addi $s1, $s1, 44
add $s1, $sp, $s1
sw $s0, ($s1)
L_32:
lw $s2, 16($sp)
lw $s3, 120($sp)
li $s4, 4
mult $s2, $s4
mflo $s4
addi $s4, $s4, 44
add $s4, $sp, $s4
lw $s3, ($s4)
sw $s3, 120($sp)
L_33:
lw $s5, 124($sp)
li $s5,1
sw $s5, 124($sp)
L_34:
lw $s6, 124($sp)
beqz $s6, L_53
L_35:
lw $t1, 128($sp)
li $t1,2
sw $t1, 128($sp)
L_36:
lw $s7, 16($sp)
lw $t0, 132($sp)
li $t2, 4
mult $s7, $t2
mflo $t2
addi $t2, $t2, 44
add $t2, $sp, $t2
lw $t0, ($t2)
sw $t0, 132($sp)
L_37:
lw $t3, 16($sp)
move $a0, $t3
li $v0, 1
syscall
L_38:
lw $t6, 128($sp)
move $a0, $t6
li $v0, 1
syscall
L_39:
lw $t4, 132($sp)
move $a0, $t4
li $v0, 1
syscall
L_40:
la $a0, s0
li $v0, 4
syscall
L_41:
lw $t5, 136($sp)
li $t5,2
sw $t5, 136($sp)
L_42:
lw $t7, 16($sp)
lw $s0, 140($sp)
li $s1, 4
mult $t7, $s1
mflo $s1
addi $s1, $s1, 84
add $s1, $sp, $s1
lw $s0, ($s1)
sw $s0, 140($sp)
L_43:
lw $s3, 16($sp)
move $a0, $s3
li $v0, 1
syscall
L_44:
lw $s2, 136($sp)
move $a0, $s2
li $v0, 1
syscall
L_45:
lw $s4, 140($sp)
move $a0, $s4
li $v0, 1
syscall
L_46:
la $a0, s1
li $v0, 4
syscall
L_47:
lw $s5, 144($sp)
li $s5,2
sw $s5, 144($sp)
L_48:
lw $s6, 16($sp)
lw $t1, 148($sp)
li $t0, 4
mult $s6, $t0
mflo $t0
addi $t0, $t0, 84
add $t0, $sp, $t0
lw $t1, ($t0)
sw $t1, 148($sp)
L_49:
lw $s7, 16($sp)
move $a0, $s7
li $v0, 1
syscall
L_50:
lw $t2, 144($sp)
move $a0, $t2
li $v0, 1
syscall
L_51:
lw $t3, 148($sp)
move $a0, $t3
li $v0, 1
syscall
L_52:
la $a0, s2
li $v0, 4
syscall
L_53:
lw $t6, 128($sp)
li $t6,1
sw $t6, 128($sp)
L_54:
lw $t4, 128($sp)
lw $t5, 16($sp)
add $t5, $t5, $t4
sw $t5, 16($sp)
L_55:
b L_26
L_56:
lw $s0, 112($sp)
li $s0,0
sw $s0, 112($sp)
L_57:
lw $t7, 112($sp)
move $v0, $t7
L_58:
lw $ra, 0($sp)
jr $ra
L_59:
lw $ra, 0($sp)
jr $ra
