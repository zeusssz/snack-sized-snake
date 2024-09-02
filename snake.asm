BITS 16
ORG 0x100

mov ax, 0xB800
mov es, ax
xor di, di

.loop:
    mov ah, 1
    int 16h
    jz .draw
    sub ah, 0x48
    js .loop
    jz .up
    dec ah
    jz .down
    dec ah
    jz .left
    dec ah
    jz .right
    jmp .loop

.up:    sub di, 160
.down:  add di, 160
.left:  dec di
.right: inc di
.draw:  mov [es:di], byte 'O'
        jmp .loop
