bgcolor macro

  MOV AH, 06h
  MOV AL, 0
  MOV ch, 0
  mov cl,0
  mov dl,80
  mov dh,9
  MOV BH, 13h
  INT 10h
  MOV AH, 06h
  MOV AL, 0
  MOV ch, 10
  mov cl,0
  mov dl,80
  mov dh,19
  MOV BH, 15h
  INT 10h
  MOV AH, 06h
  MOV AL, 0
  MOV ch, 20
  mov cl,0
  mov dl,80
  mov dh,29
  MOV BH, 19h
  INT 10h
  
  
  MOV AH, 06h
  MOV AL, 0
  MOV cl, 15
  mov ch, 9
  mov dl,65
  mov dh,20
  MOV BH,17h
  INT 10h
  
endm