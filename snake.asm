BITS 16
ORG 0x100

start:
mov ax, 0xB800
mov es, ax
xor di, di

main_loop:
    mov ah, 1
    int 16h         
    jz no_key       
    int 16h         
    cmp ah, 72      ; Up arrow
    je up
    cmp ah, 80      ; Down arrow
    je down
    cmp ah, 75      ; Left arrow
    je left
    cmp ah, 77      ; Right arrow
    je right

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
