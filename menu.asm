#Obligatorio Sistemas Digitales y Microcontroladores
#Agustin Abo - 
#Nehuen Carol - 225459

#Version Desktop
.globl main
.globl img
.globl String8x8 
.globl Int8x8 
.globl font8x8
.data 
 
img: .space 32768 #espacio de memoria para la imagen 
#La imagen se compone de rectangulos de n*m bits
#Cada rectangulo tiene asignado un word para la seleccion de colores
#El byte LSB para el canal B, el siguiente para el G, el siguiente para el R, y el MSB se desperdicia
#String8x8: .space 17 #Para los strings 
font8x8: .space 8
String8x8: .asciiz "MENU PRINCIPAL"
String28x8: .asciiz "FLAPPY BIRD"
String38x8: .asciiz "OTRO JUEGO"
StringFlappy: .asciiz "FLAPPY BIRD"
MenuJuego1: .asciiz "NUEVO JUEGO"
MenuJuego2: .asciiz "RANKING"
MenuJuego3: .asciiz "SALIR"
Int8x8: .space 4 #Para los numeros
.eqv keyboard_cmd 0xFFFF0012
.eqv keyboard_pressed 0xFFFF0014
.text


main:
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

	la $a0, StringFlappy
	li $a1, 2
	li $a2, 2
	jal dibujarString
	la $a0, MenuJuego1
	li $a1, 2
	li $a2, 22
	jal dibujarString
	la $a0, MenuJuego2
	li $a1, 2
	li $a2, 32
	jal dibujarString
	la $a0, MenuJuego3
	li $a1, 2
	li $a2, 42
	jal dibujarString

		
	#termiar consola:
	li $v0 10
	syscall

	
