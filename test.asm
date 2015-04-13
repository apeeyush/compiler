.data
.text
main:
L_0:
A_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $t5, 12($sp)
li $t5,4
sw $t5, 12($sp)
L_3:
lw $t5, 16($sp)
li $t5,5
sw $t5, 16($sp)
L_4:
lw $t5, 20($sp)
li $t5,3
sw $t5, 20($sp)
L_5:
lw $t5, 24($sp)
lw $t4, 12($sp)
move $t5, $t4
sw $t5, 24($sp)
L_6:
lw $t5, 28($sp)
lw $t3, 16($sp)
move $t5, $t3
sw $t5, 28($sp)
L_7:
lw $t5, 32($sp)
lw $t2, 20($sp)
move $t5, $t2
sw $t5, 32($sp)
L_8:
lw $t5, 24($sp)
lw $t1, 28($sp)
lw $t0, 40($sp)
sge $t0, $t5, $t1
sw $t0, 40($sp)
L_9:
lw $t0, 44($sp)
li $t0,0
sw $t0, 44($sp)
L_10:
lw $t0, 40($sp)
sw $t4, 12($sp)
lw $t4, 44($sp)
beq $t0, $t4, L_14
L_11:
lw $t5, 24($sp)
sw $t3, 16($sp)
lw $t3, 32($sp)
sw $t2, 20($sp)
lw $t2, 48($sp)
sge $t2, $t5, $t3
sw $t2, 48($sp)
L_12:
lw $t2, 52($sp)
sw $t5, 24($sp)
lw $t5, 48($sp)
move $t2, $t5
sw $t2, 52($sp)
L_13:
b L_15
L_14:
lw $t2, 52($sp)
li $t2,0
sw $t2, 52($sp)
L_15:
lw $t2, 52($sp)
beqz $t2, L_24
L_16:
lw $t1, 28($sp)
lw $t3, 32($sp)
sw $t1, 28($sp)
lw $t1, 56($sp)
slt $t1, $t1, $t3
sw $t1, 56($sp)
L_17:
lw $t1, 56($sp)
beqz $t1, L_21
L_18:
sw $t0, 40($sp)
lw $t0, 24($sp)
lw $t0, 24($sp)
sw $t4, 44($sp)
lw $t4, 60($sp)
add $t4, $t0, $t0
sw $t4, 60($sp)
L_19:
lw $t4, 36($sp)
sw $t3, 32($sp)
lw $t3, 60($sp)
move $t4, $t3
sw $t4, 36($sp)
L_20:
b L_23
L_21:
lw $t0, 24($sp)
lw $t0, 24($sp)
lw $t4, 60($sp)
mult $t0, $t0
mflo $t4
sw $t4, 60($sp)
L_22:
lw $t4, 36($sp)
sw $t5, 48($sp)
lw $t5, 60($sp)
move $t4, $t5
sw $t4, 36($sp)
L_23:
b L_39
L_24:
lw $t4, 28($sp)
lw $t0, 24($sp)
sw $t2, 52($sp)
lw $t2, 56($sp)
sge $t2, $t4, $t0
sw $t2, 56($sp)
L_25:
lw $t2, 60($sp)
li $t2,0
sw $t2, 60($sp)
L_26:
lw $t2, 56($sp)
sw $t1, 56($sp)
lw $t1, 60($sp)
beq $t2, $t1, L_30
L_27:
lw $t4, 28($sp)
sw $t0, 24($sp)
lw $t0, 32($sp)
sw $t3, 60($sp)
lw $t3, 64($sp)
sge $t3, $t4, $t0
sw $t3, 64($sp)
L_28:
lw $t3, 68($sp)
sw $t5, 60($sp)
lw $t5, 64($sp)
move $t3, $t5
sw $t3, 68($sp)
L_29:
b L_31
L_30:
lw $t3, 68($sp)
li $t3,0
sw $t3, 68($sp)
L_31:
lw $t3, 68($sp)
beqz $t3, L_39
L_32:
lw $t0, 32($sp)
sw $t4, 28($sp)
lw $t4, 24($sp)
sw $t2, 56($sp)
lw $t2, 72($sp)
slt $t2, $t0, $t4
sw $t2, 72($sp)
L_33:
lw $t2, 72($sp)
beqz $t2, L_37
L_34:
sw $t1, 60($sp)
lw $t1, 28($sp)
lw $t1, 28($sp)
sw $t0, 32($sp)
lw $t0, 76($sp)
add $t0, $t1, $t1
sw $t0, 76($sp)
L_35:
lw $t0, 36($sp)
sw $t5, 64($sp)
lw $t5, 76($sp)
move $t0, $t5
sw $t0, 36($sp)
L_36:
b L_39
L_37:
lw $t1, 28($sp)
lw $t1, 28($sp)
lw $t0, 76($sp)
mult $t1, $t1
mflo $t0
sw $t0, 76($sp)
L_38:
lw $t0, 36($sp)
sw $t3, 68($sp)
lw $t3, 76($sp)
move $t0, $t3
sw $t0, 36($sp)
L_39:
lw $t0, 36($sp)
move $a0, $t0
li $v0, 1
syscall
L_40:
sw $t4, 24($sp)
lw $t4, 72($sp)
li $t4,0
sw $t4, 72($sp)
L_41:
lw $t4, 72($sp)
move $v0, $t4
L_42:
lw $ra, 0($sp)
jr $ra
L_43:
lw $ra, 0($sp)
jr $ra
L_44:
sub $sp, $sp, 80
jal A_Main
add $sp, $sp, 80
L_45:
li $v0, 10
syscall
