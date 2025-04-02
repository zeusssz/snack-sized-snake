BITS 16
ORG 100h
mov ax,0xB800
mov es,ax
mov di,1990
mov[h],di
mov[d],2
g:mov si,[t]
mov[es:si],0x720
mov si,[h]
mov bx,si
mov ah,1
int 16h
jz s
xor ah,ah
int 16h
sub ah,75
cmp ah,3
ja s
mov[d],ah
s:mov al,[d]
cbw
add ax,ax
add ax,o
mov dx,[ax]
add si,dx
mov[h],si
mov ax,[s]
mov[t],ax
mov[s],bx
cmp si,[f]
jne n
mov ah,0
int 1Ah
mov ax,dx
and ax,0xFFE
mov[f],ax
mov[es:ax],0xE02
n:mov[es:si],0xA01
mov cx,500
l:loop l
jmp g
d db 2
h dw 0
t dw 0
f dw 0
s dw 0
o dw -160,160,-2,2
