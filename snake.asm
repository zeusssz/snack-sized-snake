BITS 16
ORG 0x100

mov ax, 0xB800
mov es, ax
xor di, di

.loop:
    mov ah, 1
    int 16h
    jz .draw
    cmp ah, 0x48     ; Up arrow key
    je .move_up
    cmp ah, 0x50     ; Down arrow key
    je .move_down
    cmp ah, 0x4B     ; Left arrow key
    je .move_left
    cmp ah, 0x4D     ; Right arrow key
    je .move_right
    jmp .loop

.move_up:    sub di, 160
.move_down:  add di, 160
.move_left:  dec di
.move_right: inc di
.draw:       mov [es:di], byte 'O'
             jmp .loop
