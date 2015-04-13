.data

.text
main:
b A_Main
L_0:
A_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,0
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
li $s7,1
sw $s7, 16($sp)
L_4:
lw $s7, 20($sp)
lw $s6, 12($sp)
move $s7, $s6
sw $s7, 20($sp)
L_5:
lw $s7, 24($sp)
lw $s5, 16($sp)
move $s7, $s5
sw $s7, 24($sp)
L_6:
lw $s7, 20($sp)
move $a0, $s7
li $v0, 1
syscall
L_7:
b L_10
L_8:
lw $s4, 28($sp)
li $s4,1
sw $s4, 28($sp)
L_9:
lw $s4, 28($sp)
lw $s7, 20($sp)
add $s7, $s7, $s4
sw $s7, 20($sp)
L_10:
lw $s7, 28($sp)
li $s7,20
sw $s7, 28($sp)
L_11:
lw $s7, 20($sp)
lw $s3, 28($sp)
lw $s2, 32($sp)
slt $s2, $s7, $s3
sw $s2, 32($sp)
L_12:
lw $s2, 32($sp)
beqz $s2, L_14
L_13:
b L_6
L_14:
lw $ra, 0($sp)
jr $ra
L_15:
sub $sp, $sp, 36
jal A_Main
add $sp, $sp, 36
L_16:
li $v0, 10
syscall
