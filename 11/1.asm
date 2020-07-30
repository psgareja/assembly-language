format PE console
entry start
include 'win32a.inc'
section '.bss' readable writeable
	px dd ?
	py dd ?
section '.text' code readable executable

start:
	mov dword[px],4
	mov dword[py],3

	push 0
	call [ExitProcess]




include 'training.inc'