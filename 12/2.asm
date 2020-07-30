format PE console
entry start
include 'win32a.inc'


ARR_LEN=12

section '.data' data readable writeable
	my_arr dd ARR_LEN dup(?)
	


start:
	mov esi,my_arr
	mov ecx,ARR_LEN
	xor edx,edx

next_element:
	lodsd
	add	edx,eax
	loop next_element
	

	

	push 0
	call [ExitProcess]




include 'training.inc'