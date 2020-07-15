format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov edx,0
	mov ecx,32d

sub_bits:
	mov ebx,eax
	and ebx,1
	add edx,ebx
	ror eax,1
	loop sub_bits
	
	push 0
	call [ExitProcess]




include 'training.inc'