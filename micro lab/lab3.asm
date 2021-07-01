org 100h 


mov ax,700h
mov ds,ax
numbers dw 6,4,15,23,54,32,12,34,5,7

mov bp,200h
mov di,0h
mov cx,10h
mov ax,1h

dongu_atama:
    mov ax,numbers+di
    mov [bp][di],ax
    add di,2h
    loop dongu_atama

mov cx,9
mov di,0h
mov al,[bp][di]
dongu_kiyas1:    ;kucuk icin
    add di,2h
    cmp al, [bp][di] 
    jle devam1
    mov al, [bp][di] 

devam1:
loop dongu_kiyas1
mov [305h],al 
mov dl,al 



;buyuk icin
mov cx,9
mov di,0h
mov al,[bp][di]
dongu_kiyas2:
    add di,2h
    cmp al, [bp][di] 
    jnb devam2
    mov al, [bp][di] 

devam2:
loop dongu_kiyas2
mov [310h],al
mov dh,[310h] ;kontrol icin



mov ax, [305h]
mul [310h] ;Ã§carpim 216 cikti

mov bl,20
div bl   ;ah:kalan al:bolum



hlt ;programi durdurur
ret