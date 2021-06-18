.globl perdioAuto

perdioAuto:		
		# addu $t3,$t0,32768
		#Falta condicion de otro Auto 
   		#-----PROLOGO-----#
		#Guardo $ra en sp para no perderlo
		addi $sp, $sp, -4 
		sw $ra, ($sp) 
		
		la $t1, coordenadaenYauto   	 		 
		lb $t2, ($t1)		 #En t2 tengo la parte derecha de la primer Col	
		la $t0, img				#Cargo la imagen	
		
		beq $t2, 0, verificar1SiPerdio
		beq $t2, 1, verificar2SiPerdio
		beq $t2, 2, verificar3SiPerdio
		
		
		verificar1SiPerdio:
		#Verifico a la derecha
		li $a0, 21  #Posicion en x
		li $a1, 3   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3,$t3,$a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto
		#Verifico Abajo
		li $a0, 15
		li $a1, 20 
		li $t0, 0 
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto
		j finalizaEsteMovimiento
		
		verificar2SiPerdio:
		#Verifico a la derecha 
		li $a0, 21  #Posicion en x
		li $a1, 25   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto
		#Verifico Arriba
		li $a0, 15  #Posicion en x
		li $a1, 21   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto
		#Verifico Abajo
		li $a0, 15  #Posicion en x
		li $a1, 42   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto		
								
		j finalizaEsteMovimiento
		
		verificar3SiPerdio:
		#VerificoALaDerecha
		li $a0, 21  #Posicion en x
		li $a1, 47   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto	
		#VerificoArriba
		li $a0, 15  #Posicion en x
		li $a1, 43   #Posicion en y  
		mulu $t3, $a1, 128 		
		addu $t3, $t3, $a0
		mulu $t3, $t3, 4
		addu $t0, $t0, $t3  #Necesito saber si es blanco
		lw $t2, ($t0)
		bne $t2, 0, perdioelcontroldelauto	
		j finalizaEsteMovimiento	
		
		perdioelcontroldelauto:
		li $v0, 1
		j terminarVerificacionDelAuto
		
		SobrevivioElAuto:
		li $v0, 0
		
		
		terminarVerificacionDelAuto:
		#-----EPILOGO-----#
		lw $ra , ($sp)
		addi $sp, $sp, 4


jr $ra		
		