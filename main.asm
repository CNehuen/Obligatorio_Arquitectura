#Obligatorio Sistemas Digitales y Microcontroladores
#Agustin Abo - 193196
#Nehuen Carol - 225459

#Version Desktop
.globl main

.globl img
 
.globl Int8x8 
.globl bird8x8
.globl font8x8
.globl column_coord
.globl column_heigh
.globl pseudorandom_values
.data 
.align 2
img: .space 32768 #espacio de memoria para la imagen 
font8x8: .space 8 
#La imagen se compone de rectangulos de n*m bits
#Cada rectangulo tiene asignado un word para la seleccion de colores
#El byte LSB para el canal B, el siguiente para el G, el siguiente para el R, y el MSB se desperdicia
bird8x8: .asciiz "p"  
.align 2
Int8x8: .asciiz "0000" #Para dibujar los numeros
MenuPrincipal: .asciiz "MENU PRINCIPAL"
StringOtroJuego: .asciiz "OTRO JUEGO"
StringFlappy: .asciiz "FLAPPY BIRD"
MenuJuego1: .asciiz "NUEVO JUEGO"
MenuJuego2: .asciiz "RANKING"
MenuJuego3: .asciiz "SALIR"
column_coord: .space 3  #coordenadas en x de cada una de las columnas. la 3ra coordenada es un auxiliar
column_heigh: .space 3 #corrdenadas en y de los espacios de las columnas. la 3ra posicion es para la columna que se crea mientas se borra la de las a  la izq
pseudorandom_values: .space 13 #13 valores que simulan aleatoriedad y un indice de seleccion:[0]-> indice; [1 -12]->numero 

.eqv keyboard_cmd 0xFFFF0012
.eqv keyboard_pressed 0xFFFF0014
.text


main:
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
	
	#jal MenuElegirJuego #menu de seleccion de juego
	#beqz $v0,inicio_flappy_bird
	#beq $v0, 1, inicio_otro_juego
	
	inicio_flappy_bird:
		jal flappy_bird
		j terminar_consola
	inicio_otro_juego:
	
	terminar_consola:
	li $v0 10
	syscall
	

MenuElegirJuego:
	la $t0, keyboard_pressed
	la $t1, keyboard_cmd
	li $t2, 0x1
	sb $t2,($t1)
	li $v0,0
	j salgo
	loop:
		lbu $t3,($t0)
		lbu $t4,($t1)
		beqz $t3, loop
		beq $t3, 0x11,boton_cero
		beq $t3, 0x81,boton_tres
		j loop
	boton_cero:
		li $v0,0
		j salgo
	boton_tres:
		li $v0, 1
		j salgo
	salgo:
		jr $ra
	
