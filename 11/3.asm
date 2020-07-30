format PE console
entry start
include 'win32a.inc'

struct PNT
	x dd ?
	y dd ?

ends

section '.bss' readable writeable
	my_pnt PNT ?

section '.text' code readable executable

start:
	mov dword[my_pnt.x],4
	mov dword[my_pnt.y],3

	push 0
	call [ExitProcess]




include 'training.inc'