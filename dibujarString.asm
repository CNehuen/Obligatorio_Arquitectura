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
	# -----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addu $t1, $a0,$0
	li $t0,0  #Contador para recorrer el string
	loopString:
		lb $t1, ($a0)
		
	