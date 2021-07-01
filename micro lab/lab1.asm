org 100h

mov ax,200h
mov ds,ax
mov [300h],15h
mov [310h],06h
mov [320h],17h
mov ax,[300h]
mov bx,[310h]
mov cx,[320h]
add bx,cx
sub bx,ax
mov [400h],bx      

ret               