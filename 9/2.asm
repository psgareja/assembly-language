format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov edx,0
	mov ecx,32d

count_bits:
	ror eax,1
	jnc bit_is_zero
	inc edx

bit_is_zero:
	loop count_bits

	push 0
	call [ExitProcess]




include 'training.inc'