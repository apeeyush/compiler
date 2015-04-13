.data

.text
main:
L_0:
A_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
li $s7,0
sw $s7, 8($sp)
L_3:
lw $s7, 12($sp)
li $s7,0
sw $s7, 12($sp)
L_4:
lw $s7, 16($sp)
lw $s6, 8($sp)
move $s7, $s6
sw $s7, 16($sp)
L_5:
lw $s7, 20($sp)
lw $s5, 12($sp)
move $s7, $s5
sw $s7, 20($sp)
L_6:
lw $s7, 24($sp)
li $s7,1
sw $s7, 24($sp)
L_7:
lw $s7, 28($sp)
li $s7,2
sw $s7, 28($sp)
L_8:
lw $s7, 32($sp)
li $s7,3
sw $s7, 32($sp)
L_9:
lw $s7, 36($sp)
li $s7,4
sw $s7, 36($sp)
L_10:
lw $s7, 40($sp)
li $s7,5
sw $s7, 40($sp)
L_11:
lw $s7, 44($sp)
li $s7,6
sw $s7, 44($sp)
L_12:
li $s7, 0
lw $s4, 24($sp)
li $s3, 4
mult $s7, $s3
mflo $s3
addi $s3, $s3, 48
add $s3, $sp, $s3
sw $s4, ($s3)
L_13:
li $s2, 1
lw $s1, 28($sp)
li $s0, 4
mult $s2, $s0
mflo $s0
addi $s0, $s0, 48
add $s0, $sp, $s0
sw $s1, ($s0)
L_14:
li $t7, 2
lw $t6, 32($sp)
li $t5, 4
mult $t7, $t5
mflo $t5
addi $t5, $t5, 48
add $t5, $sp, $t5
sw $t6, ($t5)
L_15:
li $t4, 3
lw $t3, 36($sp)
li $t2, 4
mult $t4, $t2
mflo $t2
addi $t2, $t2, 48
add $t2, $sp, $t2
sw $t3, ($t2)
L_16:
li $t1, 4
lw $t0, 40($sp)
sw $s6, 8($sp)
li $s6, 4
mult $t1, $s6
mflo $s6
addi $s6, $s6, 48
add $s6, $sp, $s6
sw $t0, ($s6)
L_17:
sw $s5, 12($sp)
li $s5, 5
lw $s7, 44($sp)
sw $s4, 24($sp)
li $s4, 4
mult $s5, $s4
mflo $s4
addi $s4, $s4, 48
add $s4, $sp, $s4
sw $s7, ($s4)
L_18:
lw $s3, 72($sp)
li $s3,0
sw $s3, 72($sp)
L_19:
lw $s3, 20($sp)
lw $s2, 72($sp)
move $s3, $s2
sw $s3, 20($sp)
L_20:
lw $s3, 76($sp)
li $s3,6
sw $s3, 76($sp)
L_21:
lw $s3, 20($sp)
sw $s1, 28($sp)
lw $s1, 76($sp)
lw $s0, 80($sp)
slt $s0, $s3, $s1
sw $s0, 80($sp)
L_22:
lw $s0, 80($sp)
beqz $s0, L_32
L_23:
b L_28
L_24:
lw $t7, 84($sp)
li $t7,1
sw $t7, 84($sp)
L_25:
lw $s3, 20($sp)
lw $t7, 84($sp)
sw $t6, 32($sp)
lw $t6, 88($sp)
add $t6, $s3, $t7
sw $t6, 88($sp)
L_26:
lw $s3, 20($sp)
lw $t6, 88($sp)
move $s3, $t6
sw $s3, 20($sp)
L_27:
b L_20
L_28:
lw $s3, 20($sp)
lw $t5, 92($sp)
li $t4, 4
mult $s3, $t4
mflo $t4
addi $t4, $t4, 48
add $t4, $sp, $t4
lw $t5, ($t4)
sw $t5, 92($sp)
L_29:
lw $t5, 16($sp)
sw $t3, 36($sp)
lw $t3, 92($sp)
lw $t2, 96($sp)
add $t2, $t5, $t3
sw $t2, 96($sp)
L_30:
lw $t5, 16($sp)
lw $t2, 96($sp)
move $t5, $t2
sw $t5, 16($sp)
L_31:
b L_24
L_32:
lw $t5, 16($sp)
move $a0, $t5
li $v0, 1
syscall
L_33:
lw $t1, 92($sp)
li $t1,0
sw $t1, 92($sp)
L_34:
lw $t1, 92($sp)
move $v0, $t1
L_35:
lw $ra, 0($sp)
jr $ra
L_36:
lw $ra, 0($sp)
jr $ra
L_37:
sub $sp, $sp, 100
jal A_Main
add $sp, $sp, 100
L_38:
li $v0, 10
syscall
