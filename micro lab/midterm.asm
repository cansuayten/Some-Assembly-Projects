org 100h

.data
intro db "Welcome to the Factorial Program$"
number db 0ah,0dh,"Please input the number for calculating it's factorial? [0-8] =","$"
errormsg db 0ah,0dh, "Not in the range!","$"
result db "!=$" 
NUM db 0
FACT dw 0   

.code 

main proc far
    jmp beginning 
    
newline proc  
    mov dl, 10     ;create a new line
    mov ah, 02h    ;ascii 10 = new line
    int 21h    
    
    mov dl, 13     ;move the cursor to the beginning of the line
    mov ah, 02h    ;ascii 13 = carriage return
    int 21h
    ret
newline endp 

control proc 
    ;Checks whether the number is greater than 8 or less than 0.
    ;Checking whether it is less than 0 indicates whether any number has been entered.   
    jmp check 
    
    error:        ;if bl is grater than 8
    lea dx,errormsg  ;load address of the errormsg string 
    mov ah,09h    ;print the error string
    int 21h 
    jmp beginning2 ;then, jump beginning2   
         
    check:  
    cmp bl,8      ;compare bl with 8 
    jg error      ;if bl is grater than 8, jump error
    cmp bl,0      ;if no number is entered
    jl error      ;if bl is less than 0, jump error
    ret
control endp
       
factorial proc
        ;finds the factorial value of the entered number,write factorial result to ax register
        ;FACT=ax
        ;0 is a special case so it checks if the number is 0
        cmp bl,0      ;compare bl with 0 
        jne factorial_define ;if bl!=0, jump factorial_define 
        mov NUM,bl  ;NUM= bl
        mov FACT,1  ;FACT=1 
        jmp finish  ;factorial operation finished
        
        ;if the number is different from 0
    factorial_define:
        mov ax,1        ;ax=1
        mov cx,bx       ;cx=bx
        mov NUM,bl      ;NUM= bl, for printing the number like number!=
    
    factorial_loop:
        mul cx          ;ax=ax*cx
        dec cx          ;decrease cx by one
        jnz factorial_loop ;if cx not zero jump factorial_loop
        
        mov FACT,ax     ;FACT=ax, ax is result of factorial operation  
        finish:
        ret
factorial endp 

print proc  
    call newline   ;call the function for creating a new line
    add NUM,'0'    ;convert to character
    mov dl,NUM     ;dl= input number
    mov ah,02      ;print the character in the dl register to the screen
    int 21h

    lea dx,result ;load address of the result string 
    mov ah,09h    ;print characters from the offset address in the dx register until it encounters the $ character.
    int 21h 

    xor ax,ax     ;ax=0
    mov ax,FACT   ;FACT value is passed to the ax register
    mov bx,10 
    xor cx,cx     ;xor cx,cx will set cx=0 because cx always equal to cx
    ;cx = digit counter                                                 
    
    ;The loop turns until ax is 0. Found dx's are added to a stack. Thus, the digits are stored in the stack.
    printing_result: ;
      xor dx,dx ;xor dx,dx will set dx=0 because dx always equal to dx
      div bx    ;ax/bx (divide operation)
      push dx   ;add remainder to stack
      inc cx    ;cx is increased by 1
      test ax,ax;set ZF=1 if ax==0   
      jnz printing_result ;jump if ZF==0    
      
      ;digits in the stack are printed
    printing_result1:
	  pop dx     ;pop dx
      add dl,'0' ;convert dl to character
      mov  ah,02h;print the character in the dl register to the screen 
      int  21h
      loop printing_result1   
      ret
print endp  
beginning:
    mov ax,@data  
    mov ds,ax     ;initialize ds
    
    lea dx,intro  ;load address of the intro string 
    mov ah,09h    ;this function prints characters from the offset address in the dx register until it encounters the $ character.
    int 21h   
    
    beginning2:    
    lea dx,number ;load address of the number string 
    mov ah,09h    ;print
    int 21h 
    
    mov ah,01     ;take the number 
    int 21h
     
    mov bl,al     ;bl=number
    sub bl,30h    ;convert bl to int  
    call control    ;call check function
    call factorial;call factorial function
    call print    ;call print function
    mov ah,4ch ;interrupt to exit
    int 21h 
end main
