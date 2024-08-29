BITS 16
ORG 0x100

mov ax, 0xB800
mov es, ax
xor di, di

main_loop:
    mov ah, 1
    int 16h
    test ah, ah
    jz no_key
    mov al, ah
    cmp al, 0x48
    je up
    cmp al, 0x50
    je down
    cmp al, 0x4B
    je left
    cmp al, 0x4D
    je right
    jmp main_loop

no_key:
    mov byte [es:di], 'O'
    jmp main_loop

up: 
    sub di, 160
    jmp main_loop

down: 
    add di, 160
    jmp main_loop

left: 
    dec di
    jmp main_loop

right: 
    inc di
    jmp main_loop
