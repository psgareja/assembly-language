format PE console
entry start
include 'win32a.inc'
section '.data' readable writeable
	my_words dd 3 dup(0)

section '.text' code readable executable

start:
	mov esi,my_words
	mov dword [esi],1
	inc esi
	mov dword [esi],2
	inc esi
	mov dword [esi],3

include 'training.inc'
