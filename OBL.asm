.data 
img: .space 128 #32rectangulos de 16x16 (1word x rectangulo) cada uno de los 3 colores 
	                                   # (1 bye x cada uno de los 3 colores y 1 lo tira)
.text

#addi $t0, $t0, 32            #Cambia colores de rectangulo, segun byte (azul, verde,rojo)
#addi $t1, $t1, 0x00ffffff  
li $a0, 5
li $a1, 1
li $a2, 2
li $a3, 0x00ff0ff0

jal RectanguloVertical


li $v0 10
 
                                         
                                                                                                                             
RectanguloVertical:   #Funcion (x,y, cantidad rectangulos, color)
	#$a0 -> posicion en x
	#$a1 -> posicion en y
	#$a2 -> cantidad de rectangulos a pintar
	#$a3 -> color
	la $t0, img
	addu $t3,$t0,128
	li $t4, 8
	li $t5,4 										#rectangulos de ancho de la imagen
	multu $a1,$t4 									#calculo la posicion del rectangulo de posicion (x,y) en la memoria
	mflo $t1
	addu $t1,$t1,$a0
	multu $t1, $t5
	mflo $t1
	addu $t0, $t0,$t1								#accedo a la posicion de memoria correspondiente al rectangulo a pintar
	pintar_rectangulos:
		beqz $a2, salir_funcion_rectangulos			#si no hay rectangulos para pintar, salgo
		bgt $t0,$t3,salir_funcion_rectangulos		#si trata pintar por fuera de la imagen, salgo
		sw $a3, ($t0)								#pinto el rectangulo
		addiu $a2,$a2,-1							
		addiu $t0,$t0,32								#accedo al siguiente rectangulo a pintar
	j pintar_rectangulos
	salir_funcion_rectangulos:
	jr $ra

 










