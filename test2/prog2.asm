.data
s0:	.asciiz	"\n"

.text
main:
b Program_Main
L_0:
Program_Main:
L_1:
sw $ra, 0($sp)
L_2:
lw $s7, 16($sp)
li $s7,1
sw $s7, 16($sp)
L_3:
lw $s7, 20($sp)
li $s7,2
sw $s7, 20($sp)
L_4:
lw $s7, 24($sp)
li $s7,3
sw $s7, 24($sp)
L_5:
lw $s7, 28($sp)
li $s7,4
sw $s7, 28($sp)
L_6:
lw $s7, 32($sp)
li $s7,5
sw $s7, 32($sp)
L_7:
lw $s7, 36($sp)
li $s7,1
sw $s7, 36($sp)
L_8:
lw $s7, 40($sp)
li $s7,4
sw $s7, 40($sp)
L_9:
lw $s7, 44($sp)
li $s7,1
sw $s7, 44($sp)
L_10:
lw $s7, 44($sp)
lw $s6, 48($sp)
neg $s6, $s7
sw $s6, 48($sp)
L_11:
lw $s6, 52($sp)
li $s6,6
sw $s6, 52($sp)
L_12:
lw $s6, 56($sp)
li $s6,10
sw $s6, 56($sp)
L_13:
lw $s6, 60($sp)
li $s6,113
sw $s6, 60($sp)
L_14:
lw $s6, 60($sp)
lw $s5, 64($sp)
neg $s5, $s6
sw $s5, 64($sp)
L_15:
lw $s5, 68($sp)
li $s5,32
sw $s5, 68($sp)
L_16:
lw $s5, 72($sp)
li $s5,2
sw $s5, 72($sp)
L_17:
lw $s5, 76($sp)
li $s5,22
sw $s5, 76($sp)
L_18:
lw $s5, 80($sp)
li $s5,24325
sw $s5, 80($sp)
L_19:
li $s5, 0
lw $s4, 16($sp)
li $s3, 4
mult $s5, $s3
mflo $s3
addi $s3, $s3, 84
add $s3, $sp, $s3
sw $s4, ($s3)
L_20:
li $s2, 1
lw $s1, 20($sp)
li $s0, 4
mult $s2, $s0
mflo $s0
addi $s0, $s0, 84
add $s0, $sp, $s0
sw $s1, ($s0)
L_21:
li $t7, 2
lw $t6, 24($sp)
li $t5, 4
mult $t7, $t5
mflo $t5
addi $t5, $t5, 84
add $t5, $sp, $t5
sw $t6, ($t5)
L_22:
li $t4, 3
lw $t3, 28($sp)
li $t2, 4
mult $t4, $t2
mflo $t2
addi $t2, $t2, 84
add $t2, $sp, $t2
sw $t3, ($t2)
L_23:
li $t1, 4
lw $t0, 32($sp)
li $s7, 4
mult $t1, $s7
mflo $s7
addi $s7, $s7, 84
add $s7, $sp, $s7
sw $t0, ($s7)
L_24:
li $s6, 5
lw $s5, 36($sp)
li $s4, 4
mult $s6, $s4
mflo $s4
addi $s4, $s4, 84
add $s4, $sp, $s4
sw $s5, ($s4)
L_25:
li $s3, 6
lw $s2, 40($sp)
li $s1, 4
mult $s3, $s1
mflo $s1
addi $s1, $s1, 84
add $s1, $sp, $s1
sw $s2, ($s1)
L_26:
li $s0, 7
lw $t7, 48($sp)
li $t6, 4
mult $s0, $t6
mflo $t6
addi $t6, $t6, 84
add $t6, $sp, $t6
sw $t7, ($t6)
L_27:
li $t5, 8
lw $t4, 52($sp)
li $t3, 4
mult $t5, $t3
mflo $t3
addi $t3, $t3, 84
add $t3, $sp, $t3
sw $t4, ($t3)
L_28:
li $t2, 9
lw $t1, 56($sp)
li $t0, 4
mult $t2, $t0
mflo $t0
addi $t0, $t0, 84
add $t0, $sp, $t0
sw $t1, ($t0)
L_29:
li $s7, 10
lw $s6, 64($sp)
li $s5, 4
mult $s7, $s5
mflo $s5
addi $s5, $s5, 84
add $s5, $sp, $s5
sw $s6, ($s5)
L_30:
li $s4, 11
lw $s3, 68($sp)
li $s2, 4
mult $s4, $s2
mflo $s2
addi $s2, $s2, 84
add $s2, $sp, $s2
sw $s3, ($s2)
L_31:
li $s1, 12
lw $s0, 72($sp)
li $t7, 4
mult $s1, $t7
mflo $t7
addi $t7, $t7, 84
add $t7, $sp, $t7
sw $s0, ($t7)
L_32:
li $t6, 13
lw $t5, 76($sp)
li $t4, 4
mult $t6, $t4
mflo $t4
addi $t4, $t4, 84
add $t4, $sp, $t4
sw $t5, ($t4)
L_33:
li $t3, 14
lw $t2, 80($sp)
li $t1, 4
mult $t3, $t1
mflo $t1
addi $t1, $t1, 84
add $t1, $sp, $t1
sw $t2, ($t1)
L_34:
lw $t0, 144($sp)
li $t0,0
sw $t0, 144($sp)
L_35:
lw $t0, 8($sp)
lw $s7, 144($sp)
move $t0, $s7
sw $t0, 8($sp)
L_36:
lw $t0, 148($sp)
li $t0,15
sw $t0, 148($sp)
L_37:
lw $t0, 8($sp)
lw $s6, 148($sp)
lw $s5, 152($sp)
slt $s5, $t0, $s6
sw $s5, 152($sp)
L_38:
lw $s5, 152($sp)
beqz $s5, L_74
L_39:
b L_44
L_40:
lw $s4, 156($sp)
li $s4,1
sw $s4, 156($sp)
L_41:
lw $t0, 8($sp)
lw $s4, 156($sp)
lw $s3, 160($sp)
add $s3, $t0, $s4
sw $s3, 160($sp)
L_42:
lw $t0, 8($sp)
lw $s3, 160($sp)
move $t0, $s3
sw $t0, 8($sp)
L_43:
b L_36
L_44:
lw $t0, 164($sp)
li $t0,1
sw $t0, 164($sp)
L_45:
lw $t0, 8($sp)
lw $s2, 164($sp)
lw $s1, 168($sp)
add $s1, $t0, $s2
sw $s1, 168($sp)
L_46:
lw $s1, 12($sp)
lw $s0, 168($sp)
move $s1, $s0
sw $s1, 12($sp)
L_47:
lw $s1, 172($sp)
li $s1,15
sw $s1, 172($sp)
L_48:
lw $s1, 12($sp)
lw $t7, 172($sp)
lw $t6, 176($sp)
slt $t6, $s1, $t7
sw $t6, 176($sp)
L_49:
lw $t6, 176($sp)
beqz $t6, L_73
L_50:
b L_55
L_51:
lw $t5, 180($sp)
li $t5,1
sw $t5, 180($sp)
L_52:
lw $s1, 12($sp)
lw $t5, 180($sp)
lw $t4, 184($sp)
add $t4, $s1, $t5
sw $t4, 184($sp)
L_53:
lw $s1, 12($sp)
lw $t4, 184($sp)
move $s1, $t4
sw $s1, 12($sp)
L_54:
b L_47
L_55:
lw $t0, 8($sp)
lw $s1, 188($sp)
li $t3, 4
mult $t0, $t3
mflo $t3
addi $t3, $t3, 84
add $t3, $sp, $t3
lw $s1, ($t3)
sw $s1, 188($sp)
L_56:
lw $s1, 12($sp)
lw $t2, 192($sp)
li $t1, 4
mult $s1, $t1
mflo $t1
addi $t1, $t1, 84
add $t1, $sp, $t1
lw $t2, ($t1)
sw $t2, 192($sp)
L_57:
lw $t2, 188($sp)
lw $s7, 192($sp)
lw $s6, 196($sp)
sgt $s6, $t2, $s7
sw $s6, 196($sp)
L_58:
lw $s6, 196($sp)
beqz $s6, L_67
L_59:
lw $t0, 8($sp)
lw $s5, 200($sp)
li $s4, 4
mult $t0, $s4
mflo $s4
addi $s4, $s4, 84
add $s4, $sp, $s4
lw $s5, ($s4)
sw $s5, 200($sp)
L_60:
lw $s5, 204($sp)
lw $s3, 200($sp)
move $s5, $s3
sw $s5, 204($sp)
L_61:
lw $s1, 12($sp)
lw $s5, 208($sp)
li $t0, 4
mult $s1, $t0
mflo $t0
addi $t0, $t0, 84
add $t0, $sp, $t0
lw $s5, ($t0)
sw $s5, 208($sp)
L_62:
lw $s5, 8($sp)
lw $s2, 208($sp)
li $s0, 4
mult $s5, $s0
mflo $s0
addi $s0, $s0, 84
add $s0, $sp, $s0
sw $s2, ($s0)
L_63:
lw $s5, 8($sp)
lw $t7, 212($sp)
li $t6, 4
mult $s5, $t6
mflo $t6
addi $t6, $t6, 84
add $t6, $sp, $t6
lw $t7, ($t6)
sw $t7, 212($sp)
L_64:
lw $s1, 12($sp)
lw $t7, 204($sp)
li $t5, 4
mult $s1, $t5
mflo $t5
addi $t5, $t5, 84
add $t5, $sp, $t5
sw $t7, ($t5)
L_65:
lw $s1, 12($sp)
lw $t4, 216($sp)
li $t3, 4
mult $s1, $t3
mflo $t3
addi $t3, $t3, 84
add $t3, $sp, $t3
lw $t4, ($t3)
sw $t4, 216($sp)
L_66:
b L_72
L_67:
lw $t4, 200($sp)
li $t4,1
sw $t4, 200($sp)
L_68:
lw $t4, 204($sp)
li $t4,1
sw $t4, 204($sp)
L_69:
lw $t4, 200($sp)
lw $s1, 204($sp)
lw $t1, 208($sp)
seq $t1, $t4, $s1
sw $t1, 208($sp)
L_70:
lw $t1, 208($sp)
beqz $t1, L_72
L_71:
b L_51
L_72:
b L_51
L_73:
b L_40
L_74:
lw $t2, 164($sp)
li $t2,0
sw $t2, 164($sp)
L_75:
lw $s5, 8($sp)
lw $t2, 164($sp)
move $s5, $t2
sw $s5, 8($sp)
L_76:
lw $s5, 168($sp)
li $s5,15
sw $s5, 168($sp)
L_77:
lw $s5, 8($sp)
lw $s7, 168($sp)
lw $s6, 172($sp)
slt $s6, $s5, $s7
sw $s6, 172($sp)
L_78:
lw $s6, 172($sp)
beqz $s6, L_88
L_79:
b L_84
L_80:
lw $s4, 176($sp)
li $s4,1
sw $s4, 176($sp)
L_81:
lw $s5, 8($sp)
lw $s4, 176($sp)
lw $s3, 180($sp)
add $s3, $s5, $s4
sw $s3, 180($sp)
L_82:
lw $s5, 8($sp)
lw $s3, 180($sp)
move $s5, $s3
sw $s5, 8($sp)
L_83:
b L_76
L_84:
lw $s5, 8($sp)
lw $t0, 184($sp)
li $s2, 4
mult $s5, $s2
mflo $s2
addi $s2, $s2, 84
add $s2, $sp, $s2
lw $t0, ($s2)
sw $t0, 184($sp)
L_85:
lw $t0, 184($sp)
move $a0, $t0
li $v0, 1
syscall
L_86:
la $a0, s0
li $v0, 4
syscall
L_87:
b L_80
L_88:
lw $ra, 0($sp)
jr $ra
L_89:
sub $sp, $sp, 220
jal Program_Main
add $sp, $sp, 220
L_90:
li $v0, 10
syscall
