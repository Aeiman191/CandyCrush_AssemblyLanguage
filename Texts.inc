 Text macro
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,32  ; mid-point of columns (Total Cols = 80)
  mov dh,12  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str1
  mov ah,09
  int 21h
  
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,32  ; mid-point of columns (Total Cols = 80)
  mov dh,14  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str2
  mov ah,09
  int 21h
  
endm