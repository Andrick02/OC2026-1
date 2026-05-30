%include "../../lib/pc_io.inc"

section .data
    cadena times 64 db 0   ; Actualizado para 64 caracteres
    msg_cadena db  "Ingresa una cadena de caracteres: ",0
    msg1 db  "Cadena Mayusculas: " ,0
    msg2 db  "Cadena Minusculas: " ,0

section .text
    global _start

_start:

    mov edx, msg_cadena
    call puts

    mov ebx, cadena
    call gets

	mov al, 10     ; salto de línea
	call putchar

    mov edx, msg1
    call puts

    mov ebx, cadena
    call mayusculas
    mov edx, cadena
    call puts
    mov al, 10
    call putchar

    mov edx, msg2
    call puts

    mov ebx, cadena
    call minusculas
    mov edx, cadena
    call puts
    mov al, 10
    call putchar

    mov eax, 1
    mov ebx, 0
    int 0x80

gets:
    push ecx
    xor ecx, ecx

.capturar:
    call getch          ;Se cambio a getch 

    cmp al, 0x7f
    je .borrar
    cmp al, 0x08
    je .borrar

    cmp al, 10
    je .salir

    ; validar minusculas
    cmp al, 'a'
    jb .mayus
    cmp al, 'z'
    ja .capturar
    jmp .save

.mayus:
    ; validar mayusculas
    cmp al, 'A'
    jb .espace
    cmp al, 'Z'
    ja .capturar
    jmp .save

.espace:
    cmp al, 32
    jne .capturar

.save:
    call putchar                ;Se cambio para imprimir manual
    mov [ebx + ecx], al
    inc ecx
    cmp ecx, 63
    jne .capturar
    jmp .salir


.borrar:
    cmp ecx, 0
    je .capturar

    dec ecx

    ; borrar visualmente
    push eax
    mov al, 8
    call putchar
    mov al, ' '
    call putchar
    mov al, 8
    call putchar
    pop eax

    jmp .capturar


.salir:
    mov byte [ebx + ecx], 0
    pop ecx
    ret

mayusculas:
    push eax
    push ecx
    xor ecx, ecx

.next:
    mov al, [ebx + ecx]
    cmp al, 0
    je .salir

    cmp al, 'a'
    jb .save
    cmp al, 'z'
    ja .next

    sub al, 32

.save:
    mov [ebx + ecx], al
    inc ecx
    jmp .next

.salir:
    pop ecx
    pop eax
    ret


minusculas:
    push eax
    push ecx
    xor ecx, ecx

.next1:
    mov al, [ebx + ecx]
    cmp al, 0
    je .salir1

    cmp al, 'A'
    jb .save1
    cmp al, 'Z'
    ja .next1

    add al, 32

.save1:
    mov [ebx + ecx], al
    inc ecx
    jmp .next1

.salir1:
    pop ecx
    pop eax
    ret