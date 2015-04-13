.data
s2:	.asciiz	"\n"
s1:	.asciiz	"\nEnter a character:\n"
s0:	.asciiz	" "

.text
main:
b Program_Main
L_0:
Program_fun1:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
move $v0, $s7
L_3:
lw $ra, 0($sp)
jr $ra
L_4:
lw $ra, 0($sp)
jr $ra
L_5:
Program_fun3:
L_6:
sw $ra, 0($sp)
L_7:
lw $s6, 8($sp)
move $v0, $s6
L_8:
lw $ra, 0($sp)
jr $ra
L_9:
lw $ra, 0($sp)
jr $ra
L_10:
Program_Main:
L_11:
sw $ra, 0($sp)
L_12:
lw $s5, 12($sp)
li $s5,10
sw $s5, 12($sp)
L_13:
lw $s5, 16($sp)
lw $s4, 12($sp)
move $s5, $s4
sw $s5, 16($sp)
L_14:
lw $s5, 20($sp)
li $s5,20
sw $s5, 20($sp)
L_15:
lw $s5, 16($sp)
lw $s3, 20($sp)
lw $s2, 24($sp)
slt $s2, $s5, $s3
sw $s2, 24($sp)
L_16:
lw $s2, 24($sp)
beqz $s2, L_22
L_17:
lw $s5, 16($sp)
move $a0, $s5
li $v0, 1
syscall
L_18:
la $a0, s0
li $v0, 4
syscall
L_19:
lw $s1, 28($sp)
li $s1,1
sw $s1, 28($sp)
L_20:
lw $s1, 28($sp)
lw $s5, 16($sp)
add $s5, $s5, $s1
sw $s5, 16($sp)
L_21:
b L_14
L_22:
la $a0, s1
li $v0, 4
syscall
L_23:
lw $s5, 28($sp)
li $v0, 12
syscall
move $s5, $v0
sw $s5, 28($sp)
L_24:
lw $s5, 28($sp)
move $a0, $s5
li $v0, 11
syscall
L_25:
la $a0, s2
li $v0, 4
syscall
L_26:
lw $ra, 0($sp)
jr $ra
L_27:
B_fun1:
L_28:
sw $ra, 0($sp)
L_29:
lw $s0, 8($sp)
move $v0, $s0
L_30:
lw $ra, 0($sp)
jr $ra
L_31:
lw $ra, 0($sp)
jr $ra
L_32:
B_fun2:
L_33:
sw $ra, 0($sp)
L_34:
li $a0, 0
li $v0, 9
syscall
lw $t7, 12($sp)
move $t7, $v0
sw $t7, 12($sp)
L_35:
lw $t7, 16($sp)
lw $t6, 12($sp)
move $t7, $t6
sw $t7, 16($sp)
L_36:
lw $t7, 24($sp)
li $t7,5
sw $t7, 24($sp)
L_37:
lw $t7, 28($sp)
lw $t5, 24($sp)
move $t7, $t5
sw $t7, 28($sp)
L_38:
lw $t7, 32($sp)
li $t7,4
sw $t7, 32($sp)
L_39:
lw $t7, 36($sp)
li $t7,2
sw $t7, 36($sp)
L_40:
lw $t7, 32($sp)
lw $t4, 36($sp)
lw $t3, 40($sp)
slt $t3, $t7, $t4
sw $t3, 40($sp)
L_41:
lw $t3, 44($sp)
li $t3,1
sw $t3, 44($sp)
L_42:
lw $t3, 48($sp)
li $t3,2
sw $t3, 48($sp)
L_43:
lw $t3, 40($sp)
beqz $t3, L_46
L_44:
lw $t2, 52($sp)
lw $t1, 44($sp)
move $t2, $t1
sw $t2, 52($sp)
L_45:
b L_47
L_46:
lw $t2, 52($sp)
lw $t0, 48($sp)
move $t2, $t0
sw $t2, 52($sp)
L_47:
lw $t2, 56($sp)
lw $s7, 52($sp)
move $t2, $s7
sw $t2, 56($sp)
L_48:
lw $t2, 60($sp)
li $t2,4
sw $t2, 60($sp)
L_49:
lw $t2, 16($sp)
sw $t2, -8($sp)
L_50:
lw $s6, 60($sp)
sw $s6, -4($sp)
L_51:
sub $sp, $sp, 12
jal Program_fun1
add $sp, $sp, 12
L_52:
lw $s4, 64($sp)
move $s4, $v0
sw $s4, 64($sp)
L_53:
lw $s4, 68($sp)
li $s4,324
sw $s4, 68($sp)
L_54:
lw $s4, 4($sp)
sw $s4, -8($sp)
L_55:
lw $s3, 68($sp)
sw $s3, -4($sp)
L_56:
sub $sp, $sp, 12
jal B_fun1
add $sp, $sp, 12
L_57:
lw $s2, 72($sp)
move $s2, $v0
sw $s2, 72($sp)
L_58:
lw $s2, 64($sp)
lw $s1, 72($sp)
lw $s5, 76($sp)
add $s5, $s2, $s1
sw $s5, 76($sp)
L_59:
lw $s5, 80($sp)
li $s5,34
sw $s5, 80($sp)
L_60:
lw $s5, 4($sp)
sw $s5, -8($sp)
L_61:
lw $s0, 80($sp)
sw $s0, -4($sp)
L_62:
sub $sp, $sp, 12
jal Program_fun3
add $sp, $sp, 12
L_63:
lw $t6, 84($sp)
move $t6, $v0
sw $t6, 84($sp)
L_64:
lw $t6, 76($sp)
lw $t5, 84($sp)
lw $t7, 88($sp)
add $t7, $t6, $t5
sw $t7, 88($sp)
L_65:
lw $t7, 28($sp)
lw $t4, 88($sp)
move $t7, $t4
sw $t7, 28($sp)
L_66:
lw $t7, 92($sp)
li $t7,2
sw $t7, 92($sp)
L_67:
lw $t7, 16($sp)
sw $t7, -28($sp)
L_68:
lw $t3, 92($sp)
sw $t3, -24($sp)
L_69:
sub $sp, $sp, 32
jal Program_Main
add $sp, $sp, 32
L_70:
lw $t1, 96($sp)
li $t1,2
sw $t1, 96($sp)
L_71:
lw $t1, 4($sp)
sw $t1, -8($sp)
L_72:
lw $t0, 96($sp)
sw $t0, -4($sp)
L_73:
sub $sp, $sp, 12
jal B_fun1
add $sp, $sp, 12
L_74:
lw $s7, 100($sp)
move $s7, $v0
sw $s7, 100($sp)
L_75:
lw $s7, 100($sp)
move $a0, $s7
li $v0, 1
syscall
L_76:
lw $t2, 28($sp)
move $v0, $t2
L_77:
lw $ra, 0($sp)
jr $ra
L_78:
lw $ra, 0($sp)
jr $ra
L_79:
sub $sp, $sp, 32
jal Program_Main
add $sp, $sp, 32
L_80:
li $v0, 10
syscall
