.data
.text
main:
L_0:
L_1:
lw $s7, 8($sp)
li $s7,6
sw $s7, 8($sp)
L_2:
lw $s7, 12($sp)
li $s7,5
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
lw $s6, 8($sp)
move $s7, $s6
sw $s7, 16($sp)
L_4:
lw $s7, 20($sp)
lw $s5, 12($sp)
move $s7, $s5
sw $s7, 20($sp)
L_5:
lw $s7, 24($sp)
li $s7,0
sw $s7, 24($sp)
L_6:
lw $s7, 4($sp)
lw $s4, 24($sp)
move $s7, $s4
sw $s7, 4($sp)
L_7:
lw $s7, 28($sp)
li $s7,5
sw $s7, 28($sp)
L_8:
lw $s7, 4($sp)
lw $s3, 28($sp)
lw $s2, 32($sp)
slt $s2, $s7, $s3
sw $s2, 32($sp)
L_9:
lw $s2, 36($sp)
li $s2,0
sw $s2, 36($sp)
L_10:
lw $s2, 32($sp)
lw $s1, 36($sp)
beq $s2, $s1, L_15
L_11:
lw $s0, 40($sp)
li $s0,4
sw $s0, 40($sp)
L_12:
lw $s0, 20($sp)
lw $t7, 40($sp)
lw $t6, 44($sp)
sgt $t6, $s0, $t7
sw $t6, 44($sp)
L_13:
lw $t6, 48($sp)
lw $t5, 44($sp)
move $t6, $t5
sw $t6, 48($sp)
L_14:
b L_16
L_15:
lw $t6, 48($sp)
li $t6,0
sw $t6, 48($sp)
L_16:
lw $t6, 48($sp)
beqz $t6, L_27
L_17:
b L_22
L_18:
lw $t4, 52($sp)
li $t4,1
sw $t4, 52($sp)
L_19:
lw $t4, 52($sp)
lw $t3, 56($sp)
add $t3, $s7, $t4
sw $t3, 56($sp)
L_20:
lw $t3, 56($sp)
move $s7, $t3
sw $s7, 4($sp)
L_21:
b L_7
L_22:
lw $s7, 4($sp)
move $a0, $s7
li $v0, 1
syscall
L_23:
lw $t2, 60($sp)
li $t2,1
sw $t2, 60($sp)
L_24:
lw $t2, 60($sp)
lw $t1, 64($sp)
sub $t1, $s0, $t2
sw $t1, 64($sp)
L_25:
lw $t1, 64($sp)
move $s0, $t1
sw $s0, 20($sp)
L_26:
b L_18
L_27:
lw $s0, 60($sp)
li $s0,0
sw $s0, 60($sp)
L_28:
L_29:
L_30:
L_31:
L_32:
li $v0, 10
syscall
