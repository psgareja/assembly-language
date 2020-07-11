format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	call read_hex
	inc eax
	call print_eax
	push 0
	call [ExitProcess]

include 'training.inc'
