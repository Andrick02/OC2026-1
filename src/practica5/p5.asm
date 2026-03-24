%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:         

	

	mov edx, msg2		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

	mov edx, msg1
	call puts

	    mov edx, msg3
    call puts

    
             
    mov ebx, msg1    
    mov byte[ebx+1], 'z'

	mov edx, ebx
	call puts 



	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
    msg1	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 
	msg2	db  'Cadena antes de modificar: ',0
	msg3    db	'Cadena modificada: ', 0



