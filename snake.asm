BITS 16
ORG 0x100

mov ah, 00h
int 16h
mov ax, 0B800h
mov es, ax
mov di, 400h
mov cx, 0302h
next:
mov [es:di], cl
inc di
loop next
wait:
mov ah, 01h
int 16h
jz wait
mov ah, 0
int 16h
dec byte [es:di]
jnz next
inc di
jmp wait
