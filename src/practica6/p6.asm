%include "../../lib/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
	
_start:         
	
	mov edx, cadena
	call puts

	mov ebx, cadena ; mueves direccion de cadena a ebx

	gets:
	
	.capturar:
		call getche		      ;captura un caractere en al
			mov byte[ebx], al ; caracter lo mueves a registro base
		inc ebx				  ; incremento la posicion en ebx para capturar nuevamente
	cmp al,10	; compara si al contiene caracter ENTER en ASCCI
	jne .capturar	; sino es enter salta a capturar de nuevo
	mov byte [ebx],0 ; ingreso caracter nulo

	mov edx, msg_cadena	;imprimir mensaje
	call puts
	
	mov edx, msg1	; imprimir cadena
	call puts

 	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	mov ebx, 0
	int	0x80        	; llamada al sistema - fin de programa

section	.data
	cadena db 0

	msg_cadena db  "Ingresa una cadena de caracteres",10,0
	msg1 db  "Cadena ingresada: " ,10,0