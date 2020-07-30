format PE console
entry start
include 'win32a.inc'
struct PNT
	x dd ?
	y dd ?

ends 

struct CLINE
	color dd ?
	p_start PNT ?
	p_end PNT ?
ends

section '.data' data readable writeable
	my_line CLINE 0,<3,4>,<1,5>

section '.text' code readable executable

start:
	mov eax,dword [my_line.color]
	call print_eax
	mov eax,dword [my_line.p_start.x]
	call print_eax
	mov eax,dword [my_line.p_end.y]
	call print_eax

	push 0
	call [ExitProcess]




include 'training.inc'