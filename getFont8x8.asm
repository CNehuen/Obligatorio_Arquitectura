#Funcion que devuelve en el registro font8x8 la codificacion de los pixeles para cada uno de los caracteres definidos

.globl getFont8x8
getFont8x8: 
	#a0 -> char que debe devolver en formato font8x8 para dibujar en el display
	la $t0, font8x8
	beq $a0, ' ', devuelvoEspacio
	beq $a0, 'A', devuelvoA
	beq $a0, 'B', devuelvoB
	beq $a0, 'C', devuelvoC
	beq $a0, 'D', devuelvoD
	beq $a0, 'E', devuelvoE
	beq $a0, 'F', devuelvoF
	beq $a0, 'G', devuelvoG
	beq $a0, 'H', devuelvoH
	beq $a0, 'I', devuelvoI
	beq $a0, 'J', devuelvoJ
	beq $a0, 'K', devuelvoK
	beq $a0, 'L', devuelvoL
	beq $a0, 'M', devuelvoM
	beq $a0, 'N', devuelvoN
	beq $a0, 'O', devuelvoO
	beq $a0, 'P', devuelvoP
	beq $a0, 'Q', devuelvoQ
	beq $a0, 'R', devuelvoR
	beq $a0, 'S', devuelvoS
	beq $a0, 'T', devuelvoT
	beq $a0, 'U', devuelvoU
	beq $a0, 'V', devuelvoV
	beq $a0, 'W', devuelvoW
	beq $a0, 'X', devuelvoX
	beq $a0, 'Y', devuelvoY
	beq $a0, 'Z', devuelvoZ
	beq $a0, ':', devuelvoDosPuntos
	beq $a0, '0', devuelvo0
	beq $a0, '1', devuelvo1
	beq $a0, '2', devuelvo2
	beq $a0, '3', devuelvo3
	beq $a0, '4', devuelvo4
	beq $a0, '5', devuelvo5
	beq $a0, '6', devuelvo6
	beq $a0, '7', devuelvo7
	beq $a0, '8', devuelvo8
	beq $a0, '9', devuelvo9
	beq $a0, 'p', devuelvoPajaro
	j fin 

devuelvoEspacio:	
	#{0x0C, 0x1E, 0x33, 0x33, 0x3F, 0x33, 0x33, 0x00} 
      li $t1, 0x00 
      sb $t1 , ($t0)
      li $t1, 0x00 
      sb $t1 , 1($t0)
      li $t1, 0x00
      sb $t1 , 2($t0)
      li $t1, 0x00 
      sb $t1 , 3($t0)
      li $t1, 0x00 
      sb $t1 , 4($t0)
      li $t1, 0x00 
      sb $t1 , 5($t0)
      li $t1, 0x00 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoA:	
	#{0x0C, 0x1E, 0x33, 0x33, 0x3F, 0x33, 0x33, 0x00} 
      li $t1, 0x0C 
      sb $t1 , ($t0)
      li $t1, 0x1E 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x33 
      sb $t1 , 3($t0)
      li $t1, 0x3F 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x33 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
         
devuelvoB:
      li $t1, 0x3F 
      sb $t1 , ($t0)
      li $t1, 0x66 
      sb $t1 , 1($t0)
      li $t1, 0x66
      sb $t1 , 2($t0)
      li $t1, 0x3E
      sb $t1 , 3($t0)
      li $t1, 0x66
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x3F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 

devuelvoC:
      li $t1, 0x3C
      sb $t1 , ($t0)
      li $t1, 0x66 
      sb $t1 , 1($t0)
      li $t1, 0x03
      sb $t1 , 2($t0)
      li $t1, 0x03 
      sb $t1 , 3($t0)
      li $t1, 0x03 
      sb $t1 , 4($t0)
      li $t1, 0x66
      sb $t1 , 5($t0)
      li $t1, 0x3C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)      
      j fin 
      
devuelvoD:
  	  li $t1, 0x1F 
      sb $t1 , ($t0)
      li $t1, 0x36
      sb $t1 , 1($t0)
      li $t1, 0x66
      sb $t1 , 2($t0)
      li $t1, 0x66 
      sb $t1 , 3($t0)
      li $t1, 0x66 
      sb $t1 , 4($t0)
      li $t1, 0x36
      sb $t1 , 5($t0)
      li $t1, 0x1F
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoE:
      li $t1, 0x7F
      sb $t1 , ($t0)
      li $t1, 0x46
      sb $t1 , 1($t0)
      li $t1, 0x16
      sb $t1 , 2($t0)
      li $t1, 0x1E 
      sb $t1 , 3($t0)
      li $t1, 0x16
      sb $t1 , 4($t0)
      li $t1, 0x46
      sb $t1 , 5($t0)
      li $t1, 0x7F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)      
      j fin 

devuelvoF:
      li $t1, 0x7F
      sb $t1 , ($t0)
      li $t1, 0x46 
      sb $t1 , 1($t0)
      li $t1, 0x16
      sb $t1 , 2($t0)
      li $t1, 0x1E
      sb $t1 , 3($t0)
      li $t1, 0x16
      sb $t1 , 4($t0)
      li $t1, 0x06		
      sb $t1 , 5($t0)
      li $t1, 0x0F
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoG:	
      li $t1, 0x3C 
      sb $t1 , ($t0)
      li $t1, 0x66
      sb $t1 , 1($t0)
      li $t1, 0x03
      sb $t1 , 2($t0)
      li $t1, 0x03 
      sb $t1 , 3($t0)
      li $t1, 0x73 
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x7C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)      
      j fin 

devuelvoH:
      li $t1, 0x33 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x3F 
      sb $t1 , 3($t0)
      li $t1, 0x33 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x33 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)      
      j fin 

devuelvoI:
      li $t1, 0x1E
      sb $t1 , ($t0)
      li $t1, 0x0C 
      sb $t1 , 1($t0)
      li $t1, 0x0C
      sb $t1 , 2($t0)
      li $t1, 0x0C 
      sb $t1 , 3($t0)
      li $t1, 0x0C 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 

devuelvoJ:
      li $t1, 0x78 
      sb $t1 , ($t0)
      li $t1, 0x30 
      sb $t1 , 1($t0)
      li $t1, 0x30 
      sb $t1 , 2($t0)
      li $t1, 0x30  
      sb $t1 , 3($t0)
      li $t1, 0x33 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 

devuelvoK:
      li $t1, 0x67 
      sb $t1 , ($t0)
      li $t1, 0x66 
      sb $t1 , 1($t0)
      li $t1, 0x36
      sb $t1 , 2($t0)
      li $t1, 0x1E 
      sb $t1 , 3($t0)
      li $t1, 0x36 
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x67 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoL:
      li $t1, 0x0F 
      sb $t1 , ($t0)
      li $t1, 0x06
      sb $t1 , 1($t0)
      li $t1, 0x06
      sb $t1 , 2($t0)
      li $t1, 0x06 
      sb $t1 , 3($t0)
      li $t1, 0x46 
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x7F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoM:	
      li $t1, 0x63
      sb $t1 , ($t0)
      li $t1, 0x77 
      sb $t1 , 1($t0)
      li $t1, 0x7F
      sb $t1 , 2($t0)
      li $t1, 0x7F 
      sb $t1 , 3($t0)
      li $t1, 0x6B 
      sb $t1 , 4($t0)
      li $t1, 0x63 
      sb $t1 , 5($t0)
      li $t1, 0x63 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoN:
      li $t1, 0x63 
      sb $t1 , ($t0)
      li $t1, 0x67 
      sb $t1 , 1($t0)
      li $t1, 0x6F
      sb $t1 , 2($t0)
      li $t1, 0x7B 
      sb $t1 , 3($t0)
      li $t1, 0x73
      sb $t1 , 4($t0)
      li $t1, 0x63 
      sb $t1 , 5($t0)
      li $t1, 0x63 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoO:
      li $t1, 0x1C 
      sb $t1 , ($t0)
      li $t1, 0x36 
      sb $t1 , 1($t0)
      li $t1, 0x63
      sb $t1 , 2($t0)
      li $t1, 0x63 
      sb $t1 , 3($t0)
      li $t1, 0x63 
      sb $t1 , 4($t0)
      li $t1, 0x36 
      sb $t1 , 5($t0)
      li $t1, 0x1C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoP:
      li $t1, 0x3F 
      sb $t1 , ($t0)
      li $t1, 0x66
      sb $t1 , 1($t0)
      li $t1, 0x66
      sb $t1 , 2($t0)
      li $t1, 0x3E 
      sb $t1 , 3($t0)
      li $t1, 0x06 
      sb $t1 , 4($t0)
      li $t1, 0x06 
      sb $t1 , 5($t0)
      li $t1, 0x0F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoQ:
      li $t1, 0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x33 
      sb $t1 , 3($t0)
      li $t1, 0x3B 
      sb $t1 , 4($t0)
      li $t1, 0x1E
      sb $t1 , 5($t0)
      li $t1, 0x38 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoR:
      li $t1, 0x3F
      sb $t1 , ($t0)
      li $t1, 0x66 
      sb $t1 , 1($t0)
      li $t1, 0x66
      sb $t1 , 2($t0)
      li $t1, 0x3E 
      sb $t1 , 3($t0)
      li $t1, 0x36 
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x67 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoS:	
      li $t1, 0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x07
      sb $t1 , 2($t0)
      li $t1, 0x0E 
      sb $t1 , 3($t0)
      li $t1, 0x38 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoT:
      li $t1, 0x3F 
      sb $t1 , ($t0)
      li $t1, 0x2D 
      sb $t1 , 1($t0)
      li $t1, 0x0C
      sb $t1 , 2($t0)
      li $t1, 0x0C 
      sb $t1 , 3($t0)
      li $t1, 0x0C 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoU:
      li $t1, 0x33 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x33 
      sb $t1 , 3($t0)
      li $t1, 0x33 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x3F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoV:
      li $t1, 0x33 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x33 
      sb $t1 , 3($t0)
      li $t1, 0x3F 
      sb $t1 , 4($t0)
      li $t1, 0x1E 
      sb $t1 , 5($t0)
      li $t1, 0x0C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoW:
      li $t1, 0x63 
      sb $t1 , ($t0)
      li $t1, 0x63 
      sb $t1 , 1($t0)
      li $t1, 0x63
      sb $t1 , 2($t0)
      li $t1, 0x6B 
      sb $t1 , 3($t0)
      li $t1, 0x7F 
      sb $t1 , 4($t0)
      li $t1, 0x77 
      sb $t1 , 5($t0)
      li $t1, 0x63 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoX:
      li $t1, 0x63 
      sb $t1 , ($t0)
      li $t1, 0x63 
      sb $t1 , 1($t0)
      li $t1, 0x36
      sb $t1 , 2($t0)
      li $t1, 0x1C 
      sb $t1 , 3($t0)
      li $t1, 0x1C 
      sb $t1 , 4($t0)
      li $t1, 0x36 
      sb $t1 , 5($t0)
      li $t1, 0x63 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoY:	
      li $t1, 0x33 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x1E 
      sb $t1 , 3($t0)
      li $t1, 0x0C 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoZ:
      li $t1, 0x7F 
      sb $t1 , ($t0)
      li $t1, 0x63 
      sb $t1 , 1($t0)
      li $t1, 0x31
      sb $t1 , 2($t0)
      li $t1, 0x18 
      sb $t1 , 3($t0)
      li $t1, 0x4C 
      sb $t1 , 4($t0)
      li $t1, 0x66 
      sb $t1 , 5($t0)
      li $t1, 0x7F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvoDosPuntos:
      li $t1, 0x00 
      sb $t1 , ($t0)
      li $t1, 0x0C 
      sb $t1 , 1($t0)
      li $t1, 0x0C
      sb $t1 , 2($t0)
      li $t1, 0x00 
      sb $t1 , 3($t0)
      li $t1, 0x00 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x0C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo0:
      li $t1, 0x3E 
      sb $t1 , ($t0)
      li $t1, 0x63 
      sb $t1 , 1($t0)
      li $t1, 0x73
      sb $t1 , 2($t0)
      li $t1, 0x7B 
      sb $t1 , 3($t0)
      li $t1, 0x6F 
      sb $t1 , 4($t0)
      li $t1, 0x67 
      sb $t1 , 5($t0)
      li $t1, 0x3E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo1:
      li $t1, 0x0C 
      sb $t1 , ($t0)
      li $t1, 0x0E 
      sb $t1 , 1($t0)
      li $t1, 0x0C
      sb $t1 , 2($t0)
      li $t1, 0x0C 
      sb $t1 , 3($t0)
      li $t1, 0x0C 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x3F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo2:
      li $t1, 0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x30
      sb $t1 , 2($t0)
      li $t1, 0x1C 
      sb $t1 , 3($t0)
      li $t1, 0x06 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x3F 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo3:	
      li $t1, 0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x30
      sb $t1 , 2($t0)
      li $t1, 0x1C 
      sb $t1 , 3($t0)
      li $t1, 0x30 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo4:
      li $t1, 0x38 
      sb $t1 , ($t0)
      li $t1, 0x3C 
      sb $t1 , 1($t0)
      li $t1, 0x36
      sb $t1 , 2($t0)
      li $t1, 0x33 
      sb $t1 , 3($t0)
      li $t1, 0x7F 
      sb $t1 , 4($t0)
      li $t1, 0x30 
      sb $t1 , 5($t0)
      li $t1, 0x78 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo5:
      li $t1, 0x3F 
      sb $t1 , ($t0)
      li $t1, 0x03 
      sb $t1 , 1($t0)
      li $t1, 0x1F
      sb $t1 , 2($t0)
      li $t1, 0x30 
      sb $t1 , 3($t0)
      li $t1, 0x30 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 

devuelvo6:
      li $t1, 0x1C 
      sb $t1 , ($t0)
      li $t1, 0x06 
      sb $t1 , 1($t0)
      li $t1, 0x03
      sb $t1 , 2($t0)
      li $t1, 0x1F 
      sb $t1 , 3($t0)
      li $t1, 0x33 
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)      
      j fin 
      
devuelvo7:
      li $t1, 0x3F 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x30
      sb $t1 , 2($t0)
      li $t1, 0x18 
      sb $t1 , 3($t0)
      li $t1, 0x0C 
      sb $t1 , 4($t0)
      li $t1, 0x0C 
      sb $t1 , 5($t0)
      li $t1, 0x0C 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo8:
      li $t1,  0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x1E 
      sb $t1 , 3($t0)
      li $t1, 0x33
      sb $t1 , 4($t0)
      li $t1, 0x33 
      sb $t1 , 5($t0)
      li $t1, 0x1E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 
      
devuelvo9:	
      li $t1, 0x1E 
      sb $t1 , ($t0)
      li $t1, 0x33 
      sb $t1 , 1($t0)
      li $t1, 0x33
      sb $t1 , 2($t0)
      li $t1, 0x3E 
      sb $t1 , 3($t0)
      li $t1, 0x30 
      sb $t1 , 4($t0)
      li $t1, 0x18 
      sb $t1 , 5($t0)
      li $t1, 0x0E 
      sb $t1 , 6($t0)
      li $t1, 0x00 
      sb $t1 , 7($t0)
      j fin 

devuelvoPajaro: 	li $t1, 0x38     # 0 0 1 1 1 0 0 0
      				sb $t1 , ($t0)
      				li $t1, 0x46 
      				sb $t1 , 1($t0)
      				li $t1, 0xA1
      				sb $t1 , 2($t0)
      				li $t1, 0xA1 
      				sb $t1 , 3($t0)
      				li $t1, 0x81 
      				sb $t1 , 4($t0)
      				li $t1, 0x72 
      				sb $t1 , 5($t0)
      				li $t1, 0x0A     
      				sb $t1 , 6($t0)
      				li $t1, 0x00      
      				sb $t1 , 7($t0)
      j fin


	  fin:
      jr $ra 
  
