# Full Spim Assembly Code is here.

#Ada V3

.data
	newline : .asciiz "\n" 
	counter: .space 4
	temp3: .space 4
	counter4: .space 4
	counter5: .space 4
	counter2: .space 4
	counter3: .space 4

.text
main:
	jal LProced2
	la $sp, 0($sp)
	j exit
L0:

L1:
LSwap:	sw $fp, -4($sp)
	sw $ra, -8($sp)
	la $fp, 0($sp)
	la $sp, -32($sp)

L2:
	lw $t0, 32($sp)
	sw $t0, 0($sp)

L3:
	lw $t0, 36($sp)
	sw $t0, 32($sp)

L4:
	lw $t0, 0($sp)
	sw $t0, 36($sp)

L5:
	li $t0, 120
	sw $t0, 40($sp)

L6:
	lw $t0, 32($sp)
	lw $t1, 36($sp)
	sub $t2, $t0, $t1
	sw $t2, 4($sp)

L7:
	lw $t0, 4($sp)
	sw $t0, 44($sp)

L8:
	lw $t0, 44($sp)
	lw $t1, 32($sp)
	mul $t2, $t0, $t1
	sw $t2, 8($sp)

L9:
	lw $t0, 8($sp)
	sw $t0, 48($sp)

L10:
	li $v0, 1
	lw $t0, 32($sp)
	move $a0, $t0 
	syscall

L11:
	li $v0, 1
	lw $t0, 36($sp)
	move $a0, $t0 
	syscall

L12:
	li $v0, 1
	lw $t0, 40($sp)
	move $a0, $t0 
	syscall

L13:
	li $v0, 1
	lw $t0, 44($sp)
	move $a0, $t0 
	syscall

L14:
	li $v0, 1
	lw $t0, 48($sp)
	move $a0, $t0 
	syscall

L15:
	lw $v0, 44($sp)
	lw $v1, 48($sp)
	la $sp, 0($fp)
	lw $ra, -8($fp)
	lw $fp, -4($sp)
	jr $ra

L16:
LProced2:	sw $fp, -4($sp)
	sw $ra, -8($sp)
	la $fp, 0($sp)
	la $sp, -32($sp)

L17:
	li $t0, 5
	sw $t0, 0($sp)

L18:
	li $t0, 3
	sw $t0, 4($sp)

L19:
	li $t0, 9
	sw $t0, 8($sp)

L20:
	li $t0, 10
	sw $t0, 12($sp)

L21:
	li $t0, 12
	sw $t0, 16($sp)

L22:
	lw $t0, 0($sp)
	li $t1, 1
	add $t2, $t0, $t1
	sw $t2, 20($sp)

L23:
	lw $t0, 20($sp)
	sw $t0, 0($sp)

L24:
	lw $t0, 16($sp)
	sw $t0, -4($sp)

L25:
	lw $t0, 12($sp)
	sw $t0, -8($sp)

L26:
	lw $t0, 8($sp)
	sw $t0, -12($sp)

L27:
	lw $t0, 4($sp)
	sw $t0, -16($sp)

L28:
	lw $t0, 0($sp)
	sw $t0, -20($sp)

L29:
	la $sp, -20($sp)
	jal LSwap
	la $sp, 20($sp)
	sw $v0, 12($sp)
	sw $v1, 16($sp)

L30:
	li $v0, 4
	la $a0, newline
	syscall

L31:
	li $v0, 1
	lw $t0, 0($sp)
	move $a0, $t0 
	syscall

L32:
	li $v0, 1
	lw $t0, 4($sp)
	move $a0, $t0 
	syscall

L33:
	li $v0, 1
	lw $t0, 8($sp)
	move $a0, $t0 
	syscall

L34:
	li $v0, 1
	lw $t0, 12($sp)
	move $a0, $t0 
	syscall

L35:
	li $v0, 1
	lw $t0, 16($sp)
	move $a0, $t0 
	syscall

L36:
	la $sp, 0($fp)
	lw $ra, -8($fp)
	lw $fp, -4($sp)
	jr $ra

exit:
	li $v0, 10
	syscall
