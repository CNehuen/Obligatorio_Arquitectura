#Obligatorio Sistemas Digitales y Microcontroladores
#Agustin Abo - 193196
#Nehuen Carol - 225459

#Version Desktop
#Archivo principal que reserva los espacios en memoria necesarios. Es por donde comienza la ejecucion del sistema
.globl main
.globl img
.globl Int8x8 
.globl bird8x8
.globl font8x8
.globl column_coord
.globl column_heigh
.globl pseudorandom_values
.globl limpiarPajaro
.globl limpiarAuto
.globl coordenadaenY
.globl scores
.globl your_score
.globl car16x12
.globl car16x12Inv
.globl matriz_posiciones_autos
.globl coordenadaenYauto
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
column_coord: .space 3  #coordenadas en x de cada una de las columnas. la 3ra coordenada es un auxiliar
column_heigh: .space 3 #corrdenadas en y de los espacios de las columnas. la 3ra posicion es para la columna que se crea mientas se borra la de las a  la izq
pseudorandom_values: .space 13 #13 valores que simulan aleatoriedad y un indice de seleccion:[0]-> indice; [1 -12]->numero 
coordenadaenY: .space 2 
limpiarPajaro: .asciiz " "
limpiarAuto: .asciiz "  "
.align 2
scores: .space 4
your_score: .asciiz "TU PUNTAJE"
.align 1
car16x12: .space 24
.align 1
car16x12Inv: .space 24
matriz_posiciones_autos: .space 12
coordenadaenYauto: .space 1
.text
main:
	li $a0, 0
	jal clean_screen
	jal menu #menu de seleccion de juego
	move $a0, $v0	
	jal menu_de_juego
	j main
