include bgcolor.inc
include Texts.inc
include Nam.inc
include candies.inc
.model small
.386

.stack 100h
.data
array db 49 dup('$');

rand1 db 0
str1 db '!!!CANDY CRUSH!!!$'
str2 db 'Enter Your Name!!$'
str3 db 'Welcome to the game:'
var1 db 100 dup('$')
str4 db 'Rules for the games$'
str5 db '1-You can move the candies based on swaping them to$'
str6 db 'make a row or column of 3 candies$'
str8 db '2-After crushing scores will be added A combo of 3$'
str9 db 'adds 3 to the score. A combo of 4 will add 4 and$'
str10 db 'so on.$'
str11 db 'Name: $'
str12 db 'Score:$'
str13 db 'Level 1$'
color db 181


.code
main proc
 mov ax,@data
 mov ds,ax   
; Set Graphics Mode
MOV AX,6; High Resolution Mode: 200 x 640 pixels
MOV AH,0
MOV AL,12h
INT 10h;
mov ah,6 ; Scroll Up Window ; Means at the Top of Window 
mov al,0 ; To Clear whole default SCREEN                                                       
mov cl,0    ; start point of cloumns Left Most
mov ch,0    ; start point of Rows Top Most(Upper)
mov dl,79  ; end point of cloumns (Last Col #)
mov dh,24  ; end point of Rows (Lower/Last Row #)
int 10h
bgcolor
text
nam
call rul
call bgcolor1
call Pnambox
call drawgrid

call printcandies
exit:
mov ah,4ch
int 21h
main endp 

Pnambox proc
mov ax,@data
 mov ds,ax   
;Top Box
  MOV AH, 6
  MOV AL, 0
  MOV cl, 0
  mov ch, 0
  mov dl,80
  mov dh,03
  MOV BH,17h
  INT 10h
  
mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,30  ; mid-point of columns (Total Cols = 80)
mov dh,0  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov dx,offset str1
mov ah,09
int 21h

mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,0  ; mid-point of columns (Total Cols = 80)
mov dh,0  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov dx,offset str11
mov ah,09
int 21h


mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,5  ; mid-point of columns (Total Cols = 80)
mov dh,0  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov dx,offset var1
mov ah,09
int 21h

 
mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,65  ; mid-point of columns (Total Cols = 80)
mov dh,0  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov dx,offset str12
mov ah,09
int 21h
 


mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,35  ; mid-point of columns (Total Cols = 80)
mov dh,3  ; mid-point of Rows (Total Rows = 25)
int 10h 
mov dx,offset str13
mov ah,09
int 21h

ret
Pnambox endp


rul proc

;mov ah,2; Settings for Cursor POSITION
;mov bh,0; Contains Page Number which is 0 here
;mov dl,35  ; mid-point of columns (Total Cols = 80)
;mov dh,10  ; mid-point of Rows (Total Rows = 25)
;int 10h 
;mov dx,offset var1
;mov ah,09
;int 21h

mov ah,2; Settings for Cursor POSITION
mov bh,0; Contains Page Number which is 0 here
mov dl,32  ; mid-point of columns (Total Cols = 80)
mov dh,12  ; mid-point of Rows (Total Rows = 25)
int 10h                
mov dx, offset str4
mov  bl,color
mov ah,08H
int 21h
  
  
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,15  ; mid-point of columns (Total Cols = 80)
  mov dh,14  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str5
  mov ah,09
  int 21h
  
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,15  ; mid-point of columns (Total Cols = 80)
  mov dh,15  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str6
  mov ah,09
  int 21h
  


  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,15  ; mid-point of columns (Total Cols = 80)
  mov dh,16  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str8
  mov ah,09
  int 21h
  
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,15  ; mid-point of columns (Total Cols = 80)
  mov dh,17  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str9
  mov ah,09
  int 21h
  
  mov ah,2; Settings for Cursor POSITION
  mov bh,0; Contains Page Number which is 0 here
  mov dl,15  ; mid-point of columns (Total Cols = 80)
  mov dh,18  ; mid-point of Rows (Total Rows = 25)
  int 10h                
  mov dx, offset str10
  mov ah,09
  int 21h
  rul endp
  
drawGrid Proc  
call delay
call delay
call delay
  ; Draw Line
	mov cx,150; Beginning Column
	mov dx,100;  Row # from where we will start
	mov bx,8
	l1:
	mov cx,150; Beginning Column
	L0:
	mov ah,0ch ;  write Pixel on screen
	mov al,0fh   ;Color
	int 10h
	inc cx
	cmp cx,500
	jle L0
	add dx,50
	dec bx
	cmp bx,0
	jne l1


	mov cx,150; Beginning Column
	mov dx,100;  Row # from where we will start
	mov bx,8
	l2:
	mov dx,100;
	L3:

	mov ah,0ch ;write Pixel on screen
	mov al,08h   ;Color
	int 10h
	inc dx
	cmp dx,450
	jle L3
	add cx,50
	dec bx
	cmp bx,0
	jne l2

	ret
drawGrid endP 

bgcolor1 proc
  MOV AH, 06h
  MOV AL, 0
  MOV cx, 0
  mov dl,80
  mov dh,80
  MOV BH, 13h
  INT 10h  
 
  MOV AH, 06h
  MOV AL, 0
  MOV cl, 18
  mov ch, 6
  mov dl,62
  mov dh,28
  MOV BH,17h
  INT 10h
  ret
bgcolor1 endp


  
printcandies proc
mov si, offset array
mov cx,lengthof array
mov [si],al
inc si
call delay
mov rand1,0
call random_num
mov [si],random_num
inc si
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 100
	.ELSEIF (rand1=='0')
		Bomb 150, 100
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 150
	.ELSEIF (rand1=='0')
		Bomb 150, 150
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 200
	.ELSEIF (rand1=='0')
		Bomb 150, 200
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 250
	.ELSEIF (rand1=='0')
		Bomb 150, 250
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 300
	.ELSEIF (rand1=='0')
		Bomb 150, 300
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 350
	.ELSEIF (rand1=='0')
		Bomb 150, 350
	.ENDIF
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 150, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  150, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 150 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 150, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 150, 400
	.ELSEIF (rand1=='0')
		Bomb 150, 400
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 100
	.ELSEIF (rand1=='0')
		Bomb 200, 100
	.ENDIF
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 150
	.ELSEIF (rand1=='0')
		Bomb 200, 150
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 200
	.ELSEIF (rand1=='0')
		Bomb 200, 200
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 250
	.ELSEIF (rand1=='0')
		Bomb 200, 250
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 300
	.ELSEIF (rand1=='0')
		Bomb 200, 300
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 350
	.ELSEIF (rand1=='0')
		Bomb 200, 350
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 200, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  200, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 200 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 200, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 200, 400
	.ELSEIF (rand1=='0')
		Bomb 200, 400
	.ENDIF	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 100
	.ELSEIF (rand1=='0')
		Bomb 250, 100
	.ENDIF	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 150
	.ELSEIF (rand1=='0')
		Bomb 250, 150
	.ENDIF	
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250, 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 200
	.ELSEIF (rand1=='0')
		Bomb 250, 200
	.ENDIF	
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250, 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 250
	.ELSEIF (rand1=='0')
		Bomb 250, 250
	.ENDIF	
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 300
	.ELSEIF (rand1=='0')
		Bomb 250, 300
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 350
	.ELSEIF (rand1=='0')
		Bomb 250, 350
	.ENDIF	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 250, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  250, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 250 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 250, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 250, 400
	.ELSEIF (rand1=='0')
		Bomb 250, 400
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 100
	.ELSEIF (rand1=='0')
		Bomb 300, 100
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 150
	.ELSEIF (rand1=='0')
		Bomb 300, 150
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 200
	.ELSEIF (rand1=='0')
		Bomb 300, 200
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 250
	.ELSEIF (rand1=='0')
		Bomb 300, 250
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 300
	.ELSEIF (rand1=='0')
		Bomb 300, 300
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 350
	.ELSEIF (rand1=='0')
		Bomb 300, 350
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 300, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  300, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 300, 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 300, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 300, 400
	.ELSEIF (rand1=='0')
		Bomb 300, 400
	.ENDIF	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 100
	.ELSEIF (rand1=='0')
		Bomb 350, 100
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 150
	.ELSEIF (rand1=='0')
		Bomb 350, 150
	.ENDIF
	
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 200
	.ELSEIF (rand1=='0')
		Bomb 350, 200
	.ENDIF
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 250
	.ELSEIF (rand1=='0')
		Bomb 350, 250
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 300
	.ELSEIF (rand1=='0')
		Bomb 350, 300
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 350
	.ELSEIF (rand1=='0')
		Bomb 350, 350
	.ENDIF
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 350, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  350, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 350 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 350, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 350, 400
	.ELSEIF (rand1=='0')
		Bomb 350, 400
	.ENDIF


call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 100
	.ELSEIF (rand1=='0')
		Bomb 400, 100
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 150
	.ELSEIF (rand1=='0')
		Bomb 400, 150
	.ENDIF
	
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 200
	.ELSEIF (rand1=='0')
		Bomb 400, 200
	.ENDIF
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 250
	.ELSEIF (rand1=='0')
		Bomb 400, 250
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 300
	.ELSEIF (rand1=='0')
		Bomb 400, 300
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 350
	.ELSEIF (rand1=='0')
		Bomb 400, 350
	.ENDIF
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 400, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  400, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 400 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 400, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 400, 400
	.ELSEIF (rand1=='0')
		Bomb 400, 400
	.ENDIF
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 100
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 100
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 100
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 100
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 100
	.ELSEIF (rand1=='0')
		Bomb 450, 100
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 150
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 150
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 150
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 150
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 150
	.ELSEIF (rand1=='0')
		Bomb 450, 150
	.ENDIF
	
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 200
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 200
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 200
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 200
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 200
	.ELSEIF (rand1=='0')
		Bomb 450, 200
	.ENDIF
	
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 250
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 250
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 250
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 250
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 250
	.ELSEIF (rand1=='0')
		Bomb 450, 250
	.ENDIF
	
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 300
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 300
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 300
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 300
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 300
	.ELSEIF (rand1=='0')
		Bomb 450, 300
	.ENDIF
	

call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 350
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 350
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 350
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 350
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 350
	.ELSEIF (rand1=='0')
		Bomb 450, 350
	.ENDIF
	
call delay
mov rand1,0
call random_num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF (rand1=='1') || (rand1=='2')
		appleCandy 450, 400
	.ELSEIF (rand1=='3') || (rand1=='4')
		WatermelonCandy  450, 400
	.ELSEIF (rand1=='5') || (rand1=='6')
		PlusCandy 450 , 400
	.ELSEIF (rand1=='7') || (rand1=='8') 
		TriangleCandy 450, 400
	.ELSEIF (rand1=='9')
		DiamondCandy 450, 400
	.ELSEIF (rand1=='0')
		Bomb 450, 400
	.ENDIF

printcandies endp



random_num proc

   MOV AH, 00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, 10    
   div  cx       ; here dx contains the remainder of the division - from 0 to 9

   add  dl, '0'  ; to ascii from '0' to '9'
   mov rand1,dl
	ret
random_num endp
  
delay proc


	push ax
	push bx
	push cx
	push dx

	mov cx,1000
	mydelay:
	mov bx,1000      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
	mydelay1:
	dec bx
	jnz mydelay1
	loop mydelay


	pop dx
	pop cx
	pop bx
	pop ax

	ret

delay endp

 

end main




