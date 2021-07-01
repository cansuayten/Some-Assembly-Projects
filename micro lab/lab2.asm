; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov [300h],1d     ;ilk
mov [310h],1d     ;ikinci
mov [320h],21d    ;son
mov [330h],1d     ;toplam
mov [350h],10d    ;bolen

mov ax,[330h]
mov bx,[300h]
mov dx,[310h]

dongu:
add ax,dx
mov [340h],dx 
add dx,bx
mov bx,[340h]
cmp dx,[320h]
jle dongu

div [350h]

ret