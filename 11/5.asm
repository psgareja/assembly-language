format PE console
entry start
include 'win32a.inc'

struct PNT3
	x dd ?
	y dd ?
	z dd ?

ends

section '.data' data readable writeable
	my_pnt PNT3 3,4,5
	end_pnt:

section '.text' code readable executable

start:
	mov eax,sizeof.PNT3
	call print_eax
	mov eax,end_pnt-my_pnt
	call print_eax

	push 0
	call [ExitProcess]




include 'training.inc'