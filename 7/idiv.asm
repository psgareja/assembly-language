format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov esi,3
	call read_hex
	cdq
	idiv esi
	call print_eax

	push 0
	call [ExitProcess]




include 'training.inc'