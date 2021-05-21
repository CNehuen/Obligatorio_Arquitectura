.globl flappy_bird

.text
flappy_bird:
	li $v0,1
	li $a0,99
	syscall
	jr $ra