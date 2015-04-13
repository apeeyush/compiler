.data

.text
main:
b A_Main
L_0:
B_printc:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,1
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
li $s7,5
sw $s7, 16($sp)
L_4:
lw $s7, 12($sp)
lw $s6, 16($sp)
li $s5, 4
mult $s7, $s5
mflo $s5
addi $s5, $s5, 0
lw $s4, 4($sp)
add $s5, $s4, $s5
sw $s6, ($s5)
L_5:
lw $s7, 12($sp)
lw $s3, 20($sp)
li $s2, 4
mult $s7, $s2
mflo $s2
addi $s2, $s2, 0
lw $s1, 4($sp)
add $s2, $s1, $s2
lw $s3, ($s2)
sw $s3, 20($sp)
L_6:
lw $s3, 8($sp)
lw $s0, 24($sp)
li $t7, 4
mult $s3, $t7
mflo $t7
addi $t7, $t7, 0
lw $t6, 4($sp)
add $t7, $t6, $t7
lw $s0, ($t7)
sw $s0, 24($sp)
L_7:
lw $s0, 24($sp)
move $a0, $s0
li $v0, 1
syscall
L_8:
lw $ra, 0($sp)
jr $ra
L_9:
lw $ra, 0($sp)
jr $ra
L_10:
A_Main:
L_11:
sw $ra, 0($sp)
L_12:
lw $t5, 8($sp)
li $t5,1
sw $t5, 8($sp)
L_13:
lw $t5, 12($sp)
lw $t4, 8($sp)
move $t5, $t4
sw $t5, 12($sp)
L_14:
li $a0, 24
li $v0, 9
syscall
lw $t5, 16($sp)
move $t5, $v0
sw $t5, 16($sp)
L_15:
lw $t5, 20($sp)
lw $t3, 16($sp)
move $t5, $t3
sw $t5, 20($sp)
L_16:
lw $t5, 20($sp)
sw $t5, -24($sp)
L_17:
lw $t2, 12($sp)
sw $t2, -20($sp)
L_18:
sub $sp, $sp, 28
jal B_printc
add $sp, $sp, 28
L_19:
lw $t1, 24($sp)
li $t1,0
sw $t1, 24($sp)
L_20:
lw $t1, 24($sp)
move $v0, $t1
L_21:
lw $ra, 0($sp)
jr $ra
L_22:
lw $ra, 0($sp)
jr $ra
L_23:
sub $sp, $sp, 28
jal A_Main
add $sp, $sp, 28
L_24:
li $v0, 10
syscall
