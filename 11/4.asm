format PE console
entry start
include 'win32a.inc'
struct PNT
	x dd ?
	y dd ?
ends

section '.data' data readable writeable
	my_pnt PNT 3,4
section '.text' code readable executable

start:
	mov eax,dword [my_pnt.y]
	call print_eax
	mov eax,dword [my_pnt+PNT.y]
	call print_eax
	;ov call eax,dword [my_pnt + 4]
	;all print_eax
	push 0
	call [ExitProcess]




include 'training.inc'