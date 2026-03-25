%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:         
	mov edx, msg1		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

	mov edx, cadena
	call puts

	    mov edx, msg2
    call puts

	;Direccionamiento directo       
	mov byte [cadena], 'Z'
	mov edx, cadena
	call puts

	mov edx, newline
	call puts
	mov edx, msg2
    call puts

	;Direccionamiento indirecto
	mov ebx, cadena ;Se manda el contenido al registro
	add ebx, 23
	mov byte [ebx], 'X'
	mov edx, cadena ;Se mueve el registro a cadena
	call puts

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	mov ebx, 0
	int	0x80        	; llamada al sistema - fin de programa

section	.data
    cadena	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 
	msg1	db  'Cadena antes de modificar: ',0
	msg2    db	'Cadena modificada: ', 0
	newline db 10,0


