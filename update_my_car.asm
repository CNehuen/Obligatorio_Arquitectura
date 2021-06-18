.globl update_my_car
.eqv control2 0xFFFF0000
.eqv data2 0xFFFF0004
update_my_car: 
   			#-----PROLOGO-----#
			#Guardo $ra en sp para no perderlo
			addi $sp, $sp, -4 
			sw $ra, ($sp)	
				
				##PARTE SEPARADA DEL METODO YA QUE ES RECURSIVA## 			
				## Inicializar coordenadas en Yauto		
				##Zona inicial es Zona 1  	
 				# y = 3 + t2 *22
 			 	#Lo que importa es lo que vale $t2
 			 	#la $t1, coordenadaenYauto 	#Zona y Movimiento
				lb $t2, ($t1)				 				 	
 			 	bne $t2, -1, movimientoAuto 
 			 	li $t2, 0
 			 	j BajarAuto  		 	
 			 	
				movimientoAuto:					
				la $t1, control2
				lw $t2, ($t1)
				andi $t2 , $t2, 0x01
				beqz $t2, finMovimientoAuto
				la $t1, data2  
				lw $s2, ($t1) #0x00 00 00 00			
				bne $s2, 'w', finMovimientoAuto
				bne $s2, 's', finMovimientoAuto										  						  
				#la $t1, coordenadaenYauto 	#Zona y Movimiento
				lb $t2, ($t1) 			    #Zona actual 					
				la $a0, limpiarAuto 				#Es para que limpie el auto  
				li $a1, 4 					#Posicion en x siempre es 4		
				move $a2, $t4					
				jal dibujarString 
				la $a0, limpiarAuto 				#Es para que limpie el auto  
				li $a1, 4 
				addi $t4, $t4, 4					#Posicion en x siempre es 4		
				move $a2, $t4					
				jal dibujarString 
				#la $t1, coordenadaenYauto     				        				
				lb $t2, ($t1)  
				beq $s2, 'w', SubirAuto
				beq $s2, 's', BajarAuto	
				
			 		
				
				SubirAuto:
				beqz $t2, no_subir  #La zona es 0 , la zona es 1 o 2  
				sub $t2, $t2, 1 				
				no_subir:
				li $a0, 4    #Recibe posicion en x 
				mul $t4, $t2, 22 
				addi $t4, $t4,3
				move $a1, $t4	 #Recibe posicion en y 
				li $a2, 1 
				sb $t2, ($t1) 		   
				jal dibujar_auto	  																						 						 						
				
			
				j finMovimientoAuto
						
				BajarAuto:
				beq $t2, 2, no_bajar
				addi $t2, $t2, 1 
				no_bajar:
				li $a0, 4    #Recibe posicion en x 
				mul $t4, $t2, 22 
				addi $t4,$t4,3
				move $a1, $t4	 #Recibe posicion en y 
				li $a2, 1  
				sb $t2, ($t1)		   
				jal dibujar_auto																			 
				
				j finMovimientoAuto
						
			finMovimientoAuto:																									
						
			#-----EPILOGO-----#
    		lw $ra , ($sp) 	
			addi $sp, $sp, 4 
							
			jr $ra	
			
