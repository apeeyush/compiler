.data

.text
main:
b A_Main
L_0:
B_fact:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,0
sw $s7, 12($sp)
L_3:
lw $s7, 8($sp)
lw $s6, 12($sp)
lw $s5, 16($sp)
seq $s5, $s7, $s6
sw $s5, 16($sp)
L_4:
lw $s5, 16($sp)
beqz $s5, L_9
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
b L_18
L_9:
lw $s3, 20($sp)
li $s3,1
sw $s3, 20($sp)
L_10:
lw $s7, 8($sp)
lw $s3, 20($sp)
lw $s2, 24($sp)
sub $s2, $s7, $s3
sw $s2, 24($sp)
L_11:
lw $s2, 4($sp)
sw $s2, -32($sp)
L_12:
lw $s1, 24($sp)
sw $s1, -28($sp)
L_13:
sub $sp, $sp, 36
jal B_fact
add $sp, $sp, 36
L_14:
lw $s0, 28($sp)
move $s0, $v0
sw $s0, 28($sp)
L_15:
lw $s7, 8($sp)
lw $s0, 28($sp)
lw $t7, 32($sp)
mult $s7, $s0
mflo $t7
sw $t7, 32($sp)
L_16:
lw $t7, 32($sp)
move $v0, $t7
L_17:
lw $ra, 0($sp)
jr $ra
L_18:
lw $ra, 0($sp)
jr $ra
L_19:
B_printc:
L_20:
sw $ra, 0($sp)
L_21:
lw $t6, 4($sp)
sw $t6, -32($sp)
L_22:
lw $t5, 8($sp)
sw $t5, -28($sp)
L_23:
sub $sp, $sp, 36
jal B_fact
add $sp, $sp, 36
L_24:
lw $t4, 12($sp)
move $t4, $v0
sw $t4, 12($sp)
L_25:
lw $t4, 12($sp)
lw $t3, 4($sp)
sw $t4, 0($t3)
L_26:
lw $ra, 0($sp)
jr $ra
L_27:
A_Main:
L_28:
sw $ra, 0($sp)
L_29:
lw $t2, 8($sp)
li $t2,10
sw $t2, 8($sp)
L_30:
lw $t2, 12($sp)
li $t2,0
sw $t2, 12($sp)
L_31:
lw $t2, 16($sp)
lw $t1, 8($sp)
move $t2, $t1
sw $t2, 16($sp)
L_32:
lw $t2, 20($sp)
lw $t0, 12($sp)
move $t2, $t0
sw $t2, 20($sp)
L_33:
li $a0, 4
li $v0, 9
syscall
lw $t2, 24($sp)
move $t2, $v0
sw $t2, 24($sp)
L_34:
lw $t2, 28($sp)
sw $s7, 8($sp)
lw $s7, 24($sp)
move $t2, $s7
sw $t2, 28($sp)
L_35:
lw $t2, 28($sp)
sw $t2, -12($sp)
L_36:
sw $s6, 12($sp)
lw $s6, 16($sp)
sw $s6, -8($sp)
L_37:
sub $sp, $sp, 16
jal B_printc
add $sp, $sp, 16
L_38:
sw $s5, 16($sp)
lw $s5, 32($sp)
sw $s4, 20($sp)
lw $s4, 28($sp)
lw $s5, 0($s4)
sw $s5, 32($sp)
L_39:
lw $s6, 16($sp)
lw $s5, 32($sp)
move $s6, $s5
sw $s6, 16($sp)
L_40:
lw $s6, 16($sp)
move $a0, $s6
li $v0, 1
syscall
L_41:
sw $s3, 20($sp)
lw $s3, 36($sp)
li $s3,0
sw $s3, 36($sp)
L_42:
lw $s3, 36($sp)
move $v0, $s3
L_43:
lw $ra, 0($sp)
jr $ra
L_44:
lw $ra, 0($sp)
jr $ra
L_45:
sub $sp, $sp, 40
jal A_Main
add $sp, $sp, 40
L_46:
li $v0, 10
syscall
