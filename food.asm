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

	mov eax, [values]

;_________________________________________________________________
	mov ecx, 255			;counter for the loop
initialize_array:			;make sure every element of array is equal to 0
	push ecx
	mov DWORD [values + ecx*4], 0
	mov eax, [values+ ecx*4]
	push eax				;|print
	push DWORD format3		;|
	;call printf			;|
	add esp, 8				;|
	pop ecx
	loop initialize_array
;_________________________________________________________________


	mov ecx, 12000			;loop counter, goes through every pixel.
	
;_________________________________________________________________
l1:							;prepares the histogram
	push ecx;				;for loop counter
	mov ebx , DWORD [ebp+8]	
	
	pop ecx
	mov edx, ecx
	
	
	add edx,edx 			;
	add edx, ecx 			;edx = 3*edx - 2 to access green values.
	sub edx, 2 				;
	
	push ecx
	mov al, [ebx + edx]		;al has the desired value.
	
	add DWORD [values + eax*4], 1

	push ebx
	push DWORD format
	;call printf
	add esp, 8

	pop ecx
	loop l1
;_________________________________________________________________
;_________________________________________________________________
	mov ecx, 255
	mov ebx, 0
find_max:					; finds the max value in the histogram.
	push ecx
	mov eax, [values+ ecx*4]

	cmp eax, ebx
	jl less
	mov ebx, eax

less:
	
	pop ecx
	loop find_max

;_________________________________________________________________
;_________________________________________________________________
	mov ecx, 255
find_mode:					
	push ecx
	mov eax, [values+ ecx*4]
	
	cmp eax, ebx
	je print_mode 


	pop ecx
	loop find_mode
;_________________________________________________________________
;_________________________________________________________________

	mov ecx, 255
print_array:
	push ecx
	mov eax, [values+ ecx*4]
	push eax				;|print
	push DWORD format3		;|
	;call printf				;|
	add esp, 8				;|
	pop ecx
	loop print_array
;_________________________________________________________________

	pop	ebp
	ret


print_mode:
	push ecx				;|print
	push DWORD format3		;|
	call printf				;|
	add esp, 8				;|




	pop ecx
	pop ebp
	ret


section .data
	values:		TIMES	1064			DB		0	
	format:		db "** a=%d\ **", 	00ah, 		0
	format2:    db "d* a=%d\ *d", 	00ah 
	format3:	db "&&& %d &&&&", 	00ah, 		0
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
