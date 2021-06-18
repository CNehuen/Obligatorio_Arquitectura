.globl perdioAuto

perdioAuto:	 
   		#-----PROLOGO-----#
		#Guardo $ra en sp para no perderlo
		addi $sp, $sp, -4 
		sw $ra, ($sp) 
		
		la $t1, coordenadaenYauto   	 		 
		lb $t2, ($t1)	
		la $t0, img				#Cargo la imagen	
		

		mulu $t3, $t2, 22
		addiu $t3, $t3,3 #pos Y del auto
		mulu $t3, $t3, 128
		addiu $t3, $t3, 4  #(Yauto *128 + Xauto) donde Xauto =4
		mulu $t3, $t3, 4   #lo paso a bytes que me tengo que mover
		addu $t3, $t3, $t0 #me paro en el byte correspondiente
		#Primero verifico que no haya nada a la izquierda del auto en esa posicion
		#por si llego a pararme encima de uno
		addiu $t3, $t3, 512
		addi $t3, $t3, -4
		lw $t4, ($t3)
		bnez $t4, perdioelcontroldelauto
		#como el auto tiene forma variable, verifico por las dudas un pixel mas hacia el 
		#medio del vehiculo
		addiu $t3, $t3, 2560
		lw $t4, ($t3)
		bnez $t4, perdioelcontroldelauto
		#si no me pare sobre un auto, verifico que no choque contra uno de frente
		# me paro en el frente del vehiculo
		#con verificar un solo pixel alcanza porque el auto es plano en el frente
		addi $t3, $t3,68
		lw $t4, ($t3)
		bnez $t4, perdioelcontroldelauto
		#si no entro en inguna de esas verificaciones entonces no choco
		j SobrevivioElAuto
		
		perdioelcontroldelauto:
		li $v0, 32
		li $a0, 1500
		syscall
		li $v0, 1
		j terminarVerificacionDelAuto

		SobrevivioElAuto:
		li $v0, 0
		terminarVerificacionDelAuto:
		#-----EPILOGO-----#
		lw $ra , ($sp)
		addi $sp, $sp, 4
		jr $ra		
		
