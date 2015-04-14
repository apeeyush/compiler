.data

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
li $t7,5
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
lw $t7, 4($sp)
sw $t7, -32($sp)
L_25:
lw $t4, 16($sp)
sw $t4, -28($sp)
L_26:
lw $t3, 20($sp)
sw $t3, -24($sp)
L_27:
sub $sp, $sp, 36
jal Program_helloworld
add $sp, $sp, 36
L_28:
lw $t2, 24($sp)
move $t2, $v0
sw $t2, 24($sp)
L_29:
lw $t2, 24($sp)
move $a0, $t2
li $v0, 1
syscall
L_30:
lw $t1, 28($sp)
li $t1,0
sw $t1, 28($sp)
L_31:
lw $t1, 28($sp)
move $v0, $t1
L_32:
lw $ra, 0($sp)
jr $ra
L_33:
lw $ra, 0($sp)
jr $ra
L_34:
sub $sp, $sp, 32
jal Program_Main
add $sp, $sp, 32
L_35:
li $v0, 10
syscall
