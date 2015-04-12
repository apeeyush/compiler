.data
.text
main:
b A_Main
L_0:
A_newFun:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
move $a0, $s7
li $v0, 1
syscall
L_3:
lw $s6, 12($sp)
move $a0, $s6
li $v0, 1
syscall
L_4:
lw $s5, 16($sp)
li $s5,9
sw $s5, 16($sp)
L_5:
lw $s5, 20($sp)
lw $s4, 16($sp)
move $s5, $s4
sw $s5, 20($sp)
L_6:
lw $s5, 20($sp)
move $a0, $s5
li $v0, 1
syscall
L_7:
lw $s3, 24($sp)
li $s3,1
sw $s3, 24($sp)
L_8:
lw $s3, 24($sp)
move $v0, $s3
L_9:
lw $ra, 0($sp)
jr $ra
L_10:
lw $ra, 0($sp)
jr $ra
L_11:
A_Main:
L_12:
sw $ra, 0($sp)
L_13:
lw $s2, 12($sp)
li $s2,3
sw $s2, 12($sp)
L_14:
lw $s2, 16($sp)
lw $s1, 12($sp)
move $s2, $s1
sw $s2, 16($sp)
L_15:
lw $s2, 20($sp)
li $s2,0
sw $s2, 20($sp)
L_16:
lw $s2, 8($sp)
lw $s0, 20($sp)
move $s2, $s0
sw $s2, 8($sp)
L_17:
lw $s2, 24($sp)
li $s2,5
sw $s2, 24($sp)
L_18:
lw $s2, 8($sp)
lw $t7, 24($sp)
lw $t6, 28($sp)
slt $t6, $s2, $t7
sw $t6, 28($sp)
L_19:
lw $t6, 28($sp)
beqz $t6, L_27
L_20:
b L_25
L_21:
lw $t5, 32($sp)
li $t5,1
sw $t5, 32($sp)
L_22:
lw $s2, 8($sp)
lw $t5, 32($sp)
lw $t4, 36($sp)
add $t4, $s2, $t5
sw $t4, 36($sp)
L_23:
lw $s2, 8($sp)
lw $t4, 36($sp)
move $s2, $t4
sw $s2, 8($sp)
L_24:
b L_17
L_25:
lw $s2, 16($sp)
move $a0, $s2
li $v0, 1
syscall
L_26:
b L_21
L_27:
lw $t3, 4($sp)
sw $t3-24($sp)
L_28:
lw $s2, 16($sp)
sw $s2, -20($sp)
L_29:
lw $t2, 8($sp)
sw $t2, -16($sp)
L_30:
sub $sp, $sp, 28
jal A_newFun
add $sp, $sp, 28
L_31:
lw $t1, 40($sp)
move $t1, $v0
sw $t1, 40($sp)
L_32:
lw $t1, 44($sp)
lw $t0, 40($sp)
move $t1, $t0
sw $t1, 44($sp)
L_33:
lw $t1, 44($sp)
move $a0, $t1
li $v0, 1
syscall
L_34:
sw $t1, 44($sp)
lw $t1, 48($sp)
li $t1,0
sw $t1, 48($sp)
L_35:
lw $t1, 48($sp)
move $v0, $t1
L_36:
lw $ra, 0($sp)
jr $ra
L_37:
lw $ra, 0($sp)
jr $ra
L_38:
sub $sp, $sp, 52
jal A_Main
add $sp, $sp, 52
L_39:
li $v0, 10
syscall
