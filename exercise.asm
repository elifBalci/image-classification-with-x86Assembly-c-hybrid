;=====================================================================
; Image Classification with x86 assembly 
;
; Author:      Elif Balcı
; Date:        2019-05-23
; 
;
;=====================================================================

section	.text
extern printf
global  func
	
func:
	push ebp
	mov	ebp, esp
	
	mov eax , DWORD [ebp+8]
	mov cl, [eax]
	;call print_ecx

	mov ecx,  10
	;_________________________________________________________________
l1:
	push ecx
	push edx
	mov eax , DWORD [ebp+8]
	mov dl, [eax]
	call print_edx

	
	sub ecx, 1
	pop ecx
	pop edx
	loop l1
;_________________________________________________________________



	pop	ebp
	ret


print_edx:
	push edx				;|print ecx 
	push DWORD format		;|
	call printf				;|
	add esp, 8				;|
	ret

print_ebx:
	push ebx				;|print ecx 
	push DWORD format2		;|
	call printf				;|
	add esp, 8				;|
	ret



print_ecx:
	push ecx				;|print ecx 
	push DWORD format2		;|
	call printf				;|
	add esp, 8				;|
	ret

section .data
	values:	TIMES	255			DB		0	
	format:    db "** a=%d\ **", 00ah, 0
	format2:    db "d* a=%d\ *d", 00ah 
;============================================
; THE STACK
;============================================
;
; larger addresses
; 
;  |                               |
;  | ...                           |
;  ---------------------------------
;  | function parameter - char *a  | EBP+8
;  ---------------------------------
;  | return address                | EBP+4
;  ---------------------------------
;  | saved ebp                     | EBP, ESP
;  ---------------------------------
;  | ... here local variables      | EBP-x
;  |     when needed               |
;
; \/                              \/
; \/ the stack grows in this      \/
; \/ direction                    \/
;
; lower addresses
;
;
;============================================
