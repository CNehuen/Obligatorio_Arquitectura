.globl car_new_game
car_new_game:
	
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	#Defino valores que simulen la funcion random
	#Defino 12 valores y la posicion 0 del vector actua de indice
	#Avanzo como si fuera un array circular y avanzo de a 7 posiciones por vez,
	#por lo tanto los valores vuelven a repetirse cada 7*12 = 84 repeticiones
	la $t1, car16x12Inv
	li $t0, 0x0003
	sh $t0, ($t1)
	li $t0, 0xF8F9
	sh $t0, 2($t1)
	li $t0, 0xF8F9
	sh $t0, 4($t1)
	li $t0, 0x2021
	sh $t0, 6($t1)
	li $t0, 0xAFFD
	sh $t0, 8($t1)
	li $t0, 0xFE1F
	sh $t0, 10($t1)
	li $t0, 0xFE1F
	sh $t0, 12($t1)
	li $t0, 0xAFFD
	sh $t0, 14($t1)
	li $t0, 0x2021
	sh $t0, 16($t1)
	li $t0, 0xF8F9
	sh $t0, 18($t1)
	li $t0, 0xF8F9
	sh $t0, 20($t1)
	li $t0, 0x0003
	sh $t0, 22($t1)
	
	la $t1, car16x12
	li $t0, 0xC000
	sh $t0, ($t1)
	li $t0, 0x9F1F
	sh $t0, 2($t1)
	li $t0, 0x9F1F
	sh $t0, 4($t1)
	li $t0, 0x8404
	sh $t0, 6($t1)
	li $t0, 0xBFF5
	sh $t0, 8($t1)
	li $t0, 0xF87F
	sh $t0, 10($t1)
	li $t0, 0xF87F
	sh $t0, 12($t1)
	li $t0, 0xBFF5
	sh $t0, 14($t1)
	li $t0, 0x8404
	sh $t0, 16($t1)
	li $t0, 0x9F1F
	sh $t0, 18($t1)
	li $t0, 0x9F1F
	sh $t0, 20($t1)
	li $t0, 0xC000
	sh $t0, 22($t1)
	li $t0,0
	li $t1,18
	la $t3, matriz_posiciones_autos
	#loop_matriz: # inicializo matriz de posiciones de vehiculos obstaculos
	#	li $t2, -1
	#	sb $t2, ($t3)
	#	addiu $t3, $t3, 1
	#	addiu $t0, $t0,1
	#	bne $t0, $t1, loop_matriz
	
	la $t0, pseudorandom_values
	lb $t1, ($t0)
	blt $t1,0, start_circular_array2
	bgt $t1, 12, start_circular_array2
	j load_circular_array2
	start_circular_array2:
	sb $zero, ($t0)
	load_circular_array2:
	li $t1, 0x1
	sb $t1, 1($t0)
	li $t1, 0x2
	sb $t1, 2($t0)
	li $t1, 0x4
	sb $t1, 3($t0)
	li $t1, 0x5
	sb $t1, 4($t0)
	li $t1, 0x6
	sb $t1, 5($t0)
	li $t1, 0x6
	sb $t1, 6($t0)
	li $t1, 0x2
	sb $t1, 7($t0)
	li $t1, 0x4
	sb $t1, 8($t0)
	li $t1, 0x5
	sb $t1, 9($t0)
	li $t1, 0x3
	sb $t1, 10($t0)
	li $t1, 0x4
	sb $t1, 11($t0)
	li $t1, 0x5
	sb $t1, 12($t0)	
	jal clean_screen

	loop_racing_game:
		jal update_cars 
		
		#jal update_my_car
		#jal choque
		#beq $v0, 1, end_racing_game
		#jal update_score_2
		li $v0, 32
		li $a0, 50
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



	
