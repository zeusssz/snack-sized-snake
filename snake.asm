BITS 16
ORG 0x100

mov ax, 0xB800
mov es, ax
xor di, di

.loop:
    mov ah, 1
    int 16h
    jz .draw
    cmp ah, 0x48
    je .move_up
    cmp ah, 0x50
    je .move_down
    cmp ah, 0x4B
    je .move_left
    cmp ah, 0x4D
    je .move_right
    jmp .loop

.move_up:
    sub di, 160
    jmp .loop
.move_down:
    add di, 160
    jmp .loop
.move_left:
    dec di
    jmp .loop
.move_right:
    inc di
    jmp .loop

.draw:
    mov byte [es:di], 'O'
    jmp .loop
