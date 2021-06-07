.globl update_column
update_column:
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	
	
	la $t1, column_coord
	la $t0, img
	lb $t2, ($t1)
	lb $t3, 1($t1)
	li $t4, -1  #variable de seleccion de columna para mover
	beqz $t3, create_first_columns
	#Desplazo la hilera de la derecha de las columnas hacia la izquierda de la columna
	loop_move_columns:
		la $t0, img
		addiu $t4, $t4,1
		li $t9, 64
		mulu $t5, $t2, 4
		addu $t8, $t0, $t5  # me coloco en la pisicion de la derecha de la primra columna
		loop_move_column:
			beqz $t9, end_move_columns
			subi $t9,$t9,1
			lw $t7, ($t8)  #almaceno la info del pixel 
			sw $zero, ($t8)#limpio el pixel
			ble $t2, 10, errase_column
			sub $t8, $t8, 40  #me muevo hacia atras hacia donde debo pintar la columna
			sw $t7, ($t8)  # pinto el pixel 1 posicion a la izq de donde esta la columna 
			addiu $t8,$t8, 40 # me muevo a la posicion de la derecha de la columna
			errase_column:
			addiu $t8,$t8, 512 # me muevo a la fila de abajo
			j loop_move_column
			
	end_move_columns:
	subi $t2, $t2, 1
	sb $t2, ($t1)
	addiu $t1,$t1,1
	lb $t2, ($t1)
	beqz $t4, loop_move_columns
	la $t1, column_coord
	lb $t2, ($t1)
	beqz $t2, delete_first_column
	ble $t2, 10, create_column_right

	j end_update_column
	
	delete_first_column: #si se borro por completo la columna de la izq, la segunda pasa  a ser la de la izq y la de la derecha pasa a ser la segunda
		sb $t3, ($t1)
		li $t2, 127
		sb $t2, 1($t1)
		j end_update_column
		
	create_column_right:  
		li $t0, 117
		addu $a0, $t0, $t2
		jal  create_column
		j end_update_column

	create_first_columns:
		beqz $t2, create_first_column
		li $t4, 0
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
			j end_update_column
		
		create_second_column:
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
		li $t9, 18
		j continue_create_colum
	
	end_create_column:
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra