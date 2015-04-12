.data
.text
main:
L_0:
L_1:
lw $s7, 8($sp)
li $s7,3
sw $s7, 8($sp)
L_2:
lw $s7, 12($sp)
lw $s6, 8($sp)
move $s7, $s6
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
li $s7,0
sw $s7, 16($sp)
L_4:
lw $s7, 4($sp)
lw $s5, 16($sp)
move $s7, $s5
sw $s7, 4($sp)
L_5:
lw $s7, 20($sp)
li $s7,5
sw $s7, 20($sp)
L_6:
lw $s7, 4($sp)
lw $s4, 20($sp)
lw $s3, 24($sp)
slt $s3, $s7, $s4
sw $s3, 24($sp)
L_7:
lw $s3, 24($sp)
beqz $s3, L_15
L_8:
b L_13
L_9:
lw $s2, 28($sp)
li $s2,1
sw $s2, 28($sp)
L_10:
lw $s7, 4($sp)
lw $s2, 28($sp)
lw $s1, 32($sp)
add $s1, $s7, $s2
sw $s1, 32($sp)
L_11:
lw $s7, 4($sp)
lw $s1, 32($sp)
move $s7, $s1
sw $s7, 4($sp)
L_12:
b L_5
L_13:
lw $s7, 12($sp)
move $a0, $s7
li $v0, 1
syscall
L_14:
b L_9
L_15:
lw $s0, 36($sp)
li $s0,0
sw $s0, 36($sp)
L_16:
L_17:
L_18:
L_19:
L_20:
li $v0, 10
syscall
