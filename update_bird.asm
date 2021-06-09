.globl update_bird

update_bird:
   			#-----PROLOGO-----#
			#Guardo $ra en sp para no perderlo
			addi $sp, $sp, -4 
			sw $ra, ($sp)
			
			la $a0, bird8x8
			li $a1, 20	
			li $a2,	20	
			jal dibujarString 
			
			movimientoPajaro: 
				la $t1, coordenadaenY #Vector que tiene Yactual y alpha
				lb $t2, ($t1) 			#Posicion actual #Aca tengo el 20
				lb $t3, 1($t1) 			#Alpha #Aca tengo un 0 #T3 asociado al boton
				##BOTON##        #Si t3 esta en uno significa que apreto el boton
				#SI VOS APRETAS EL BOTON $t3 va de dos en dos 
				############################################
				li $t8, 0 #CONTADOR 
				beqz $t3, BajarPajaro   #Imagino que me apretan el boton
				bgt $t3, 1, SubiendoPajaro  #El boton hace que suba 2 pixeles
										
														
					SubiendoPajaro: 
					la $a0, ' ' #Es para que borre  
					li $a1, 20 	#Posicion en x siempre es 20
					li $a2,	$t2 #Voy a tener mi posicion en y 
					jal dibujarString
					sub $t2, $t2, 1 	#Sube 1 pixel 
					la $a0, bird8x8     #Dibuja el pajaro
					li $a1, 20 			#Posicion en x
					li $a2, $t2			#Nueva posicion en y duda 
					sub $t3, $t3, 1     #Vuelvo mi boton a 0   
					sw $t3, 1($t1)  	#Lo guardo
					sub $t2, $t2, 1   	#Pasa a ser 19 
					sw $t2, ($t1)    	#Guardo mi nueva posicion actual 
					addi $t8, $t8, 1  	#Sumo uno al contador
					jal dibujarString  	#Dibujo el pajaro 
					la $t1, coordenadaenY
					lb $t2, ($t1)
					lb $t3, 1($t1)      #Leo mis nuevos datos
					#Si no apretan el boton de nuevo tengo que terminar 
					#el movimiento solo subiendo otro pixel
					##LEO NUEVAMENTE
					beq $t3, 1, SeguirSubiendo 
					beq $t3, 0, Subo
					
					Subo:
					li $t8, 2
					bne $t8, 4, SubiendoPajaro   
					j movimientoPajaro
					
					SeguirSubiendo:
					bne $t8, 4, SubiendoPajaro
					j movimientoPajaro
									
					BajarPajaro:
					la $a0, " " #Es para que borre  
					li $a1, 20 	#Posicion en x siempre es 20
					li $a2,	$t2 #Voy a tener mi posicion en y
					jal dibujarString
					addi $t2, $t2, 1					 #Baja un pixel  
					la $a0, bird8x8
					li $a1, 20 
					li $a2, $t2  
					sub $t2, $t2, 1 
					sw $t2, ($t1)
					addi $t8, $t8, 1 
					ble  $t8, 1, Pregunto
					j movimientoPajaro
					
					Pregunto:
					beqz  $t3, BajarPajaro
					j Subo
					
			fin:
					
					
			#-----EPILOGO-----#
    		lw $ra , ($sp) 	
			addi $sp, $sp, 4 
	
				
						
			jr $ra 	
			
			
			
			
			##El pajaro va arrancar teniendo 
			##En la posicion en x=20 y en la posicion en y=20 
			##La x se va mantener y la posicion en y va a variar
			##Como hago para variar la y? 
			##Hago un vector que tenga mi posicion actual
			##Y un alpha que tenga cuantos saltos voy teniendo
			##Que lo haga en dos tiempos
			##Si alpha es mayor a 0 que haga 
			## ynuevo = yactual + beta
			##Si alpha es menor a 0 que haga 
			## ynuevo = yactual - beta
			##Beta se va mover dos pixeles para arriba 
			##En dos tiempos distintos
			
			
			
			
			
			
			
			
