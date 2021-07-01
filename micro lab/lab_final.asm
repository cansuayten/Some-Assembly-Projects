; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
snake dw 6 dup(0)
tail  dw ?     
time db 0
.code 
set_cursor macro
    mov ah,02h  
    int 10h     
endm   

screen macro
    mov ah,05h
    mov al,0
    int 10h
endm


harf_yazdir macro c,r
    mov al,c;goruntulenecek karakter
    mov ah,09h ;write char at the cursor position
    mov bl,r ;attribute  renk 
    mov cx,1   ;karakteri 1 kere yaziyo
    int 10h
endm

main proc far 
    
    mov ax,@data
    mov ds,ax    
 
    mov dl,6d
    mov dh,2d 
    
    set_cursor
    harf_yazdir 'm',0ah
    
    mov dl,15d
    mov dh,3d 
    set_cursor
    harf_yazdir 'i',09h
    
    
    mov dl,2d
    mov dh,5d 
    set_cursor 
    harf_yazdir 'c',04h
      
    
    mov dl,16d
    mov dh,7d 
    set_cursor  
    harf_yazdir 'r',0fh
       
    mov dl,18d
    mov dh,8d 
    set_cursor
    harf_yazdir 'o',06h  
    
    mov cx,6  
    basla1:
    mov [305],cx
    screen
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call saga_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg cx,[305]
    loop basla1
    
    
    mov cx,3 
    basla2:
    mov [310],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call asagi_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [310],cx 
    loop basla2
    
    
    mov cx,10
    basla3:
    mov [315],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call saga_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [315],cx 
    loop basla3    
    
    
    mov cx,2
    basla4:
    mov [320],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call asagi_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [320],cx 
    loop basla4   
    
    
    mov cx,15
    basla5:
    mov [325],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call sola_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [325],cx 
    loop basla5    
    
    
    mov cx,3
    basla6:
    mov [330],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call asagi_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [330],cx 
    loop basla6   
    
    
    mov cx,15
    basla7:
    mov [335],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call saga_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [335],cx 
    loop basla7 
    
    mov cx,3
    basla10:
    mov [350],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call yukari_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [350],cx 
    loop basla10  
    
    
    mov cx,1
    basla11:
    mov [3360],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call saga_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [360],cx 
    loop basla11 
    
    mov cx,4
    basla8:
    mov [340],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call asagi_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [340],cx 
    loop basla8
                
                
    mov cx,1
    basla9:
    mov [345],cx
    mov dx,snake[0]
    set_cursor
    
    harf_yazdir '*',0dh
    
    mov ax,snake[6]
    mov tail,ax  
    
    call saga_hareket
    mov dx,tail
    set_cursor    
    
    mov al,' '
    mov ah,09h
    mov bl,0eh
    mov cx,1
    int 10h 
    
    xchg [345],cx 
    loop basla9 
    
    ;mov ch,6
    ;mov cl,7
    ;mov ah,1
    ;int 10h 
    
    tus_kontrolu:
    mov ah,01
    int 16h
    jz tus_kontrolu
    mov ah,00
    int 16h
    cmp al,1bh    ;esc
    je cikis
    
    devam:
    call saga_hareket  
    
    cikis:
    mov ah,4ch
    int 21h     
    
            
     
main endp 

saga_hareket proc 
    mov ax,40h
    mov es,ax

    mov di,14

    mov cx,7
    
    
    move_array:
    mov ax,snake[di-2] ;dword 2 dbyte 1 ;4
    mov snake[di],ax  ;4
    sub di,2
    loop move_array
    jmp sag    
    
    sag:
    mov al,b.snake[0]  
    inc al
    mov b.snake[0],al
    cmp dl,es:[4ah]   
    jb cik1
    mov b.snake[0],0    
    
    cik1:
    ret
saga_hareket endp     


asagi_hareket proc 
    mov ax,40h
    mov es,ax


    mov di,14

    mov cx,7
    
    move_array1:
    mov ax,snake[di-2] ;dword 2 dbyte 1 ;4
    mov snake[di],ax  ;4
    sub di,2
    loop move_array1
    jmp asagi    
    
    asagi:
    mov al,b.snake[1]   
    inc al
    mov b.snake[1],al
    cmp al,es:[84h]   
    jbe cik2
    mov b.snake[1],0    
    jmp cik2  
    
    cik2:
    ret
asagi_hareket endp  


sola_hareket proc 

    mov ax,40h
    mov es,ax

    mov di,14

    mov cx,7
    
    move_array2:
    mov ax,snake[di-2] ;dword 2 dbyte 1 ;4
    mov snake[di],ax  ;4
    sub di,2
    loop move_array2
    jmp sol    
    
    sol:
    mov al,b.snake[0]   
    dec al
    mov b.snake[0],al
    cmp al,-1  
    jne cik3
    mov   al, es:[4ah]    
    dec   al
    mov   b.snake[0], al     
    jmp cik3
    
    cik3:
    ret
sola_hareket endp   


yukari_hareket proc 
    mov ax,40h
    mov es,ax
    mov di,14
    mov cx,7
    
    move_array3:
    mov ax,snake[di-2] ;dword 2 dbyte 1 ;4
    mov snake[di],ax  ;4
    sub di,2
    loop move_array3
    jmp yukari    
    
    yukari:
    mov al,b.snake[1]   
    dec al
    mov b.snake[1],al
    cmp al,-1   
    jne cik4  
    mov   al, es:[84h]
    mov b.snake[1],0   
    jmp cik4
    
    cik4:
    ret
yukari_hareket endp