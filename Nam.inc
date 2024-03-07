nam macro
mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,32  ; mid-point of columns (Total Cols = 80)
mov dh,15  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov si,offset var1  
 
 l1:
 mov ah,1
 int 21h
 cmp al,13
 je exit1
 mov [si],al
 inc si
 jmp l1
 
 exit1:
 mov ah,02

endm