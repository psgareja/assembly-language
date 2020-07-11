format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,0
my_label:
	inc ecx
	jmp my_label
	call print_eax


	push 0
	call [ExitProcess]




include 'training.inc'