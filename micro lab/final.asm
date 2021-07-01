org 100h 
;cansu ayten
;171180010
;section 3
.data

left_key equ 4bh
right_key equ 4dh
up_key equ 48h
down_key equ 50h 

hx dw 0
hy dw 240
vx dw 320
vy dw 0


cur_direction db 0
stop_key db 0
 
.code
screen macro
    mov ah,00
    mov al,12h
    int 10h

endm

hrz_line macro x,y
    local hrzloop 
    mov cx,x
    mov dx,y
    mov bh,0h
    hrzloop:
        mov ah,0ch
        mov al,02
        int 10h
        inc cx
        cmp cx,640
        jne hrzloop 
endm 

vrt_line macro x,y
    local vrtloop
    mov cx,x
    mov dx,y
    mov bh,0h
    vrtloop:
        mov ah,0ch
        mov al,02
        int 10h
        inc dx
        cmp dx,480
        jne vrtloop
endm

beep_sound macro
    mov ah,02
    mov dl,07
    int 21h
endm


main proc far 
    screen
    top:
    screen 

    hrz_line hx, hy
    vrt_line vx,vy

    skip:
    mov     ah, 01h
    int     16h

    mov     ah, 00h
    int     16h

    mov cur_direction, ah
    mov stop_key,al

    cmp stop_key,20h   ;space
    je exit

    cmp    cur_direction, left_key
    je    move_left
    cmp     cur_direction, right_key
    je    move_right
    cmp     cur_direction, up_key
    je    move_up
    cmp     cur_direction, down_key
    je    move_down 


    move_left:
    dec vx 
    cmp vx,0
    jl  fix_num3
    jmp top 

    move_right:
    inc vx
    cmp vx,639
    jg fix_num1
    jmp top

    move_up:
    dec hy 
    cmp hy,0
    jl fix_num2
    jmp top 

    move_down:
    inc hy 
    cmp hy,479
    jg fix_num4:
    jmp top

    fix_num1:
    dec vx 
    beep_sound
    jmp skip 

    fix_num2:
    inc hy
    beep_sound
    jmp skip

    fix_num3:
    inc vx 
    beep_sound
    jmp skip

    fix_num4:
    dec hy 
    beep_sound
    jmp skip 

    exit:
    mov ah,4ch
    int 21h 
main endp
