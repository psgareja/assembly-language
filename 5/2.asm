format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,0
for_loop:
	add eax,ecx
	inc ecx
	cmp ecx,100d
	call print_eax
	jnz for_loop

	push 0
	call [ExitProcess]




include 'training.inc'