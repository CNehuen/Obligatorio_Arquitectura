.globl dibujarString
##########################
#Menu Principal 
#Elegir juego
#Flappy Bird 
#El otro juego
#Nueva partida
#Ranking
#Su puntaje (String) : (durante un tiempo determinado) (Temporizador) 
#Puntaje (int)
#Salir 

dibujarString:
	#Max caracteres por linea : 14
	#$a0 -> string para dibujar #
	#$a1 -> coordenada X del String en la pantalla
	#$a2 -> coordenada Y del String en la pantalla
	#$a3 -> color?
	#-----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	
	
	#-----CUERPO-----#
	la $t6, img				
	mulu $t7, $a2, 128  		#calculo la posicion del rectangulo de posicion (x,y) en la memoria
	addu $t7, $t7, $a1
	mulu $t7, $t7, 4 
	addu $t6, $t6, $t7
	sub  $t6, $t6, 512   
	move $t9, $a0 #Copiar a0 en t1
	li $t0,0  #Contador para recorrer el string
	loopString:
	
		lb $a0, ($t9)
		beqz $a0, finLoopString
		la $t2, font8x8
		jal getFont8x8
		li $t3, 8 #Recorre las 8 filas 
		addi  $t6, $t6, 32
		addiu $t2, $t2, -1
		LoopFontRow: 
		    beqz $t3, finLoopFont
		    li $t4, 8                 #Para la matriz que contiene la letra
			sub $t3, $t3, 1 
		    addi  $t6, $t6, 512       #Avanzo una fila hacia abajo
		    addi  $t6, $t6, -32			#Vuelvo 8 pixeles para atras 
			lb $t1, ($t2)
			addiu $t2, $t2, 1
			LoopFontColumn: 
			    beqz $t4, LoopFontRow
			    sub $t4, $t4, 1
		 		andi $t7, $t1, 0x00000001 	 #1000 0000 -> 0x80
	            beqz $t7, PintoNegro
	            PintoBlanco:
	            li $t8, 0x00FFFFFF
	            sw $t8, ($t6) 
	                  
	            j TerminoPintar 
				
				PintoNegro:            
	            li $t8, 0x00000000
	            sw $t8, ($t6)
	            
	            TerminoPintar:   	
	            srl $t1, $t1, 1
	            addiu $t6, $t6, 4 
	               
	            j LoopFontColumn
	          
	 
		finLoopFont: 
		sub $t6, $t6, 4096   #Vuelvo 8 filas para arriba
		addi $t6, $t6, 4     #Avanzo un pixel a la derecha para siguiente letra
		addi $t9, $t9, 1     #Avanzo una letra del string
		j loopString
	            	           
				
	    		            
	            
	            
	            
	finLoopString:     #Va al epilogo  
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra 
    
