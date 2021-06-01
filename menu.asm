.globl menu
.text
menu:
	#$a0 -> string para dibujar
	#$a1 -> coordenada X del String en la pantalla
	#$a2 -> coordenada Y del String en la pantalla
	#$a3 -> color?
	
	#la $a0, String8x8
	#li $a1, 2
	#li $a2, 2
	#jal dibujarString
	#la $a0, String28x8
	#li $a1, 2
	#li $a2, 22
	#jal dibujarString
	#la $a0, String38x8
	#li $a1, 2
	#li $a2, 42
	#jal dibujarString

	#la $a0, StringFlappy
	#li $a1, 2
	#li $a2, 2
	#jal dibujarString
	#la $a0, MenuJuego1
	#li $a1, 2
	#li $a2, 22
	#jal dibujarString
	#la $a0, MenuJuego2
	#li $a1, 2
	#li $a2, 32
	#jal dibujarString
	#la $a0, MenuJuego3
	#li $a1, 2
	#li $a2, 42
	#jal dibujarString

	jr $ra

	
