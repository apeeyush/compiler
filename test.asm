.data
.text
main:
L_0:
L_1:
lw $s7, 8($sp)
li $s7,4
sw $s7, 8($sp)
L_2:
lw $s7, 12($sp)
li $s7,5
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
li $s7,3
sw $s7, 16($sp)
L_4:
lw $s7, 20($sp)
lw $s6, 8($sp)
move $s7, $s6
sw $s7, 20($sp)
L_5:
lw $s7, 24($sp)
lw $s5, 12($sp)
move $s7, $s5
sw $s7, 24($sp)
L_6:
lw $s7, 28($sp)
lw $s4, 16($sp)
move $s7, $s4
sw $s7, 28($sp)
L_7:
lw $s7, 20($sp)
li $v0, 5
syscall
move $s7, $v0
sw $s7, 20($sp)
L_8:
lw $s7, 24($sp)
li $v0, 5
syscall
move $s7, $v0
sw $s7, 24($sp)
L_9:
lw $s7, 28($sp)
li $v0, 5
syscall
move $s7, $v0
sw $s7, 28($sp)
L_10:
lw $s7, 20($sp)
lw $s3, 24($sp)
lw $s2, 36($sp)
sge $s2, $s7, $s3
sw $s2, 36($sp)
L_11:
lw $s2, 40($sp)
li $s2,0
sw $s2, 40($sp)
L_12:
lw $s2, 36($sp)
lw $s1, 40($sp)
beq $s2, $s1, L_16
L_13:
lw $s7, 20($sp)
lw $s0, 28($sp)
lw $t7, 44($sp)
sge $t7, $s7, $s0
sw $t7, 44($sp)
L_14:
lw $t7, 48($sp)
lw $t6, 44($sp)
move $t7, $t6
sw $t7, 48($sp)
L_15:
b L_17
L_16:
lw $t7, 48($sp)
li $t7,0
sw $t7, 48($sp)
L_17:
lw $t7, 48($sp)
beqz $t7, L_25
L_18:
lw $s3, 24($sp)
lw $s0, 28($sp)
lw $t5, 52($sp)
slt $t5, $s3, $s0
sw $t5, 52($sp)
L_19:
lw $t5, 52($sp)
beqz $t5, L_23
L_20:
lw $s7, 20($sp)
lw $s7, 20($sp)
lw $t4, 56($sp)
add $t4, $s7, $s7
sw $t4, 56($sp)
L_21:
lw $t4, 32($sp)
lw $t3, 56($sp)
move $t4, $t3
sw $t4, 32($sp)
L_22:
b L_25
L_23:
lw $s7, 20($sp)
lw $s7, 20($sp)
lw $t4, 56($sp)
mult $s7, $s7
mflo $t4
sw $t4, 56($sp)
L_24:
lw $t4, 32($sp)
lw $t2, 56($sp)
move $t4, $t2
sw $t4, 32($sp)
L_25:
lw $t4, 32($sp)
move $a0, $t4
li $v0, 1
syscall
L_26:
lw $t1, 52($sp)
li $t1,0
sw $t1, 52($sp)
L_27:
L_28:
L_29:
L_30:
L_31:
li $v0, 10
syscall
