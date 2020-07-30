format PE console
entry start
include 'win32a.inc'
struct DOG
	color dd ?
	age dd ?
ends

NUM_DOGS=12
section '.bss' readable writeable
	my_dogs db NUM_DOGS*sizeof.DOG dup(0)

section '.text' code readable executable

start:
	mov esi,my_dogs
	lea esi,[esi+ecx*sizeof.DOG]
	mov eax,dword[esi+DOG.color]
	call print_eax
	mov edx,dword[esi+DOG.age]
	call print_eax
	push 0
	call [ExitProcess]




include 'training.inc'