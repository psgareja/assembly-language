format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,0
	mov eax,0
for_loop:
	add eax,ecx
	cmp eax,1000
	jae end_for
	inc ecx
	cmp ecx,300
	jb for_loop
	call print_eax
	

end_for:
	push 0
	call [ExitProcess]




include 'training.inc'