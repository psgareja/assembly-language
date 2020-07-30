format PE console
entry start
include 'win32a.inc'
section '.bss' readable writeable
	mul_tbl dd WIDTH*HEIGHT dup(0)
section '.text' code readable executable

start:
	mov esi,mul_tbl
	mov ecx,0

nex_row:
	mov ebx,0
next_column:
	mov ecx,eax
		mov ebx
		mov dword[esi],eax
		add esi,4
		inc ebx
		cmp ebx,WIDTH
		jnz next_column
		inc ecx
		cmp ecx,HEIGHT
		jnz bext_row
		
include 'training.inc'