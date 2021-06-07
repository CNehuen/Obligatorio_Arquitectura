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
	#Desplazo la hilera de la derecha de las columnas hacia la izquierda de la columna
	loop_move_columns:
		addiu $t4, $t4,1
		li $t9, 64
		mulu $t5, $t2, 4
		addu $t8, $t0, $t5  # me coloco en la pisicion de la derecha de la primra columna
		loop_move_column:
			beqz $t9, end_move_columns
			subi $t9,$t9,1
			lw $t7, ($t8)  #almaceno la info del pixel 
			sw $zero, ($t8)#limpio el pixel
			blt $t2, 10, errase_column
			sub $t6, $t8, 44  #me muevo hacia atras hacia donde debo pintar la columna
			sw $t7, ($t8)  # pinto el pixel 1 posicion a la izq de donde esta la columna 
			addiu $t8,$t8, 44 # me muevo a la posicion de la derecha de la columna
			errase_column:
			addiu $t8,$t8, 512 # me muevo a la fila de abajo
			j loop_move_column
			
	end_move_columns:
	beqz $t4, loop_move_columns
	subi $t3, $t3, 1
	subi $t2, $t2, 1
	beqz $t2, delete_first_column
	blt $t2, 10, create_column_right
	sw $t2, ($t1)
	sw $t3, 1($t1)
	j end_update_column
	
	delete_first_column: #si se borro por completo la columna de la izq, la segunda pasa  a ser la de la izq y la de la derecha pasa a ser la segunda
	sw $t3, ($t1)
	li $t2, 127
	sw $t2, 1($t1)
	j end_update_column
		
	create_column_right:
	li $t0, 117
	addu $a0, $t0, $t2
	jal  create_column
	j end_update_column

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
	lb $t9, 3($t1)
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
	
	get_random_heigh:
	#creo la altura aleatoria de la columna superior y la almaceno
	j continue_create_colum
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra