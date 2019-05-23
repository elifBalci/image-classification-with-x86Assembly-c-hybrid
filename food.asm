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
	mov	eax , DWORD [ebp+8]	;address of *a to eax
	movsw ebx, eax

	;mov	eax, 0			;return 0
	pop	ebp
	ret

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
