format PE console
entry start
include 'win32a.inc'
section '.text' code readable executable
start:
	mov ecx,0
	mov eax,0
while_loop:
		cmp eax,1000d
		jae end_while
		add eax,ecx
		inc ecx
		call print_eax
		jmp while_loop
end_while:
		push 0
		call [ExitProcess]




include 'training.inc'