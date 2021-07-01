org 100h
.code
screen macro
    mov ah,00
    mov al,13h
    int 10h
endm

clear_screen macro
    mov ax,00h
    mov bh,07h
    mov cx,0
    mov bx,184fh
    int 10h
endm

draw_hrz macro x,y
    local myloop ;sadece macroçici tanimlanan bir label
    ;macro disi taninmaz
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,02
        int 10h
        inc cx
        cmp cx,120
        jnz myloop 
endm 
draw_hrz_eflatun macro x,y
    local myloop ;sadece macroçici tanimlanan bir label
    ;macro disi taninmaz
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,05
        int 10h
        inc cx
        cmp cx,120
        jnz myloop 
endm
draw_vrt macro x,y
    local myloop
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,02
        int 10h
        inc dx
        cmp dx,110
        jnz myloop
endm 
draw_vrt_eflatun macro x,y
    local myloop
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,05
        int 10h
        inc dx
        cmp dx,110
        jnz myloop
endm
draw_capraz_u macro x,y
    local myloop
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,06
        int 10h 
        dec cx
        inc dx 
        cmp cx,70
        jnz myloop
endm
draw_capraz_a macro x,y
    local myloop
    mov cx,x
    mov dx,y
    mov bh,0h
    myloop:
        mov ah,0ch
        mov al,06
        int 10h 
        inc cx
        inc dx 
        cmp cx,120
        jnz myloop
endm

main proc far
    mov ax,@data
    mov ds,ax
    clear_screen
    screen

    draw_hrz 20,10
    draw_hrz 20,20
    draw_hrz 20,30
    draw_hrz 20,40
    draw_hrz 20,50
    draw_hrz_eflatun 20,60
    draw_hrz 20,70
    draw_hrz 20,80
    draw_hrz 20,90
    draw_hrz 20,100
    draw_hrz 20,110


    draw_vrt 20,10
    draw_vrt 30,10
    draw_vrt 40,10
    draw_vrt 50,10
    draw_vrt 60,10
    draw_vrt_eflatun 70,10
    draw_vrt 80,10
    draw_vrt 90,10
    draw_vrt 100,10
    draw_vrt 110,10
    draw_vrt 120,10
    
        
    draw_capraz_u 120,10
    draw_capraz_a 70,60
        
    
    mov ah,4ch
    int 21h 
main endp
