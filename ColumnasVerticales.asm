.globl ColumnasVerticales                                       
                                                                                                                             
ColumnasVerticales:   
	#Funcion que pinta rectangulos verticalemte desde la pisicion (x,y) 
	#hacia abajo n veces, del color pasado por parametro
	#Parametros:
	#$a0 -> posicion en x
	#$a1 -> posicion en y
	#$a2 -> cantidad de rectangulos a pintar
	#$a3 -> color
	la $t0, img
	addu $t3,$t0,32768
	mulu $t1,$a1,128 							#calculo la posicion del rectangulo de posicion (x,y) en la memoria
	addu $t1,$t1,$a0
	mulu $t1, $t1, 4
	addu $t0, $t0,$t1							#accedo a la posicion de memoria correspondiente al rectangulo a pintar

	
	pintar_rectangulos:
		beqz $a2, salir_funcion_rectangulos			#si no hay rectangulos para pintar, salgo
		bgt $t0,$t3,salir_funcion_rectangulos		#si trata pintar por fuera de la imagen, salgo
		sw $a3, ($t0)								#pinto el rectangulo
		addiu $a2,$a2,-1							
		addiu $t0,$t0,512								#accedo al siguiente rectangulo a pintar
	j pintar_rectangulos
	salir_funcion_rectangulos:
	jr $ra

 










