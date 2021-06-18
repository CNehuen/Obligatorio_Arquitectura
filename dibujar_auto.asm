.globl dibujar_auto
dibujar_auto:
	#$a0 -> coordenada X del auto en la pantalla
	#$a1 -> coordenada Y del auto en la pantalla
	#$a3 -> direccion: 1 para el auto del usuario, 0 para los autos obstaculo invertidos
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $t0, img
	beqz $a3, cargo_invertido
		la $t2, car16x12
		j auto_cargado
		cargo_invertido:
		la $t2, car16x12Inv
	auto_cargado:
	mulu $t1,$a1,128
	addu $t1,$t1,$a0
	mulu $t1, $t1, 4
	addu $t0, $t0,$t1		
	li $t3, 12  #Recorre las 12 filas 
	addi $t0, $t0,-512		
	addi $t0, $t0,64	
	
	LoopCarRow: 
	    beqz $t3, finLoopCar
	    li $t4, 16                 #Para la matriz que contiene el auto
		addi $t3, $t3, -1 
	    addi  $t0, $t0, 512       #Avanzo una fila hacia abajo
	    addi  $t0, $t0, -64			#Vuelvo 8 pixeles para atras 
		lh $t1, ($t2)
		addiu $t2, $t2, 2
		LoopCarColumn: 
		    beqz $t4, LoopCarRow
		    addi $t4, $t4, -1
	 		andi $t5, $t1, 0x00000001 	 #1000 0000 -> 0x80
			beqz $t5, PixelNegro
				PixelBlanco:
				li $t8, 0x00FFFFFF
				sw $t8, ($t0) 
				j TerminoPintarCar 
			
				PixelNegro:            
	            sw $zero, ($t0)
	           
	           	TerminoPintarCar:   	
	           	srl $t1, $t1, 1
				addiu $t0, $t0, 4 
	              
		j LoopCarColumn
	
	finLoopCar:  
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
