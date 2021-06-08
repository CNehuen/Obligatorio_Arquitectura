.globl flappy_new_game

flappy_new_game:
	#Definiciones:
	#Coordenadas del string del puntaje : [x($a1) = 47 ; y($a2) = 2]
	#Coordnadas iniciales del pajaro: [x($a1) = ; y($a2) = ]
	#Cantidad maxima de columnas en el display = 2
	#Ancho de las columnas = 10
	
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $t0, column_coord
	sb $zero, ($t0)
	sb $zero, 1($t0)
	li $t1, 10
	sb $t1, 2($t0)
	#Defino valores que simulen la funcion random
	#Defino 12 valores y la posicion 0 del vector actua de indice
	#Avanzo como si fuera un array circular y avanzo de a 7 posiciones por vez,
	#por lo tanto los valores vuelven a repetirse cada 7*12 = 84 repeticiones
	la $t0, pseudorandom_values
	lb $t1, ($t0)
	blt $t1,0, start_circular_array
	bgt $t1, 12, start_circular_array
	j load_circular_array
	start_circular_array:
	sb $zero, ($t0)
	load_circular_array:
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
	#jal clean_screen
	loop_flappy_game:
		jal update_column #actualizo columnas y las creo si es necesario
		#jal update_bird	# actualizo la posicion del pajaro y verifico si choca contra la columna
						# En caso de que choque, retorno por parametro un booleano True para notificar que se perdio y terminar la partida
		beq $v0, 1, end_flappy_game
		#jal update_score
		#jal timer_background_refresh
		j loop_flappy_game
		
	end_flappy_game:
	#jal show_your_score  #muestro en pantalla el puntaje obtenido en el juego por X segundos antes de retornar al menu de juego
	# almaceno el score en el ranking si corresponde
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
	




	
