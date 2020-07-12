format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,100h
looper:
	mov eax,ecx
	call print_eax
	add ecx,8h
	cmp ecx ,130h
	jz	change_ecx_1
go_back:
	cmp ecx,160h
	jb	looper
	jmp	exit_process
change_ecx_1:
	inc ecx
	jmp go_back
exit_process:



	push 0
	call [ExitProcess]




include 'training.inc'