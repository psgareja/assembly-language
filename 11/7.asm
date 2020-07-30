format PE console
entry start
include 'win32a.inc'
struct IPV4
	union
		struct 
			a dd ?
			b dd ?
			c dd ?
			d dd ?
		ends
		addr dd ?
	ends

ends
section '.data'data readable writeable
	lhost IPV4 <127,0,0,1>
section '.text' code readable executable
start:
	mov eax,dword [lhost.addr]
	mov eax,dword [lhost]
	mov bl,byte [lhost.d]
	mov bl, byte [lhost+3]


	


	push 0
	call [ExitProcess]




include 'training.inc'