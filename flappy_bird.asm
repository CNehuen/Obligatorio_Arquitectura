.globl flappy_bird
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

flappy_bird:
	#Se muestra el menu de la siguiente forma:
	# Titulo: FLAPPY BIRD
	#Opciones de menu:
	#	NUEVO JUEGO: comienza nueva partida
	#	RANKING: visualiza las mejores posicions del ranking
	#	SALIR: retorna al menu de seleccion de juego
	
	#-----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	gamemenu:
	jal clean_screen
	li $a0, 1
	jal menu #menu de juego
	beqz $v0, nueva_partida 
	j salir_flappy
	nueva_partida:
		jal flappy_new_game
		j gamemenu
	salir_flappy:
	jal clean_screen
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
	
	


  


