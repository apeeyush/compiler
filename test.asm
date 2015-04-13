.data
s1:	.asciiz	"asdfghjklqwertyuiop"

.text
main:
L_0:
A_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 12($sp)
li $s7,4
sw $s7, 12($sp)
L_3:
lw $s7, 16($sp)
li $s7,5
sw $s7, 16($sp)
L_4:
lw $s7, 20($sp)
li $s7,3
sw $s7, 20($sp)
L_5:
lw $s7, 24($sp)
lw $s6, 12($sp)
move $s7, $s6
sw $s7, 24($sp)
L_6:
lw $s7, 28($sp)
lw $s5, 16($sp)
move $s7, $s5
sw $s7, 28($sp)
L_7:
lw $s7, 32($sp)
lw $s4, 20($sp)
move $s7, $s4
sw $s7, 32($sp)
L_8:
lw $s7, 24($sp)
lw $s3, 28($sp)
lw $s2, 40($sp)
sge $s2, $s7, $s3
sw $s2, 40($sp)
L_9:
lw $s2, 44($sp)
li $s2,0
sw $s2, 44($sp)
L_10:
lw $s2, 40($sp)
lw $s1, 44($sp)
beq $s2, $s1, L_14
L_11:
lw $s7, 24($sp)
lw $s0, 32($sp)
lw $t7, 48($sp)
sge $t7, $s7, $s0
sw $t7, 48($sp)
L_12:
lw $t7, 52($sp)
lw $t6, 48($sp)
move $t7, $t6
sw $t7, 52($sp)
L_13:
b L_15
L_14:
lw $t7, 52($sp)
li $t7,0
sw $t7, 52($sp)
L_15:
lw $t7, 52($sp)
beqz $t7, L_24
L_16:
lw $s3, 28($sp)
lw $s0, 32($sp)
lw $t5, 56($sp)
slt $t5, $s3, $s0
sw $t5, 56($sp)
L_17:
lw $t5, 56($sp)
beqz $t5, L_21
L_18:
lw $s7, 24($sp)
lw $s7, 24($sp)
lw $t4, 60($sp)
add $t4, $s7, $s7
sw $t4, 60($sp)
L_19:
lw $t4, 36($sp)
lw $t3, 60($sp)
move $t4, $t3
sw $t4, 36($sp)
L_20:
b L_23
L_21:
lw $s7, 24($sp)
lw $s7, 24($sp)
lw $t4, 60($sp)
mult $s7, $s7
mflo $t4
sw $t4, 60($sp)
L_22:
lw $t4, 36($sp)
lw $t2, 60($sp)
move $t4, $t2
sw $t4, 36($sp)
L_23:
b L_39
L_24:
lw $s3, 28($sp)
lw $s7, 24($sp)
lw $t4, 56($sp)
sge $t4, $s3, $s7
sw $t4, 56($sp)
L_25:
lw $t4, 60($sp)
li $t4,0
sw $t4, 60($sp)
L_26:
lw $t4, 56($sp)
lw $t1, 60($sp)
beq $t4, $t1, L_30
L_27:
lw $s3, 28($sp)
lw $s0, 32($sp)
lw $t0, 64($sp)
sge $t0, $s3, $s0
sw $t0, 64($sp)
L_28:
lw $t0, 68($sp)
sw $s6, 12($sp)
lw $s6, 64($sp)
move $t0, $s6
sw $t0, 68($sp)
L_29:
b L_31
L_30:
lw $t0, 68($sp)
li $t0,0
sw $t0, 68($sp)
L_31:
lw $t0, 68($sp)
beqz $t0, L_39
L_32:
lw $s0, 32($sp)
lw $s7, 24($sp)
sw $s5, 16($sp)
lw $s5, 72($sp)
slt $s5, $s0, $s7
sw $s5, 72($sp)
L_33:
lw $s5, 72($sp)
beqz $s5, L_37
L_34:
lw $s3, 28($sp)
lw $s3, 28($sp)
sw $s4, 20($sp)
lw $s4, 76($sp)
add $s4, $s3, $s3
sw $s4, 76($sp)
L_35:
lw $s4, 36($sp)
sw $s7, 24($sp)
lw $s7, 76($sp)
move $s4, $s7
sw $s4, 36($sp)
L_36:
b L_39
L_37:
lw $s3, 28($sp)
lw $s3, 28($sp)
lw $s4, 76($sp)
mult $s3, $s3
mflo $s4
sw $s4, 76($sp)
L_38:
lw $s4, 36($sp)
sw $s3, 28($sp)
lw $s3, 76($sp)
move $s4, $s3
sw $s4, 36($sp)
L_39:
L_40:
la $a0, s1
li $v0, 4
syscall
L_41:
lw $s4, 36($sp)
move $a0, $s4
li $v0, 1
syscall
L_42:
sw $s2, 40($sp)
lw $s2, 72($sp)
li $s2,0
sw $s2, 72($sp)
L_43:
lw $s2, 72($sp)
move $v0, $s2
L_44:
lw $ra, 0($sp)
jr $ra
L_45:
lw $ra, 0($sp)
jr $ra
L_46:
sub $sp, $sp, 80
jal A_Main
add $sp, $sp, 80
L_47:
li $v0, 10
syscall
