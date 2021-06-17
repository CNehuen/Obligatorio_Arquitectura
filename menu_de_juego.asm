.globl menu_de_juego
#Considerciones generales
# tamaño del bicho  -> 8x8
# tamaño del espacio entre colunas -> 20
# salto del bicho cuantos pixeles sube -> 4
#cuanto tarda en completar el salto -> 2
#Funciones a realizar
# - Refresh puntaje (tranformar el registro en string)
# - Refresh background -> mover las columnas ()
# - Refresh posicion del bicho (x,y, 1 ->(subir)/0 ->(bajar))

.text

menu_de_juego:
	#Se muestra el menu de la siguiente forma:
	# Titulo: 
	#Opciones de menu:
	#	NUEVO JUEGO: comienza nueva partida
	#	SALIR: retorna al menu de seleccion de juego
	#Parametros:
	# a0-> el juego: 0 = FLAPPY BIRD //// 1 = CAR RACING
	
	#-----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	gamemenu:
	jal clean_screen
	addi $a0,$a0, 1
	move $s0, $a0
	jal menu #menu de juego
	beqz $v0, nueva_partida 
	j salir_juego
	nueva_partida:
		beq $s0, 2, juego_car
			jal flappy_new_game
			j gamemenu
			 juego_car:
			 jal car_new_game
			j gamemenu
	salir_juego:
	jal clean_screen
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
	
	


  


