.globl update_cars
update_cars: 
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	li $v0, 32
		li $a0, 50
		syscall
	li $t2,0
	la $s0, matriz_posiciones_autos
	lb $t1, 5($s0)
	beq $t1,87, nuevos_autos_random
	add $t2, $t2, $t1
	lb $t1, 11($s0)
	beq $t1,87, nuevos_autos_random
	add $t2, $t2, $t1
	lb $t1, 17($s0)
	beq $t1,87, nuevos_autos_random
	add $t2, $t2, $t1	
	beq $t2, 0, nuevos_autos_random
	j update_cars_positions
	
	nuevos_autos_random:
		#creo  los autos aleatoriamente, en cantidad y posiciones
		li $t5,0
		li $v0, 32
		li $a0, 5
		syscall
		loop_desplazar_posiciones:
			addiu $t5, $t5,1
			beq $t5, 4, salir_loop_desplazar_posiciones
			mulu $t4, $t5, 6
			addi $t4, $t4, -1
			add $t4, $t4, $s0
			li $t6, 5
			loop_desplazar:
				addi $t6, $t6,-1       
				sub $t7, $t4, $t6
				lb $t1, ($t7)
				addi $t7, $t7, -1
				sb $t1, ($t7)
				beqz $t6, loop_desplazar_posiciones
				j loop_desplazar
		salir_loop_desplazar_posiciones:
		
		la $t6, pseudorandom_values
		lb $t9, ($t6)
		addi $t9,$t9,7
		bgt $t9,12, get_circular_pos
		j get_circular_value
		get_circular_pos:
		subiu $t9,$t9,12
		get_circular_value:
		sb $t9, ($t6)
		addu $t6,$t6,$t9			
		lb $t9, ($t6)
		li $t8, 0x1
		li $t6,0
		bucle_nuevos_autos:
			addiu $t6, $t6,1
			beq $t6, 4, fin_bucle_nuevos_autos
			and $t7, $t8, $t9
			mulu $t5, $t6, 6
			addi $t5, $t5, -1
			addu $t5, $t5, $s0
			beqz $t7, guardo_menos_uno
				li $t4, 127
				sb $t4, ($t5)
				j fin_guardo_menos_uno
				guardo_menos_uno:
				li $t4, 0
				sb $t4, ($t5)
			fin_guardo_menos_uno:
			
			srl $t9, $t9, 1
			j bucle_nuevos_autos
	fin_bucle_nuevos_autos:
	
	update_cars_positions:
	li $s2, 0 #contdor de posiciones en la matriz
	loop_update_cars_positions:
		beq $s2, 18, end_loop_update_cars_positions
		add $s4, $s2, $s0
		lb $t5, ($s4)
		
		beq $t5, 0, no_car_update
			li $t3, 6
			div $s2, $t3 
			mflo $t3 # en t3 guardo el resultado de la division, que me indica a que carril pertenece el auto
			
			mulu $t6, $t3,22
			addiu $a1, $t6,3				#Posicion en y del auto	actual
			lb $t5, ($s4)
			addi $a0, $t5, -1 #nueva posicion en x del auto
			sb $a0, ($s4)
			li $t3,16
			beqz $a0, delete_car
			li $a2, 0
			jal dibujar_auto
			bgt $a0 ,111, skip_back_line
				addi $a0, $a0,16
				li $a2, 12
				li $a3, 0x0
				jal ColumnasVerticales
			skip_back_line:
		no_car_update:
		addiu $s2, $s2, 1
		j loop_update_cars_positions
		delete_car:
				#move $a2, $a1
				#move $a1, $a0
				#la $a0, limpiarAuto 				#Es para que limpie el auto  					
				#jal dibujarString 
				#la $a0, limpiarAuto 				#Es para que limpie el auto  
				#li $a1, 4 
				#addi $t4, $t4, 4					#Posicion en x siempre es 4		
				#move $a2, $t4					
				#jal dibujarString
	end_loop_update_cars_positions:	
	end_update_cars:

	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
