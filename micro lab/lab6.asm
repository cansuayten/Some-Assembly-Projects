org 100h 
.data 
kendisi db  "kendisi:  $"
tumleyeni db 0ah,0dh,"2ye tumleyeni: $"
.code  
;kendisini yazdirma
lea dx, kendisi             
mov ah, 9
int 21H 

mov bl,10011101b 
mov cl,8  
dongu1:
    shl bl,1
    jc bir_yaz 
    mov dl,'0'
    mov ah,02h
    int 21h 
    jmp atla1

bir_yaz: 
    mov dl,'1'
    mov ah,02h
    int 21h 

atla1:
dec cx
jnz dongu1  


;tumleyen bulup yazdirma
lea dx, tumleyeni             
mov ah, 9
int 21H 


xor ax,ax   ;sifirladim
xor dx,dx
xor bx,bx
xor cx,cx  

mov bl, 10011101b

mov cl,7  
dongu2:
    shl bl,1
    jc sifir_yaz 
    mov dl,'1'
    mov ah,02h
    int 21h 
    jmp atla2

sifir_yaz: 
    mov dl,'0'
    mov ah,02h
    int 21h 

atla2:
dec cx
jnz dongu2  

mov dl,'1'  ;sonuncu 1
mov ah,02h
int 21h
ret