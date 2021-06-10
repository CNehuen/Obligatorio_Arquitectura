.globl perdio


perdio: 
 			
		la $t1, column_coord #Vector que tiene 3 posicions de columna
		la $t0, img 		 #Cargo la imagen
		lb $t2, ($t1)		 #En t2 tengo la parte derecha de la primer Col	
		li $t4, $zero						#CONTADOR DE FILAS
		beq $t2, 38, comparo	
		comparo:
		addu $t8, $t0, $t2   #Se lo sumo a la imagen y lo asigno a t8 	
		sub $t8, $t8, 40	 #Le resto 40 posiciones para estar en la parte izq	
		
		#Columna de arriba
		la $t5, column_heigh
		RepetirBusqueda
		beq $t4, $t5, TodaviaSigueConVida			#Entro en un loop
		lw $t2, ($t8)
		bne $t2, 0, perdio 
		addi $t8, $t8, 512
		addi $t4, $t4, 1
		j RepetirBusqueda
		
		#Columna de abajo
		TodaviaSigueConVida:
		addi $t5, $t5, 20
		li $t4, $zero
		addi $t4, $t4, $t5
		li $t7, 4096
		addi $t8, $t8, $t7
		RepBusqueda
		beq $t4, 63, Sobrevivio
		lw $t2, ($t8)
		bne $t2, 0, perdio
		addi $t8, $t8, 512
		addi $t4, $t4, 1
		j RepBusqueda
		
		Sobrevivio:
		jr $ra 
		
		
		                      #512*8=4096  
		
    	##Si mi posicion en x de la columna SUPERIOR
     	##Toca con un blanco PERDIO
    	 
    	##Si mi posicion en x de la columna INFERIOR
    	##Toca con un blanco PERDIO 
    	 