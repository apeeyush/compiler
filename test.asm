.data
s3:	.asciiz	"\n"
s2:	.asciiz	"\n"
s1:	.asciiz	"\n"
s0:	.asciiz	"\n"

.text
main:
b A_Main
L_0:
D_setD:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 8($sp)
li $s7,20
sw $s7, 8($sp)
L_3:
lw $s7, 8($sp)
lw $s6, 4($sp)
sw $s7, 0($s6)
L_4:
lw $ra, 0($sp)
jr $ra
L_5:
C_cisworking:
L_6:
sw $ra, 0($sp)
L_7:
lw $s5, 8($sp)
li $s5,1000
sw $s5, 8($sp)
L_8:
lw $s5, 8($sp)
lw $s4, 4($sp)
sw $s5, 4($s4)
L_9:
lw $s3, 12($sp)
li $s3,1000
sw $s3, 12($sp)
L_10:
lw $s3, 12($sp)
move $a0, $s3
li $v0, 1
syscall
L_11:
la $a0, s0
li $v0, 4
syscall
L_12:
lw $ra, 0($sp)
jr $ra
L_13:
B_fun:
L_14:
sw $ra, 0($sp)
L_15:
lw $s2, 8($sp)
li $s2,1
sw $s2, 8($sp)
L_16:
lw $s2, 8($sp)
lw $s1, 4($sp)
sw $s2, 8($s1)
L_17:
lw $s0, 12($sp)
lw $t7, 4($sp)
lw $s0, 8($t7)
sw $s0, 12($sp)
L_18:
lw $s0, 12($sp)
move $a0, $s0
li $v0, 1
syscall
L_19:
la $a0, s1
li $v0, 4
syscall
L_20:
lw $ra, 0($sp)
jr $ra
L_21:
A_Main:
L_22:
sw $ra, 0($sp)
L_23:
lw $t6, 8($sp)
li $t6,8
sw $t6, 8($sp)
L_24:
lw $t6, 12($sp)
li $t6,9
sw $t6, 12($sp)
L_25:
lw $t6, 16($sp)
li $t6,10
sw $t6, 16($sp)
L_26:
li $t6, 0
lw $t5, 8($sp)
li $t4, 4
mult $t6, $t4
mflo $t4
addi $t4, $t4, 20
add $t4, $sp, $t4
sw $t5, ($t4)
L_27:
li $t3, 1
lw $t2, 12($sp)
li $t1, 4
mult $t3, $t1
mflo $t1
addi $t1, $t1, 20
add $t1, $sp, $t1
sw $t2, ($t1)
L_28:
li $t0, 2
lw $s7, 16($sp)
li $s6, 4
mult $t0, $s6
mflo $s6
addi $s6, $s6, 20
add $s6, $sp, $s6
sw $s7, ($s6)
L_29:
lw $s5, 32($sp)
li $s5,0
sw $s5, 32($sp)
L_30:
lw $s5, 36($sp)
lw $s4, 32($sp)
move $s5, $s4
sw $s5, 36($sp)
L_31:
li $a0, 12
li $v0, 9
syscall
lw $s5, 40($sp)
move $s5, $v0
sw $s5, 40($sp)
L_32:
lw $s5, 44($sp)
lw $s3, 40($sp)
move $s5, $s3
sw $s5, 44($sp)
L_33:
lw $s5, 44($sp)
sw $s5, -12($sp)
L_34:
sub $sp, $sp, 16
jal B_fun
add $sp, $sp, 16
L_35:
lw $s2, 44($sp)
sw $s2, -12($sp)
L_36:
sub $sp, $sp, 16
jal C_cisworking
add $sp, $sp, 16
L_37:
lw $s1, 48($sp)
lw $t7, 44($sp)
lw $s1, 4($t7)
sw $s1, 48($sp)
L_38:
lw $s1, 48($sp)
move $a0, $s1
li $v0, 1
syscall
L_39:
la $a0, s2
li $v0, 4
syscall
L_40:
lw $s0, 44($sp)
sw $s0, -8($sp)
L_41:
sub $sp, $sp, 12
jal D_setD
add $sp, $sp, 12
L_42:
lw $t6, 52($sp)
lw $t7, 44($sp)
lw $t6, 0($t7)
sw $t6, 52($sp)
L_43:
lw $t6, 52($sp)
move $a0, $t6
li $v0, 1
syscall
L_44:
la $a0, s3
li $v0, 4
syscall
L_45:
lw $t5, 36($sp)
move $a0, $t5
li $v0, 1
syscall
L_46:
lw $t4, 56($sp)
li $t4,0
sw $t4, 56($sp)
L_47:
lw $t4, 56($sp)
move $v0, $t4
L_48:
lw $ra, 0($sp)
jr $ra
L_49:
lw $ra, 0($sp)
jr $ra
L_50:
sub $sp, $sp, 60
jal A_Main
add $sp, $sp, 60
L_51:
li $v0, 10
syscall
