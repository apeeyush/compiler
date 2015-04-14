.data
s3:	.space 200
s2:	.asciiz	"asdf"
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
L_24:
la $a0, s2
li $v0, 4
syscall
L_25:
li $v0, 8
la $a0, s3
li $a1 200
syscall
L_26:
la $a0, s3
li $v0, 4
syscall
L_27:
lw $t6, 8($sp)
li $t6,0
sw $t6, 8($sp)
L_28:
lw $t6, 8($sp)
move $v0, $t6
L_29:
lw $ra, 0($sp)
jr $ra
L_30:
lw $ra, 0($sp)
jr $ra
L_31:
sub $sp, $sp, 12
jal A_Main
add $sp, $sp, 12
L_32:
li $v0, 10
syscall
