format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,100h

while_loop:
	mov eax,ecx
	call print_eax
	add ecx,8h
	cmp ecx,130h
	jnz end_if
	inc ecx
end_if:
	cmp ecx,160h
	jb while_loop


	push 0
	call [ExitProcess]




include 'training.inc'