.globl car_new_game
.eqv control2 0xFFFF0000
.eqv data2 0xFFFF0004
car_new_game:
	
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	#Defino valores que simulen la funcion random
	#Defino 12 valores y la posicion 0 del vector actua de indice
	#Avanzo como si fuera un array circular y avanzo de a 7 posiciones por vez,
	#por lo tanto los valores vuelven a repetirse cada 7*12 = 84 repeticiones
	la $t0, car16x16
	li $t1, 0x0000
	sh $t0, ($t1)
	li $t1, 0x0000
	sh $t0, 1($t1)
	li $t1, 0xC000
	sh $t0, 2($t1)
	li $t1, 0x9F1F
	sh $t0, 3($t1)
	li $t1, 0x9F1F
	sh $t0, 4($t1)
	li $t1, 0x8404
	sh $t0, 5($t1)
	li $t1, 0xBFF5
	sh $t0, 6($t1)
	li $t1, 0xF87F
	sh $t0, 7($t1)
	li $t1, 0xF87F
	sh $t0, 8($t1)
	li $t1, 0xBFF5
	sh $t0, 9($t1)
	li $t1, 0x8404
	sh $t0, 10($t1)
	li $t1, 0x9F1F
	sh $t0, 11($t1)
	li $t1, 0x9F1F
	sh $t0, 12($t1)
	li $t1, 0xC000
	sh $t0, 13($t1)
	li $t1, 0x0000
	sh $t0, 14($t1)
	li $t1, 0x0000
	sh $t0, 15($t1)
	
	la $t0, pseudorandom_values
	lb $t1, ($t0)
	blt $t1,0, start_circular_array2
	bgt $t1, 12, start_circular_array2
	j load_circular_array2
	start_circular_array2:
	sb $zero, ($t0)
	load_circular_array2:
	li $t1, 10
	sb $t1, 1($t0)
	li $t1, 40
	sb $t1, 2($t0)
	li $t1, 32
	sb $t1, 3($t0)
	li $t1, 3
	sb $t1, 4($t0)
	li $t1, 13
	sb $t1, 5($t0)
	li $t1, 21
	sb $t1, 6($t0)
	li $t1, 28
	sb $t1, 7($t0)
	li $t1, 8
	sb $t1, 8($t0)
	li $t1, 16
	sb $t1, 9($t0)
	li $t1, 24
	sb $t1, 10($t0)
	li $t1, 23
	sb $t1, 11($t0)
	li $t1, 36
	sb $t1, 12($t0)	
	jal clean_screen
	loop_racing_game:
		la $t1, control2
		lw $t2, ($t1)
		andi $t2 , $t2, 0x01
		#beqz $t2, continue_loop2
		la $t1, data2
		lw $t2, ($t1)		
		#continue_loop2:
		jal update_cars 
		jal update_my_car
		jal choque
		beq $v0, 1, end_racing_game
		jal update_score_2
		#jal timer_background_refresh
		li $v0, 32
		li $a0, 25
		syscall
		j loop_racing_game
		
	end_racing_game:
		li $v0, 32
		li $a0, 1500
		syscall
		jal clean_screen
	jal update_score
	la $a0, your_score
		li $a1, 23
		li $a2, 30
		jal dibujarString
	li $v0, 32
		li $a0, 5000
		syscall
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 



	
