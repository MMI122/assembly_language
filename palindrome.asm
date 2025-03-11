
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.data    
str1 db "Enter string: $" 
str2 db 13,10,"number palindrome$"
str3 db 13,10, "not palindrome$"
string db 10 dup('$')
.code 
lea dx,str1
call puts
mov ax,offset string
push ax
mov bx,6
push bx
call string_input
call find_palindrome
call exit
endp 



string_input proc
    push bp
    mov bp,sp
    mov bx,[bp+6]
    mov cx,[bp+4]
    mov ah,10
    lea dx,[bx]
    mov bx,cx
    int 21h
    
    
    pop bp
    ret
    
string_input endp



find_palindrome proc
    mov si,1
    mov ah,0
    mov al,string[si]
    mov bl,2
    div bl
    mov ch,0
    mov cl,al
    inc si
    mov ah,0
    mov al,string[1]
    mov di,ax
    inc di
    again:
    mov al,string[si]
    cmp al,string[di]
    jne not_palindrome
    inc si
    inc di
    loop again
    
    
    palindrome:
    lea dx,str2
    call puts
    jmp return
    
    
    not_palindrome:
    lea dx,str3
    call puts
    
    
    return:
    pop bp
    ret
    
find_palindrome endp 


puts proc
    mov ah,09h
    int 21h
    ret
puts endp 


exit proc
    mov ah,4ch
    int 21h
    ret
exit endp




end main

    
    
    
    

 










