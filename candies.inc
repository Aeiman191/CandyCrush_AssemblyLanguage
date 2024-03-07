TriangleCandy macro ptx, pty

	mov ah,0ch ;  write Pixel on screen
	mov al,02h   ; colour
	mov cx,ptx; Beginning Column
	add cx,26
	mov dx,pty;  Row # from where we will start
	add dx,11
	mov bx,0
	mov si,ptx
	add si,26
	
	.while bx <= 18
		mov cx,ptx
		add cx,26
		sub cx, bx
		.while cx <= si
			int 10h
			inc cx
		.endw
		inc si
		inc dx
		inc bx
    .endw	
	mov ah,0ch ;  write Pixel on screen
	mov al,06h   ; colour
	mov cx,ptx; Beginning Column
	add cx,26
	sub cx,3
	mov dx,pty;  Row # from where we will start
	add dx,11
	add dx,19
	mov bx,0
	.while bx <= 10
		push bx
		mov bx,0
		mov cx,ptx;
		add cx,26
		sub cx,3
		.while bx <= 6
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw				
endm


Bomb macro ptx, pty

	mov ah,0ch ;  write Pixel on screen
	mov al,05h   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	mov dx,pty;  Row # from where we will start
	add dx,13
	mov bx,0
	.while bx <= 24
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		.while bx <= 24
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov ah,0ch ;  write Pixel on screen
	mov al,0dh   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,3
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,4
	mov bx,0
	.while bx <= 16
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,3
		.while bx <= 18
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov ah,0ch ;  write Pixel on screen
	mov al,0ch   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,8
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,8
	mov bx,0
	.while bx <= 8
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,8
		.while bx <= 8
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov ah,0ch ;  write Pixel on screen
	mov al,0eh   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,10
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,10
	mov bx,0
	.while bx <= 4
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,10
		.while bx <= 4
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw
	mov ah,0ch ;  write Pixel on screen
	mov al,0eh   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,10
	mov dx,pty;  Row # from where we will start
	add dx,13
	sub dx,7
	mov bx,0
	.while bx <= 6
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,10
		.while bx <= 4
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov ah,0ch ;  write Pixel on screen
	mov al,0eh   ; colour
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,10
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,25
	mov bx,0
	.while bx <= 6
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,10
		.while bx <= 4
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov cx,ptx; Beginning Column
	add cx, 13
	add cx,25
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,10
	mov bx,0
	.while bx <= 4
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		add cx,25
		.while bx <= 6
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	mov cx,ptx; Beginning Column
	add cx, 13
	sub cx,7
	mov dx,pty;  Row # from where we will start
	add dx,13
	add dx,10
	mov bx,0
	.while bx <= 4
		push bx
		mov bx,0
		mov cx,ptx;
		add cx, 13
		sub cx,7
		.while bx <= 6
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw		
endm


appleCandy macro ptx, pty

	mov ah,0ch ;  write Pixel on screen
	mov al,04h   ; colour
	mov cx,ptx; Beginning Column
	add cx, 14
	mov dx,pty;  Row # from where we will start
	
	add dx,16
	mov bx,0
	.while bx <= 22
		push bx
		mov bx,0
		mov cx,ptx
		add cx, 14
		.while bx <= 22
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw
	mov ah,0ch ;  write Pixel on screen
	mov al,0Ah   ; colour
	mov cx,ptx; Beginning Column
	add cx, 14
	add cx,8
	mov dx,pty;  Row # from where we will start
	
	add dx,16
	sub dx,7
	mov bx,0
	.while bx <= 6
		push bx
		mov bx,0
		mov cx,ptx
		add cx, 14
		add cx,8
		.while bx <= 5
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw		
	
endm








DiamondCandy macro ptx, pty

	mov ah,0ch ;  write Pixel on screen
	mov al,09h   ; colour
	mov cx,ptx; Beginning Column
	add cx, 24
	mov dx,pty;  Row # from where we will start
	add dx,8
	mov bx,0
	mov si, ptx
	add si,24
	.while bx <= 18
		mov cx,ptx
		add cx, 24
		sub cx, bx
		.while cx <= si
			int 10h
			inc cx
		.endw
		inc si
		inc dx
		inc bx
    .endw

	mov ah,0ch ;  write Pixel on screen
	mov al,0bh   ; colour
	mov bx, 18
	.while bx>0
		mov cx,ptx; Beginning Column
		add cx, 24
		sub cx, bx
		mov si, ptx
		add si,24
		add si,bx
		.while cx <= si
				int 10h
				inc cx
			.endw
		dec bx
		inc si
		inc dx
	.endw	
endm



PlusCandy macro ptx,pty

	mov ah,0ch ;  write Pixel on screen
	mov al,0eh   ; colour
	mov cx,ptx; Beginning Column
	add cx,11
	mov dx,pty;  Row # from where we will start
	add dx,19
	mov bx,0
	.while bx <= 10
		push bx
		mov bx,0
		mov cx,ptx
		add cx,11
		.while bx <= 30
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw
	mov cx,ptx; Beginning Column
	add cx,11
	add cx, 10
	mov dx,pty;  Row # from where we will start
	add dx,19
	sub dx, 10
	mov bx,0
	.while bx <= 30
		push bx
		mov bx,0
		mov cx,ptx
		add cx,11
		add cx, 10
		.while bx <= 10
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	
endm	
	
WatermelonCandy macro ptx, pty

	mov ah,0ch ;  write Pixel on screen
	mov al,0ch   ; colour
	mov cx,ptx; Beginning Column
	add cx,25
	mov dx,pty;  Row # from where we will start
	add dx,13
	mov bx,0
	mov si,ptx
	add si,25
	.while bx <= 18
		mov cx,ptx
		add cx,25
		sub cx, bx
		.while cx <= si
			int 10h
			inc cx
		.endw
		inc si
		inc dx
		inc bx
    .endw
	mov ah,0ch ;  write Pixel on screen
	mov al,0ah   ; colour
	mov cx,ptx; Beginning Column
	add cx,25
	sub cx,18
	mov bx,0
	.while bx <= 5
		push bx
		mov bx,0
		mov cx,ptx
		add cx,25
		sub cx,18
		.while bx <= 36
			int 10h
			inc cx
			inc bx
		.endw
		pop bx
		inc bx
		inc dx
    .endw	
	
	
endm	