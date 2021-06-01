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
font8x8: .space 8 
#La imagen se compone de rectangulos de n*m bits
#Cada rectangulo tiene asignado un word para la seleccion de colores
#El byte LSB para el canal B, el siguiente para el G, el siguiente para el R, y el MSB se desperdicia
String8x8: .space 17 #Para los strings 
Int8x8: .space 4 #Para los numeros
MenuPrincipal: .asciiz "MENU PRINCIPAL"
StringOtroJuego: .asciiz "OTRO JUEGO"
StringFlappy: .asciiz "FLAPPY BIRD"
MenuJuego1: .asciiz "NUEVO JUEGO"
MenuJuego2: .asciiz "RANKING"
MenuJuego3: .asciiz "SALIR"
.eqv keyboard_cmd 0xFFFF0012
.eqv keyboard_pressed 0xFFFF0014
.text


main:
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
	
	jal MenuElegirJuego #menu de seleccion de juego
	beqz $v0,inicio_flappy_bird
	beq $v0, 1, inicio_otro_juego
	
	inicio_flappy_bird:
		jal flappy_bird
		j terminar_consola
	inicio_otro_juego:
	
	termiar consola:
	li $v0 10
	syscall
	

MenuElegirJuego:
	la $t0, keyboard_pressed
	la $t1, keyboard_cmd
	li $t2, 0x1
	sb $t2,($t1)
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
	
