; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


jmp start


word dw 14 dup(0)     
tail dw ?
isim db  '171180010Cansu' 

start:

;mov ah,00h
;int 16h

;mov ah,1
;mov ch,2bh
;mov cl,0bh
;int 10h

lea si, isim 
enbas:
mov si,120h
word_loop:

mov al,0   
mov ah,05h 
int 10h

mov dx,word[0] 

mov ah,02h  
int 10h

                      
mov ah, 2 

mov al,ds:[si]
mov dl,al  
inc si
cmp si,12fh
je enbas   
int 21h

mov ax,word[14]     
mov tail,ax

call move_word


mov dx,tail

mov ah,02h
int 10h


mov al,' '
mov ah,09h
mov bl,0eh
mov cx,1
int 10h

jmp word_loop
ret

move_word proc near

    mov ax,40h
    mov es,ax
    mov di,28
    mov cx,14
    move_array:
    mov ax,word[di-2] 
    mov word[di],ax  
    sub di,2
    loop move_array
    jmp move_right

    move_right:
    mov al,b.word[0]   
    inc al
    mov b.word[0],al
    cmp al,es:[4ah]   
    jb cikis
    mov b.word[0],0  


    cikis:
    ret
move_word endp