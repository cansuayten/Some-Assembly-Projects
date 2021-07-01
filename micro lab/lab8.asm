; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data  
veri db 'Yapacaginiz islem:'
islemler db 0ah,0dh,'Toplam=t, Cikarma=c, Bolme=b, Carpma=p$'
veri1 db 0ah,0dh,'Ilk sayiyi girin:$' 
veri2 db 0ah,0dh,'Ikinci sayiyi girin:$'
veri4 db 'Islemin Sonucu:$ '     
veri3 db 'Devam etmek icin d cikmak icin q ya basiniz$' 

sayi1 db ?
sayi2 db ?
islem db ?  
sonuc db ?

.code

main proc far
    jmp baslangic
    
    
sayi_al proc
    lea dx, veri1 ;ekrana veri1 yazdir
    mov ah,9h
    int 21h
    call newline
    mov ah,1h   ;sayi al
    int 21h
    
    sub al,30h ;sayiyiyi decimal yap
    mov sayi1,al ;sayi1 e aktar
    
    
    lea dx,veri2 ;ekrana veri2 yazdir 
    mov ah,9h
    int 21h
    
    call newline
    mov ah,1h   ;sayi al
    int 21h
    
    sub al,30h ;sayiyiyi decimal yap
    mov sayi2,al ;sayi2 ye aktar 
    
    cmp islem, 'p'      ;carpma
    je carpma
    cmp islem, 't'      ;toplama
    je toplama 
    cmp islem, 'c'      ;cikarma
    je cikarma 
    cmp islem, 'b'      ;bolme
    je bolme
    
    ret
sayi_al endp

islem_al proc  
    lea dx, veri ;ekrana veri yazdir
    mov ah,9h
    int 21h
    
    call newline
    
    mov ah,01      
    int 21h

    mov islem,al
    ret
islem_al endp 


carpma proc 
    mov islem,'p'
    mov al,sayi1
    mov bl,sayi2
    mul bl
    mov sonuc,al 
  
ret
carpma endp    

toplama proc  
    mov islem,'t'
    mov al,sayi1
    mov bl,sayi2
    add al,bl
    mov sonuc, al
    ret
toplama endp

cikarma proc   
    mov islem,'c'
    mov al,sayi1
    mov bl,sayi2
    
    cmp al,bl
    jng tersten_cikar   ;sonucun negatif olmasi durumunda girer
    
    sub al,bl
    mov sonuc,al 
    jmp exit1
    
    tersten_cikar:
    sub bl,al
    mov sonuc,bl
    jmp exit1
            
    exit1:       
    ret
cikarma endp 

bolme proc   
    mov islem,'b'
    xor ax,ax
    mov al,sayi1
    mov bl,sayi2
    cmp bl,0
    je exit2
    div bl
    mov sonuc,al
    exit2: 
    ;mov sonuc,0    ;bolen 0sa sonuc 0
    ret
bolme endp

print proc  
    call newline
    lea dx,veri4 
    mov ah,09h    
    int 21h
    
    call newline 
    
    cmp islem,'c' 
    je devam1 
    
    cmp islem,'t'
    je devam
    cmp islem, 'p'
    je devam
    cmp islem, 'b' 
    je devam
    
    devam1:
    mov al,sayi1
    mov bl,sayi2  
    cmp al,bl
    jg devam
    mov dl, '-'
    mov  ah,02h 
    int  21h  
    
    devam:
    xor ax,ax     ;ax=0
    mov al,sonuc   ;sonuc value is passed to the ax register
    mov bx,10 
    xor cx,cx     ;xor cx,cx will set cx=0 because cx always equal to cx
    ;cx = digit counter                                                 
    
    
    printing_result: ;
      xor dx,dx 
      div bx    
      push dx   ;add remainder to stack
      inc cx    
      test ax,ax;set ZF=1 if ax==0   
      jnz printing_result ;jump if ZF==0    
      
   
    printing_result1:
	  pop dx     
      add dl,30h 
      mov  ah,02h ;print the character in the dl register to the screen 
      int  21h
      loop printing_result1   
      ret
print endp 


newline proc 
     
    mov dl, 10     
    mov ah, 02h    
    int 21h    
    
    mov dl, 13     
    mov ah, 02h    
    int 21h
    ret
newline endp

baslangic:
    mov ax,@data  
    mov ds,ax      
    
    basla:
    call islem_al 
    call sayi_al
   
    call print 
    ;karar   
    call newline 
    lea dx,veri3 
    mov ah,09h    
    int 21h
     
    tus_kontrolu2:
    mov ah,01
    int 16h
    jz tus_kontrolu2
    mov ah,0
    int 16h
    cmp al, 081   ;q,Q icin bitir  
    je cik
    cmp al, 113     
    je cik
    cmp al, 100   ;d,D icin devam  
    je yeni
    cmp al, 068
    je yeni
    
    yeni:
    call newline
    jmp basla 
    
    cik:
    mov ah,4ch ; exit
    int 21h 
    end main