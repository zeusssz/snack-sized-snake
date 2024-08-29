BITS 16
ORG 0x100

mov ax, 0B800h      
mov es, ax          
mov di, 401h        
mov byte [es:di], 'O'   
mov byte [es:di+2], 'X' 

mov ah, 1           
waitkey:
int 16h             
jz move             
int 16h             
cmp ah, 48h         
je up               
cmp ah, 50h         
je down             
cmp ah, 4Dh         
je right            
cmp ah, 4Bh         
je left             
jmp waitkey         

move:              
cmp byte [es:di], 'X'
je game_over        
mov byte [es:di], ' '  
mov [es:di], 'O'       
mov byte [es:di+2], 'X' 
jmp waitkey          

up:
sub di, 160
jmp move
down:
add di, 160
jmp move
left:
sub di, 2
jmp move
right:
add di, 2
jmp move

game_over:
mov ah, 0
int 16h
