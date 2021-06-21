#Este archivo se encarga de infromar al archivo menu el menu de que juego mostrar, y en base a lo obtenido
# ejecuta el juego correspondiente

.globl menu_de_juego

.text
menu_de_juego:
	#Se muestra el menu de la siguiente forma:
	# Titulo: Titulo del juego
	#Opciones de menu:
	#	NUEVO JUEGO: comienza nueva partida
	#	SALIR: retorna al menu de seleccion de juego
	#Parametros:
	# a0-> el juego: 0 = FLAPPY BIRD //// 1 = CAR RACING
	
	#-----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	addi $a0,$a0, 1
	move $s0, $a0
	gamemenu:
	jal clean_screen
	move $s0, $a0
	jal menu #menu de juego
	beqz $v0, nueva_partida 
	j salir_juego
	nueva_partida:
		beq $s0, 2, juego_car
			jal flappy_new_game
			move $a0, $v0
			j gamemenu
			juego_car:
			jal car_new_game
			move $a0, $v0
			j gamemenu
	salir_juego:
	jal clean_screen
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
	
	


  


