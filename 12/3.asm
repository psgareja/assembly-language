format PE console
entry start
include 'win32a.inc'


ARR_LEN=12

section '.data' data readable writeable
	my_arr dd ARR_LEN dup(?)
	


start:
	mov esi,my_arr
	mov ecx,ARR_LEN
	xor al,al


	jecxz finish

next_element:
	stosb
	add	edx,eax
	loop next_element
finish:

	

	push 0
	call [ExitProcess]




include 'training.inc'