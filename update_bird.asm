#Controla el movimiento del pajaro
#El pajaro se mueve verticalmente, y las columnas horizaontalmente de derecha a izquiera, lo que hace parecer que
#	el pajaro se esta desplazando.
#Existe un vector coordenadaenY que almacena la posicion actual del pajaro (en el eje Y) y un int que representa,
#	en el caso de que el pajaro haya saltado, cuantos pixeles debe seguir subiendo. Si el int es cero, entonces el
#	pajaro debe descender. Este numero se actualiza con cada comando "saltar" que se ingresa en el teclado con
#	la tecla de espacio

.globl update_bird
update_bird:
			#-----PROLOGO-----#
			#Guardo $ra en sp para no perderlo
			addi $sp, $sp, -4
			sw $ra, ($sp)
			
			movimientoPajaro:
			la $t1, coordenadaenY #Vector que tiene Yactual y alpha
			lb $t2, ($t1) #Posicion actual #Aca tengo el 20
			lb $t3, 1($t1) #Alpha #Aca tengo un 0 #T3 asociado al boton
			la $a0, limpiarPajaro #Es para que borre
			li $a1, 20 #Posicion en x siempre es 20
			move $a2, $t2 #Voy a tener mi posicion en y
			jal dibujarString
			la $t1, coordenadaenY
			lb $t2, ($t1)
			lb $t3, 1($t1)
			bltz $t3, BajarPajaro #Imagino que me apretan el boton
			bgez $t3, SubiendoPajaro #El boton hace que suba 2 pixeles
			
			SubiendoPajaro:
				beqz $t2, no_subir
				sub $t2, $t2, 1 #Sube 1 pixel
				no_subir:
				la $a0, bird8x8 #Dibuja el pajaro
				li $a1, 20 #Posicion en x
				move $a2, $t2 #Nueva posicion en y 19
				sub $t3, $t3, 1 #Vuelvo mi boton a 0
				sb $t3, 1($t1) #Lo guardo
				sb $t2, ($t1) #Guardo mi nueva posicion actual
				jal dibujarString #Dibujo el pajaro
				move $v0, $zero
				j finMovimientoPajaro

			BajarPajaro:
				addi $t2, $t2, 1 #Baja un pixel
				sigo:
				la $a0, bird8x8
				li $a1, 20
				move $a2, $t2
				sub $t3, $t3, 1
				bgez $t3, ContinuarBajando
				addi $t3, $t3, 1
				ContinuarBajando:
				sb $t3, 1($t1)
				sb $t2, ($t1)
				jal dibujarString #Dibujo el pajaro
				move $v0, $zero
				j finMovimientoPajaro
    
					
finMovimientoPajaro:
#-----EPILOGO-----#
lw $ra , ($sp)
addi $sp, $sp, 4
jr $ra
