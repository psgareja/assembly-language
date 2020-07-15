format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov dl,01001100b
	mov cl,1
	shr dl,cl
	shr dl,2
	shl dl,3
	push 0
	call [ExitProcess]






include 'training.inc'