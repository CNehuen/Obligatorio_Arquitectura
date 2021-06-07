.globl clean_screen
clean_screen:
	la $t0, img
	li $t1,0
	loop_clean_screen:
		addiu $t1, $t1,1
		beq $t1, 8192, end_clean_screen   #32768/8 = 8192 word para completar la imagen
		sw $zero, ($t0)
		addiu $t0, $t0, 4
		j loop_clean_screen
		
	end_clean_screen:
	jr $ra