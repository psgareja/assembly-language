	.model tiny
	.code

	ORG 100h
HOST:
	mov ah,9
	mov dx,OFFSET HI
	int 21h

	mov ax,4C00H
	int 21H

HI DB	'You have just realease a virus! have a nice dat!$'

END HOST
