#Verifca se el pajaro choco contra los obstaculos
#Para realziar la verificacion, toma en cuenta la columna mas proxima al pajaro solo cuando esta lo suficientemente
#	cerca para no hacer verificaciones innecesarias

.globl perdio
perdio:
		#-----PROLOGO-----#
		#Guardo $ra en sp para no perderlo
		addi $sp, $sp, -4
		sw $ra, ($sp)
		la $t1, coordenadaenY
		lb $t2, ($t1)
		bge $t2, 53, perdioLaPartida
		la $t1, column_coord #Vector que tiene 3 posicions de columna
		la $t0, img #Cargo la imagen
		lb $t2, ($t1) #En t2 tengo la parte derecha de la primer Col
		move $t4, $zero #CONTADOR DE FILAS
		blt $t2, 20, Sobrevivio
		bge $t2, 39, Sobrevivio
		mul $t2, $t2, 4
		addu $t8, $t0, $t2 #Se lo sumo a la imagen y lo asigno a t8
		sub $t8, $t8, 40 #Le resto 40 posiciones para estar en la parte izq
		move $t9, $zero #Contador del medio
		##Si mi posicion en x de la columna SUPERIOR
		##Toca con un blanco PERDIO
		#Columna de arriba
		la $t5, column_heigh #Tiene la altura de la columna sup
		lb $t3, ($t5)
		RepetirBusqueda: #Entro en un loop
		beq $t4, $t3, TodaviaSigueConVida
		lw $t2, ($t8)
		bne $t2, 0, perdioLaPartida #Si no es 0, osea no es negro perdio
		addi $t8, $t8, 512 #Si es negro que sume 512
		addi $t4, $t4, 1 #Que sume uno al contador hasta $t3
		j RepetirBusqueda	
		
		TodaviaSigueConVida:
		#addi $t8, $t8, 512
		addi $t8, $t8, 4
		
		bordeinterno:	
		beq $t9, 9, sigueViviendo
		addi $t8, $t8, 4
		lw $t2, ($t8)
		bne $t2, 0, perdioLaPartida
		addi $t9, $t9, 1 
		j bordeinterno
		
		sigueViviendo:	
		sub $t8, $t8,40 
		
		j TodaviaSigueConVida2
		
		##Si mi posicion en x de la columna INFERIOR
		##Toca con un blanco PERDIO
		#Columna de abajo
		TodaviaSigueConVida2:
		addi $t3, $t3, 20 #Sumo 20 que es la distancia	
		move $t4, $zero	
		move $t9, $zero #Es para el borde 
		addu $t4, $t4, $t3 #t4 es la altura mas la diferencia
		li $t7, 9728 #512x19=10752
		addu $t8, $t8, $t7
		addi $t8, $t8, 4		
		
		RecorroBorde:
		beq $t9, 9, retrocedo
		addi $t8, $t8, 4
		lw $t2, ($t8)
		bne $t2, 0, perdioLaPartida
		addi $t9, $t9, 1
		j RecorroBorde
		
		retrocedo: 
		
		sub $t8, $t8, 40
		
		
		addi $t8, $t8, 512
		j RepBusqueda
		
		RepBusqueda:
		beq $t4, 63, Sobrevivio
		lw $t2, ($t8)
		bne $t2, 0, perdioLaPartida
		addi $t8, $t8, 512
		addi $t4, $t4, 1
		j RepBusqueda

		
		
		
perdioLaPartida:



li $v0, 1
j terminarVerificacion
		                      
Sobrevivio:
li $v0, 0



terminarVerificacion:
#-----EPILOGO-----#
lw $ra , ($sp)
addi $sp, $sp, 4


jr $ra		
    	
    	 
    	
    	 
