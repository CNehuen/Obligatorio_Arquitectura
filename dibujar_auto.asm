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
	la $t2, car16x12
	mulu $t1,$a1,128
	addu $t1,$t1,$a0
	mulu $t1, $t1, 4
	addu $t0, $t0,$t1
	beqz $a3, invierto_auto		
	li $t3, 12  #Recorre las 12 filas 
	addi $t0, $t0,-512		
	addi $t0, $t0,64	
	LoopCarRow: 
	    beqz $t3, finLoopCarInv
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
	    
	
	invierto_auto:
	li $t3, 12  #Recorre las 12 filas 
	addi $t0, $t0,-512	
	addi $t2, $t2, 24	
	LoopCarRowInv: 
	    beqz $t3, finLoopCarInv
		li $t6,0
		li $t4, 16                 #Para la matriz que contiene el auto
		addi $t3, $t3, -1 
	    addi  $t0, $t0, 512       #Avanzo una fila hacia abajo
	    addi  $t0, $t0, -64			#Vuelvo 8 pixeles para atras 
		lh $t1, ($t2)
		addiu $t2, $t2, -2
		LoopCarColumnInv: 
			addi $t6, $t6,1
		    beqz $t4, LoopCarRowInv
		    addi $t4, $t4, -1
	 		andi $t5, $t1, 0x00000001 	 #1000 0000 -> 0x80
			beqz $t5, PixelNegro
				PixelBlancoInv:
				li $t8, 0x00FFFFFF
				sw $t8, ($t0) 
				j TerminoPintarCarInv
			
				PixelNegroInv:            
	            sw $zero, ($t0)
	           
	           	TerminoPintarCarInv:   	
	           	srl $t1, $t1, 1
				addiu $t0, $t0, 4
				add $t7, $t6,$a0
				bge $t7,127, cortar_auto
	           j LoopCarColumnInv
	           
				cortar_auto:
					mul $t7, $t6,4
					sub $t0,$t0, $t7
					j LoopCarColumnInv
					
	    finLoopCarInv:  
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
