BITS 16
ORG 0x100

mov ax, 0xB800
mov es, ax
xor di, di

.loop:
    mov ah, 1
    int 16h
    jz .draw
    sub ah, 0x47
    cmp ah, 4
    ja .loop
    jmp word [tbl + ah*2]

.up:    sub di, 160
        jmp .loop
.down:  add di, 160
        jmp .loop
.left:  dec di
        jmp .loop
.right: inc di
        jmp .loop
.draw:  mov [es:di], byte 'O'
        jmp .loop

tbl:    dw .up, .left, .down, .right
