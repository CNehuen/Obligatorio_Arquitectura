.globl update_column
update_cars:
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $t1, column_coord
	la $t0, img
	lb $t2, ($t1)
	lb $t3, 1($t1)
	li $t4, 2  #variable contador de columna para mover
	beqz $t3, create_first_columns
	#Desplazo la hilera de la derecha de las columnas hacia la izquierda de la columna
	loop_move_columns:
		la $t0, img
		subiu $t4, $t4,1
		li $t9, 64
		mulu $t5, $t2, 4
		addu $t8, $t0, $t5  # me coloco en la pisicion de la derecha de la primra columna
		loop_move_column:
			beqz $t9, end_move_columns
			subi $t9,$t9,1
			sw $zero, ($t8)#limpio el pixel
			blt $t2, 10, errase_column
			sub $t8, $t8, 40  #me muevo hacia atras hacia donde debo pintar la columna
			#verifico si debo pintar negro o blanco
			#t3,t5,t6,t7 libres
			la $t3, column_heigh
			addiu $t3,$t3,1
			subu $t3,$t3,$t4 #calculo la coordenada en Y donde estoy parado
			lb $t6, ($t3)
			li $t5, 63
			sub $t5, $t5,$t9  #posicion actual creciente
			blt $t5, $t6, loop_move_white
			addiu $t6,$t6,20
			blt $t5, $t6, loop_move_black
			loop_move_white:
				li $t7, 0x00ffffff
				sw $t7, ($t8)  # pinto el pixel 1 posicion a la izq de donde esta la columna, de blanco
				addiu $t8,$t8, 40 # me muevo a la posicion de la derecha de la columna
				j errase_column
			loop_move_black:
				sw $zero, ($t8)  # pinto el pixel 1 posicion a la izq de donde esta la columna, de negro		
				addiu $t8,$t8, 40 # me muevo a la posicion de la derecha de la columna
			errase_column:
			addiu $t8,$t8, 512 # me muevo a la fila de abajo
			j loop_move_column
			
	end_move_columns:
	subi $t2, $t2, 1
	sb $t2, ($t1)
	addiu $t1,$t1,1
	lb $t2, ($t1)
	beq $t4,1, loop_move_columns
	la $t1, column_coord
	lb $t2, ($t1)
	blt $t2,0, delete_first_column
	blt $t2, 10, create_column_right

	j end_update_column
	
	delete_first_column: #si se borro por completo la columna de la izq, la segunda pasa  a ser la de la izq y la de la derecha pasa a ser la segunda
		la $t1, column_coord
		lb $t3, 1($t1)
		sb $t3, ($t1)
		li $t2, 127
		sb $t2, 1($t1)
		la $t1, column_heigh
		lb $t2,1($t1)
		sb $t2, ($t1)
		lb $t2,2($t1)
		sb $t2, 1($t1)
		sb $zero, 2($t1)
		j end_update_column
		
	create_column_right:  
		li $t0, 118
		addu $a0, $t0, $t2
		jal  create_column
		j end_update_column

	create_first_columns:
		beqz $t2, create_first_column
		li $t4, 1
		ble $t2, 73, create_second_column
		j loop_move_columns
		
		create_first_column:
			lb $t5, 2($t1)
			addi $t6, $t5, 117
			move $a0, $t6
			jal  create_column
			subi $t5,$t5,1
			la $t1, column_coord
			beqz $t5, created_first
			sb $t5, 2($t1)
			j end_update_column
			
			created_first:
			li $t5, 127
			sb $t5, ($t1)
			li $t5, 10
			sb $t5, 2($t1)
			la $t1, column_heigh
			lb $t5,2($t1)
			sb $t5,1($t1)
			sb $zero,2($t1)
			j end_update_column
		
		create_second_column:
			la $t1, column_coord
			lb $t5, 2($t1)
			addi $t6, $t5, 117
			move $a0, $t6
			jal  create_column
			subi $t5,$t5,1
			la $t1, column_coord
			beqz $t5, created_second
			sb $t5, 2($t1)
			j loop_move_columns
			
			created_second:
			li $t5, 127
			sb $t5, 1($t1)
			li $t5, 10
			sb $t5, 2($t1)
			la $t1, column_heigh
			lb $t5,1($t1)
			sb $t5,($t1)
			lb $t5,2($t1)
			sb $t5,1($t1)
			sb $zero,2($t1)
			la $t1, column_coord
			j loop_move_columns
	
	set_second_column:
		li $t3, 127
		sb $t3, 1($t1)
		j loop_move_columns
	


	end_update_column:
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra

create_column:
	
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $t1, column_heigh
	la $t0, img
	lb $t9, 2($t1)
	beqz $t9, get_random_heigh		#altura aleatoria de la columna superior
	continue_create_colum:
	sb $t9, 2($t1)
	li $a1, 0
	move $a2, $t9
	li $a3, 0x00ffffff
	jal ColumnasVerticales		#pinto la columna superior
	addiu $a1, $t9, 20
	li $t8, 64
	sub $a2, $t8, $a1
	jal ColumnasVerticales		#pinto la columna inferior
	j end_create_column
	
	get_random_heigh:
		#creo la altura aleatoria de la columna superior y la almaceno
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
		j continue_create_colum
	
	end_create_column:
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
