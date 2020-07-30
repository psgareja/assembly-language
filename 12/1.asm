format PE console
entry start
include 'win32a.inc'
include 'encoding/utf8.inc'



section '.data' data readable writeable
	my_str du '# #',0
section '.text' code readable executable
	


start:

	

	push 0
	call [ExitProcess]




include 'training.inc'