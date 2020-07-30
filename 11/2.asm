format PE console
entry start
include 'win32a.inc'
section '.bss' readable writeable
	p1x dd ?
	p1y dd ?

	p2x dd ?
	p2y dd ?

section '.text' code readable executable

start:
	mov dword[p1x],4
	mov dword[p2y],3
	mov dword[p2x],5
	mov dword[p2y],1

	push 0
	call [ExitProcess]




include 'training.inc'