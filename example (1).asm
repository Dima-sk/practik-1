org 7C00h

jmp start

fio: db 'Francev Dmitriy Alexandrovich',0
group: db 'NMT-323901',0

start:
;set video mode
mov ah, 00h
mov al, 13h
int 10h


mov si, fio
mov dl, 6
mov dh, 0
loop1:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next1
mov bl, 0Ch
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop1
next1:


mov si, group
mov dl, 15
mov dh, 2
loop2:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next2
mov bl, 0Ch
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop2
next2:

mov si, positions
loop3:

mov ah, 0ch
mov bh, 0
mov cx, [cs:si]
cmp cx, 0
je next3
add cx, 160
add si, 2
mov dx, [cs:si]
add dx, 50
mov al, 0100b
int 10h
add si, 2
jmp loop3

next3:
; Wait 1 second
MOV CX, 0FH
MOV DX, 4240H
MOV AH, 86H
INT 15H
jmp exit

positions:
dw 100, 100
dw 101, 101
dw 102, 102
dw 103, 103
dw 104, 104
dw 105, 105
dw 106, 106
dw 107, 107
dw 108, 108
dw 109, 109
dw 110, 110
dw 109, 110
dw 108, 110
dw 107, 110
dw 106, 110
dw 105, 110
dw 104, 110
dw 103, 110
dw 102, 110
dw 101, 110
dw 100, 110
dw 99, 110
dw 98, 110
dw 97, 110
dw 96, 110
dw 95, 110
dw 94, 110
dw 93, 110
dw 92, 110
dw 91, 110
dw 90, 110
dw 91, 109
dw 92, 108
dw 93, 107
dw 94, 106
dw 95, 105
dw 96, 104
dw 97, 103
dw 98, 102
dw 99, 101
dw 0

exit:

db 510-($-$$) dup 0
dw 0AA55h