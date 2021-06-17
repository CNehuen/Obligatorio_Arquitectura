.globl menu
.data
MenuPrincipal: .asciiz "MENU PRINCIPAL"
StringOtroJuego: .asciiz "OTRO JUEGO"
StringFlappy: .asciiz "FLAPPY BIRD"
MenuJuego1: .asciiz "NUEVO JUEGO"
MenuJuego2: .asciiz "SALIR"
.eqv control 0xFFFF0000
.eqv data 0xFFFF0004
.text
menu:
	#$a0 -> selector de manu para mostrar
	#0 -> Menu principal de seleccion de juego
	#1-> Menu de juego
	
	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	beqz $a0, menu_principal
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
		li $t9,2  #Cantidad de strings seleccionables
		move $t8, $zero
		j subrayar_string
		
	menu_principal:
		la $a0, MenuPrincipal
		li $a1, 2
		li $a2, 2
		jal dibujarString
		la $a0, StringFlappy
		li $a1, 2
		li $a2, 22
		jal dibujarString
		la $a0, StringOtroJuego
		li $a1, 2
		li $a2, 32
		jal dibujarString
		li $t9,2  #Cantidad de strings seleccionables
		move $t8, $zero
	
	subrayar_string:
		mulu $a1, $t8, 10 	
		addiu $a1, $a1, 30
		li $a0, 2
		li $a2, 0x00ffffff
		jal dibujar_subrayar #subrayo el primer item
		#subi $t8, $t8, 1
		loop_seleccion_menu:
			la $t1, control
			lw $t2, ($t1)
			andi $t2 , $t2, 0x01
			beqz $t2, loop_seleccion_menu
			la $t1, data  
			lw $t2, ($t1) #0x00 00 00 00			
			beq $t2, '\n', boton_enter
			bne $t2, 's', loop_seleccion_menu
			mulu $a1, $t8, 10  
			addiu $a1, $a1, 30
			li $a0, 2
			li $a2, 0x00000000
			jal dibujar_subrayar #borro el subraye anterior
			addiu $t8, $t8, 1
			beq $t8, $t9, renuevo_t8
			sigo_subrayar:
			#calculo posicion Y de la linea a subrayar : y= 22(pos iniical del primer string) + t8*deltah(separacion entre strings) + 8(altura del string)
			mulu $a1, $t8, 10  
			addiu $a1, $a1, 30
			li $a0, 2
			li $a2, 0x00ffffff
			jal dibujar_subrayar #subrayo el item de menu actual
			j loop_seleccion_menu
			renuevo_t8:
				move $t8, $zero
				j sigo_subrayar
			
		boton_enter:
			move $v0, $t8
		
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra


	

	
dibujar_subrayar:
	#Funcion que pinta rectangulos horizaontalmente desde la pisicion (x,y), hasta el maximo de caracteres (14)
	#Parametros:
	#$a0 -> posicion en x
	#$a1 -> posicion en y
	#$a2 -> color
	la $t0, img
	addu $t3,$t0,32768
	mulu $t1,$a1,128 							#calculo la posicion del rectangulo de posicion (x,y) en la memoria
	addu $t1,$t1,$a0
	mulu $t1, $t1, 4
	addu $t0, $t0,$t1							#accedo a la posicion de memoria correspondiente al rectangulo a pintar
	
	li $t2, 112
	li $t1,2
	loop_subrayar:
		beqz $t2, salir_subrayar
		sw $a2, ($t0)								#pinto el rectangulo
		subi $t2,$t2,1
		addiu $t0,$t0,4
		j loop_subrayar
	salir_subrayar:	
	subi $t1, $t1,1
	li $t2, 112
	addiu $t0, $t0, 64  #avanzo para quedar al principio del subrayar, 1 pixel debajo
	beq $t1, 1, loop_subrayar
	jr $ra	
