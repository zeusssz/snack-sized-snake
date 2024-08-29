BITS 16
ORG 0x100
mov ax,0xB800
mov es,ax
xor di,di
.loop:
    mov ah,1
    int 16h
    test ah,ah
    jz .no_key
    cmp ah,0x48
    je .up
    cmp ah,0x50
    je .down
    cmp ah,0x4B
    je .left
    cmp ah,0x4D
    je .right
    jmp .loop
.no_key:
    mov byte [es:di],'O'
    jmp .loop
.up:
    sub di,160
    jmp .loop
.down:
    add di,160
    jmp .loop
.left:
    dec di
    jmp .loop
.right:
    inc di
    jmp .loop
