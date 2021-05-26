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
	#$a0 -> string para dibujar
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
	move $t1, $a0 #Copiar a0 en t1
	li $t0,0  #Contador para recorrer el string
	loopString:
	
		lb $a0, ($t1)
		beqz $a0, finLoopString
		la $t2, font8x8
		jal getFont8x8
		li $t3, 8 #Recorre las 8 filas 
		LoopFontRow: 
		    li $t4, 8                 #Para la matriz que contiene la letra
			sub $t3, $t3, 1 
		    beqz $t3, finLoopFont
		    addi  $t6, $t6, 512       #Pantalla Grande
			LoopFontColumn: 
			    sub $t4, $t4, 1
			    beqz $t4, LoopFontRow
		 		and $t5, $t2, 0x10000000 		
	            beqz $t5, PintoNegro
	            PintoBlanco:
	            li $t8, 0x00FFFFFF
	            sw $t8, ($t6) 
	                  
	            j TerminoPintar 
				
				PintoNegro:            
	            li $t8, 0x00000000
	            sw $t8, ($t6)
	            
	            TerminoPintar:   	
	            sll $t2, $t2, 1
	            addiu $t6, $t6, 4    
	            j LoopFontColumn
	          
	 
		finLoopFont: 
		sub $t6, $t6, 4096   #Vuelvo 8 filas para arriba
		addi $t6, $t6, 4     #Avanzo un pixel a la derecha para siguiente letra
		addi $t1, $t1, 1     #Avanzo una letra del string
		j loopString
	            	           
				
	    		            
	            
	            
	            
	finLoopString:     #Va al epilogo  
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra 
    