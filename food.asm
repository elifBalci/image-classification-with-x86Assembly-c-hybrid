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

	mov ecx,  40000
	
	;_________________________________________________________________
l1:
	push ecx
	;push edx
	;push ecx				;|print ecx 
	;push DWORD format		;|
	;call printf			;|
	;add esp, 8				;|

	mov eax , DWORD [ebp+8]

	;add eax, ecx
	
	pop ecx
	mov edx, ecx
	
	add edx,edx 	;
	add edx, ecx 	;edx = 3*edx - 2 to access green values.
	sub edx, 2 		;

	push ecx
	mov cl, [eax + edx]

	push ecx				;|print ecx 
	push DWORD format		;|
	call printf				;|
	add esp, 8				;|

	;sub ecx, 3 useless
	pop ecx
	;pop edx
	loop l1
;_________________________________________________________________


	pop	ebp
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
