.model small
.stack 4096
 

.data
Level2 db 0
Level3 db 0
GameEnd db 0
welcome db "WELCOME TO SUPER MARIO$"
Gameover db "GAME OVER$"
Enter1 db "Enter your name: $"
Name1 db 127 dup('$')
score db "Score: $"
points dw 0
Life db 3
Lives db "lives: $"
var dw 0
pos db 0
OnHurdle db 0 ; for checking if mario is on a hurdle
count dw 0
count1 dw 0
FixCount1 dw 33
FixCount2 dw 0
FixHurdX dw 60
FixHurdY dw 160
HurdX dw 0
HurdY dw 0
;lowerPort byte 0,0,0,4,4,4,0,0,0,0,0,0,4,4,4,4,0,0,0,0,0,4,4,4,4,4
upperPort byte 2,2,2,2,0Ah,0Ah,0Ah,0Ah,0Ah,2,2,0Ah,0Ah,0Ah,0Ah,0Ah,2,2,2,2,2,2,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,2,2,2,2
lowerPort byte 0,0,0,0,0Ah,0Ah,0Ah,0Ah,0Ah,2,2,0Ah,0Ah,0Ah,0Ah,0Ah,2,2,2,2,2,2,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0,0,0,0

heart byte 0,0,4,4,4,0,0,0,4,4,4,0,0
	  byte 0,4,4,4,4,4,0,4,4,4,4,4,0
	  byte 4,4,4,4,4,4,4,4,4,4,4,4,4
	  byte 4,4,4,4,4,4,4,4,4,4,4,4,4
	  byte 4,4,4,4,4,4,4,4,4,4,4,4,4
	  byte 0,4,4,4,4,4,4,4,4,4,4,4,0
	  byte 0,0,4,4,4,4,4,4,4,4,4,0,0
	  byte 0,0,0,4,4,4,4,4,4,4,0,0,0
	  byte 0,0,0,0,4,4,4,4,4,0,0,0,0
	  byte 0,0,0,0,0,4,4,4,0,0,0,0,0
	  byte 0,0,0,0,0,0,4,0,0,0,0,0,0
heartxaxis dw 240
heartyaxis dw 130

flagpole byte 6,6,6,6
flag byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	 byte 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,2,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,7,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,7,7,7,2,2,2,2,2,7,7,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,7,2,2,2,2,7,7,7,7,7,7,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,7,2,2,2,7,7,7,7,7,7,7,7,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,7,7,7,7,2,2,2,2,2,7,7,7,7,7,7,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,7,7,7,7,2,2,2,2,2,2,7,7,7,7,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,7,7,7,7,2,2,2,2,2,2,2,7,7,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,7,7,7,7,2,2,2,2,2,2,2,7,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,7,7,7,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,7,7,7,7,2,2,2,2,2,2,2,7,7,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,7,7,7,7,2,2,2,2,2,2,2,7,7,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,7,7,7,7,7,7,7,7,7,7,7,7,7,7,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,7,7,7,7,7,7,7,7,7,7,7,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,7,7,7,7,0
	 byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

     flagxaxis word 0
     flagyaxis word 0

enemy db 0,0,0,0,0,0,0,6,6,6,6,6,0,0,0,0,0,0,0,0
	  db 0,0,0,0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0
	  db 0,0,0,0,0,0,6,15,0,6,6,0,15,6,0,0,0,0,0,0
	  db 0,0,0,0,0,0,6,15,15,0,0,15,15,6,0,0,0,0,0,0
	  db 0,0,0,0,0,6,6,15,0,6,6,0,15,6,6,0,0,0,0,0
      db 0,0,0,6,6,6,6,15,0,6,6,0,15,6,6,6,6,0,0,0
	  db 0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0
	  db 0,0,0,6,6,15,0,0,0,0,0,0,0,0,15,6,6,0,0,0
	  db 0,0,0,0,6,15,6,6,6,6,6,6,6,6,15,6,0,0,0,0
	  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	  db 0,0,0,0,0,0,0,14,14,14,14,14,14,0,0,0,0,0,0,0
	  db 0,0,0,0,0,6,6,14,14,14,14,14,14,6,6,0,0,0,0,0
	  db 0,0,0,6,6,6,6,14,14,14,14,14,14,6,6,6,6,0,0,0
	  db 0,0,6,6,6,6,6,6,14,14,14,14,6,6,6,6,6,6,0,0
	  db 0,0,6,6,6,6,6,6,0,0,0,0,6,6,6,6,6,6,0,0
	  

RightMove db 1
c1 db 37
enemyX dw 94
enemyY dw 184
enemyCountX db 19
enemyCountY db 20

enemy2	 byte 0,4,4,0,0,0,0,0,0,4,4,4,4,0,0,4,4,0,0,4,4,0,0,0,0,0,0,0,0,4,4,0
		 byte 0,4,4,4,4,0,0,4,4,4,4,4,4,4,4,4,4,0,0,4,4,4,4,0,0,0,0,0,0,4,4,0
		 byte 0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,4,4,4,4,0
		 byte 0,4,4,4,4,4,4,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0
		 byte 0,0,0,4,4,4,4,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,4,4,4,4,4,4,0,0,0
		 byte 0,0,0,0,0,4,4,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,4,4,4,4,0,0,0
		 byte 0,0,0,0,0,4,4,4,4,4,4,0,0,4,4,4,4,0,0,0,0,0,0,4,4,4,4,0,0,0,0,0
		 byte 0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,4,4,4,4,4,4,4,4,0,0,0
		 byte 0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0
		 byte 0,4,4,4,4,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,4,4,4,4,0
		 byte 0,4,4,4,4,4,4,0,0,4,4,4,4,4,4,0,0,4,4,4,4,4,4,0,0,0,0,4,4,4,4,0
		 byte 0,0,0,4,4,4,4,0,0,0,0,4,4,0,0,0,0,4,4,4,4,0,0,0,0,4,4,4,4,4,4,0
		 byte 0,0,0,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0
		 byte 0,0,0,0,0,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,0,0,0,0,0
		 byte 0,0,0,0,0,0,0,4,4,0,0,4,4,0,0,4,4,0,0,4,4,0,0,4,4,4,4,0,0,0,0,0
		 byte 0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,4,4,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0
		 byte 0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0
		 byte 0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0
		 byte 0,0,0,0,4,4,4,0,0,4,4,0,0,4,4,0,0,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0
		 byte 0,0,0,4,4,4,4,0,0,4,4,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0
		 byte 0,0,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,0,0,0,0,0,0,0
		 byte 0,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,0,0,0,0,0,0,0
enemy2X dw 40
enemy2Y dw 0
RightMove1 db 1
c2 db 170


 fire byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      byte 0,0,0,0,0,0,0,0,0,12,12,0,0,0,0,0,0,0,0
	  byte 0,0,0,0,0,0,0,0,0,12,12,0,0,0,12,12,0,0,0
	  byte 0,0,0,0,0,0,0,0,0,12,12,12,12,12,12,12,12,0,0
	  byte 0,0,0,0,0,0,0,12,12,6,6,12,12,12,12,12,12,0,0
	  byte 0,12,12,0,0,12,12,6,6,12,12,12,12,0,0,12,12,0,0
	  byte 0,12,12,12,12,12,12,12,6,6,12,12,12,12,0,0,12,12,0
	  byte 0,0,0,12,12,12,12,12,6,6,12,12,12,12,12,0,0,0,0
	  byte 0,0,0,0,0,12,12,12,6,6,12,12,12,0,0,0,0,0,0
	  byte 0,0,0,0,0,12,6,6,6,6,6,6,12,12,12,12,0,0,0
	  byte 0,0,12,12,6,6,6,6,12,12,6,6,6,6,12,12,12,12,0
	  byte 0,0,12,12,6,6,6,6,12,12,6,6,6,6,12,12,12,12,0
	  byte 0,0,0,0,12,12,6,6,12,12,6,6,12,12,12,12,0,0,0
	  byte 0,0,0,0,12,12,12,12,12,12,12,12,0,0,0,0,0,0,0
	  byte 0,0,0,0,0,0,12,12,0,0,12,12,0,0,0,0,0,0,0
firexaxis dw 45
fireyaxis dw 40
fireCount db 0
downMove db 0
tempX dw 45
tempY dw 40
c3 db 70
      array byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      byte 0,0,0,0,0,4,4,4,4,4,0,0,0,0,0,0
      byte 0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0
      byte 0,0,0,0,0Ah,0Ah,0Ah,0Eh,0Eh,0Ah,0Eh,0,0,0,0,0
      byte 0,0,0,0AH,0EH,0AH,0EH,0EH,0EH,0AH,0EH,0EH,0EH,0,0,0
      byte 0,0,0,0AH,0EH,0AH,0AH,0EH,0EH,0EH,0AH,0EH,0EH,0EH,0,0
      byte 0,0,0,0AH,0AH,0EH,0EH,0EH,0EH,0AH,0AH,0AH,0AH,0,0,0
      byte 0,0,0,0,0,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0,0,0,0
      byte 0,0,0,0,0AH,0AH,4,0AH,0AH,0AH,0,0,0,0,0,0
      byte 0,0,0,0AH,0AH,0AH,4,0AH,0AH,4,0AH,0AH,0AH,0,0,0
      byte 0,0,0AH,0AH,0AH,0AH,4,4,4,4,0AH,0AH,0AH,0AH,0,0
      byte 0,0,0EH,0EH,0AH,4,0EH,4,4,0EH,4,0AH,0EH,0EH,0,0
      byte 0,0,0EH,0EH,0EH,4,4,4,4,4,4,0EH,0EH,0EH,0,0
      byte 0,0,0EH,0EH,4,4,4,0,0,4,4,4,0EH,0EH,0,0
      byte 0,0,0,0,4,4,4,0,0,4,4,4,0,0,0,0
      byte 0,0,0,0AH,0AH,0AH,0,0,0,0,0AH,0AH,0AH,0,0,0
      byte 0,0,0AH,0AH,0AH,0AH,0,0,0,0,0AH,0AH,0AH,0AH,0,0
      byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Lxaxis word 24
Upyaxis word 180
Downyaxis word 200
Rxaxis word 40
x word 24
y word 180

Godown db 0
DownCollide db 0
RightCollide db 0
LeftCollide db 0
.code
clear macro
mov ah,0
mov al,13h
int 10h
endm
; Proc for creating the heart
creatheart proc uses ax bx cx
mov si,0
mov heartyaxis,130
mov count,11
	loop1:
		mov count1,13
		loop2:
			mov cx,heartxaxis
			mov dx,heartyaxis
			mov al,heart[si]
			mov ah,0ch
			int 10h
			inc si
			inc heartxaxis
			dec count1
			cmp count1,0
			jne loop2
			mov heartxaxis,240
			inc heartyaxis
			dec count
			cmp count,0
			jne loop1
			ret
creatheart endp
;Proc for creating the heart ends here
ExtraJumps proc uses ax bx cx
 mov Lxaxis,bx
    mov bx,y
    mov Upyaxis,bx
    call CreateMario   ;  calling all the functions for creating the character , hurdles, flags and enemy during the jump
    call CreateFlag    ;
    call CreateAllHurdles  ;
    .if Level3==1
        call createnemy2
         .if downMove==1
        inc fireyaxis
        call creatfire
        mov bx,fireyaxis
        add bx,14
        .if bx>=200
            mov downMove,0
            mov bx,tempX
            clear
            mov firexaxis,bx
            mov fireyaxis,40
        .endif
    .endif
        call MoveEnemy2
    .endif
    .if Level2==1
    call creatheart
    call createEnemy
    call MoveEnemy
    call CollisonWithEnemy
  .endif
ret
ExtraJumps endp
; proc for displaying multidigit number
multi_digit proc uses ax
        mov var,10 
        mov dx,0  
        mov cx,0  
        mov pos,6
        mod1:
            mov dx,0
            div var 
            push dx 
            inc cx
            cmp ax,0  
            jne mod1
        print:
            mov ah,02h
            mov dh,0
            mov dl,pos
            int 10h
            pop dx
            add dl,48
            mov ah,02h
            int 21h
            inc pos
            loop print
        mov ax,0
        ret
multi_digit endp

Start proc uses ax dx 
mov ah,02h
	mov dh,8 ;Row number
	mov dl,47 ;Column number
	int 10h
    mov ah,09h
	mov dx,offset welcome
	int 21h
    mov ah,02h
    mov dh,10 ;Row number
	mov dl,47 ;Column number
	int 10h
    mov ah,09h
	mov dx,offset Enter1
	int 21h
    
    mov ah,02h
    mov dh,10 ;Row number
	mov dl,63 ;Column number
	int 10h
    mov ah,3fh
    mov dx,offset Name1
    int 21h
ret
Start endp
SLDisplay proc uses ax bx cx dx   ; used for display score and lives
mov ah,02h
mov dh,0
mov dl,0
int 10h
mov ah,09h
mov dx, offset score
int 21h


mov ax,points
call multi_digit

mov ah,02h
mov dh,1
mov dl,0
int 10h
mov ah,09h
mov dx,offset lives
int 21h

mov ah,02h
mov dh,1   
mov dl,6
int 10h
mov ah,02h
mov dl,Life
add dl,48
int 21h
ret
SLDisplay endp

MoveEnemy proc
.if RightMove==1
        inc enemyX
    
        dec c1
        .if c1==0
            mov RightMove,0
        .endif
    .endif
    .if RightMove==0
        dec enemyX
   
        inc c1
        .if c1==37
            mov RightMove,1
        .endif
    .endif
ret
MoveEnemy endp

CollisonWithEnemy proc uses ax bx dx
.if Downyaxis>=180
        mov bx,enemyX
        sub bx,10
        mov dx,enemyX
        add dx,15
        .if (Rxaxis>=bx && Lxaxis<=dx)
            
                mov Lxaxis,24
                mov Rxaxis,4
                mov Upyaxis,180
                mov Downyaxis,200
                mov x,24
                mov y,180
                mov Level2,1
                clear
                dec Life
        .endif
    .endif


ret 
CollisonWithEnemy endp

createnemy2 proc uses ax bx cx
mov si,0

mov count,22
mov enemy2Y,25

mov bx,enemy2X
 enemy2loop1:
	mov count1,32
	enemy2loop2:
		mov cx,enemy2X
		mov dx,enemy2Y
		mov al,enemy2[si]
		mov ah,0ch
		int 10h
		inc si
		inc enemy2X
		dec count1
		cmp count1,0
		jne enemy2loop2
		mov enemy2X,bx
		inc enemy2Y
		dec count
		cmp count,0
		jne enemy2loop1
		ret
	createnemy2 endp
MoveEnemy2 proc uses ax bx cx
    .if RightMove1==1
        inc enemy2X
        inc tempX
        .if downMove==0
            inc firexaxis
            
        .endif
        .if enemy2X>=109
            mov downMove,1
            mov bx,firexaxis
            mov tempX,bx
            
        .endif
        dec c2
        .if c2==0
            mov RightMove1,0
        .endif
    .endif
    .if RightMove1==0
        dec enemy2X
         dec tempX
        .if downMove==0
            dec firexaxis
           
        .endif
        inc c2
        .if c2==170
            mov RightMove1,1
        .endif
    .endif
    inc fireCount
    ret
    MoveEnemy2 endp

    creatfire proc uses ax bx cx
mov si,0
mov count,14
mov bx,fireyaxis
mov dx,firexaxis
	fireloop1:
        push dx
		mov count1,19
		fireloop2:
			mov cx,firexaxis
			mov dx,fireyaxis
			mov al,fire[si]
			mov ah,0ch
			int 10h
			inc si
			inc firexaxis
			dec count1
			cmp count1,0
			jne fireloop2
            pop dx
			mov firexaxis,dx
			inc fireyaxis
			dec count
			cmp count,0
			jne fireloop1
            mov fireyaxis,bx
			ret
			creatfire endp

MoveFire proc
ret
MoveFire endp

CreateFlag proc uses ax bx 
    push count
    push count1
    mov flagxaxis,285
    mov flagyaxis,64
    mov si,0
    mov count,22
 flag1:
	mov count1,31
	flag2:
		mov cx,flagxaxis
		mov dx,flagyaxis
		mov al,flag[si]
		mov ah,0ch
		int 10h
		inc si
		inc flagxaxis
		dec count1
		cmp count1,0
		jne flag2
		mov flagxaxis,285
		inc flagyaxis
		dec count
		cmp count,0
		jne flag1

mov flagxaxis ,310
mov flagyaxis ,86
mov si,0
mov count,118
 pole1:
	mov si,0
	mov count1,4
	pole2:
		mov cx,flagxaxis
		mov dx,flagyaxis
		mov al,flagpole[si]
		mov ah,0ch
		int 10h
		inc si
		inc flagxaxis
		dec count1
		cmp count1,0
		jne pole2
		mov flagxaxis,310
		inc flagyaxis
		dec count
		cmp count,0
		jne pole1
        pop count
        pop count1
		ret
	CreateFlag endp

CreateMario proc uses ax bx cx 

mov count,20
mov si,0
loop1:
    
    mov count1,16
    loop2:
        mov cx,Lxaxis  ; 100
        mov dx,Upyaxis  ; 180
        mov al,array[si] 
        mov ah,0ch
        int 10h
        inc Lxaxis
        inc si
        dec count1
        cmp count1,0
        jne loop2
    mov bx,x
    mov Lxaxis,bx
    inc Upyaxis
    dec count
    cmp count,0
    jne loop1

ret
CreateMario endp

createEnemy proc uses ax bx cx
mov enemyCountX,15
mov enemyCountY,20
mov bx,enemyX
mov enemyY,180
mov si,0
enemyLoop1:
    mov enemyCountY,20
    enemyLoop2:
        mov cx,enemyX
        mov dx,enemyY    
        mov al,enemy[si]
        mov ah,0ch
        int 10h
        inc enemyX
        inc si
        
        dec enemyCountY
        cmp enemyCountY,0
        jne enemyLoop2
    mov enemyX,bx
    inc enemyY
    dec enemyCountX
    cmp enemyCountX,0
    jne enemyLoop1
    
    ret
    createEnemy endp
DownCollision proc
    mov DownCollide,0
    .if (Downyaxis>=159 && Rxaxis>=46 && Lxaxis<=92)  ;  Collision for the 1st hurdle on the down side
        mov DownCollide,1
    .endif
    .if (Downyaxis>=172 && Rxaxis>=134 && Lxaxis<=178) ;  Collision for the 2nd hurdle on the down side
        mov DownCollide,1
   .endif
   .if (Downyaxis>=148 && Rxaxis>=218 && Lxaxis<=259) ;  Collision for the 3rd hurdle on the down side
        mov DownCollide,1
    .endif
ret 
DownCollision endp   
LeftCollision proc 
    mov LeftCollide,0
    .if (Downyaxis>=161 && Rxaxis>=48 && Lxaxis<=92);  Collision for the 1st hurdle on the left side
                mov LeftCollide,1
    .endif
    .if (Downyaxis>=174 && Rxaxis>=136 && Lxaxis<=182) ;  Collision for the 2nd hurdle on the left side
        mov LeftCollide,1
    .endif
    .if (Downyaxis>=152 && Rxaxis>=218) ;  Collision for the 3rd hurdle on the left side
        mov bx,Rxaxis
        add bx,33
        .if(bx<=295)
            mov LeftCollide,1
        .endif
    .endif
ret
LeftCollision endp
RightCollison proc uses bx
    mov RightCollide,0
    .if (Downyaxis>=161)  ;  Collision for the 1st hurdle on the right side
        .if Lxaxis<=90
            .if Rxaxis>=46
                mov RightCollide,1
            .endif
        .endif
    .endif
    .if(Downyaxis>=174) ;  Collision for the 2nd hurdle on the right side
        .if (Rxaxis>=134)
            mov bx,Rxaxis
            add bx,33
            .if (bx<=180)
                 mov RightCollide,1
            .endif
        .endif
    .endif
    .if (Downyaxis>=152 && Rxaxis>=216)  ;  Collision for the 3rd hurdle on the right side
        mov bx,Rxaxis
        add bx,33
        .if(bx<=261)
            mov RightCollide,1
        .endif
    .endif

ret
RightCollison endp
DownMario proc uses ax bx cx
    Down1:
         call DownCollision
        .if DownCollide==1
            jmp _ret
        .endif
        add y,2
        add Downyaxis,2
        mov bx,y
        mov Upyaxis,bx
        
        call CreateMario 
        call CreateAllHurdles
        call CreateFlag
        .if Level3==1
            call createnemy2
             
            call MoveEnemy2
            .if downMove==1
                inc fireyaxis
                call creatfire
                mov bx,fireyaxis
                add bx,14
                .if bx>=200
                    mov downMove,0
                    mov bx,tempX
                    clear
                    mov firexaxis,bx
                    mov fireyaxis,40
                .endif
            .endif
        .endif
        .if Level2==1
            call creatheart
            call createEnemy
            call MoveEnemy
            call CollisonWithEnemy
        .endif
        mov bx,y
        mov Upyaxis,bx
        cmp Downyaxis,200
        jbe Down1
    _ret:
ret
DownMario endp

JumpMario proc uses ax bx cx
  
    mov count1,35
    jump1: 
    push count1
    sub y,2         
    sub Downyaxis,2  
    mov ah,11h      ; checking if any key is pressed during the jump
    int 16h
    jnz checkRight
    jmp goahead3
    checkRight: 
    mov ah,10h
    int 16h
    cmp ah,4Dh
    jne checkLeft
    call RightCollison
    .if RightCollide==1
        jmp goahead3
    .endif
    mov cx,3
    jump2:
        push cx
        add x,2
        add Rxaxis,2
        mov bx,x
   call ExtraJumps
  pop cx
  loop jump2
        
   
    checkLeft:
    cmp ah,4Bh
    jne goahead3
    call LeftCollision
    .if LeftCollide==1
        jmp goahead3
    .endif
    mov cx,3
    jump3:
        push cx
        sub x,2
        sub Rxaxis,2
        mov bx,x
   call ExtraJumps
  pop cx
  loop jump3
    
    goahead3:
    call ExtraJumps
    pop count1
    dec count1
    cmp count1,0
    jne jump1
   
ret
JumpMario endp
Movement proc uses bx
mov ah,10h
int 16h
;checking if the right-key is pressed
cmp ah,4Dh
jne n1

mov bx,x
mov Rxaxis,bx
mov bx,y
mov Upyaxis,bx
call DownCollision
.if DownCollide==0
    .if Downyaxis<180
        call DownMario
    .endif
.endif

.if Rxaxis>=290
mov Lxaxis,24
mov Rxaxis,4
mov Upyaxis,180
mov Downyaxis,200
mov x,24
mov y,180
.if Level2==0
mov Level2,1
.elseif Level3==0
    mov Level3,1
.elseif GameEnd==0
    mov GameEnd,1
.endif
 clear
jmp n4
.endif
                          ; code for stopping at the 1st hurdle ends here
call RightCollison
.if RightCollide==1
    mov RightCollide,0
    jmp n4
.endif   

    
goahead:
add x,2
add Rxaxis,2
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx

jmp n4


n1:
cmp ah,4Bh   ; checking if the left-key is pressed
jne n2
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx
call DownCollision
.if DownCollide==0
    .if Downyaxis<180
        call DownMario
    .endif
.endif
cmp x,0
jbe n4
call LeftCollision
.if LeftCollide==1
    mov LeftCollide,0
    jmp n4
.endif


goahead1:
cmp x,0
jbe n4
sub x,2
sub Rxaxis,2
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx

jmp n4

; Checking if the up-key is pressed
n2: 
cmp ah,48h 
jne n3
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx
cmp y,0 ; checking if mario is at the top
jbe n4 

call JumpMario
call DownMario
mov bx,y
mov Upyaxis,bx
mov bx,x
mov Lxaxis,bx

jmp n4
; Checking if the down-key is pressed
n3:
cmp ah,50h
jne n4
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx
call DownCollision
.if DownCollide==1
    jmp n4
.endif


goahead2:
cmp Downyaxis,200
jae n4         
add y,2
add Downyaxis,2
mov bx,y
mov Upyaxis,bx
mov bx,x
mov Lxaxis,bx
;.if Level2

        
 ;   .endif
         ;mov Lxaxis,24
          ;      mov Rxaxis,4
              ;  mov Upyaxis,180
           ;     mov Downyaxis,200
               ; mov x,24
            ;    mov y,180
               ; mov Level2,1
             ;   clear
              ;  jmp n4
;    .endif
;.endif
   




n4:
ret 
Movement endp

ClearTheScreen proc uses ax bx cx      ; for blacking the position of the mario
mov count,16
mov si,0
loop1:
    mov count1,12
    loop2:
        mov cx,Lxaxis  ; 100
        mov dx,Upyaxis  ; 180
        mov al,0
        mov ah,0ch
        int 10h
        inc Lxaxis
        inc si
        dec count1
        cmp count1,0
        jne loop2
    mov bx,x
    mov Lxaxis,bx
    inc Upyaxis
    dec count
    cmp count,0
    jne loop1
ret
ClearTheScreen endp

Hurdle proc uses ax    ; Proc for creating a single hurdles, this will be called in another proc to         
                       ; create a total of three hurdles
mov count,10  
upper1:           
    mov bx,FixHurdX
    mov HurdX,bx
    mov si,0
    mov count1,33
    Multiple:
        mov cx,HurdX
        mov dx,HurdY
        mov al,upperPort[si]
        mov ah,0ch
        int 10h
        inc HurdX
        inc si
        dec count1
        cmp count1,0
        jne Multiple
    inc HurdY
    dec count
    cmp count,0
    jne upper1
mov count,33
mov bx,FixHurdX
    mov HurdX,bx
blackloop1:
    mov cx,HurdX
    mov dx,HurdY
    mov al,0
    mov ah,0ch
    int 10h
    inc HurdX
    dec count
    cmp count,0
    jne blackloop1
inc HurdY
mov bx,FixHurdX
mov HurdX,bx
mov bx,FixCount1
mov count,bx
lower1:
mov si,0
mov count1,33
Multiple2:
    mov cx,HurdX
    mov dx,HurdY
    mov al,lowerPort[si]
    mov ah,0ch
    int 10h
    inc HurdX
    inc si
    dec count1
    cmp count1,0
    jne Multiple2
mov bx,FixHurdX
mov HurdX,bx
inc HurdY
dec count
cmp count,0
jne lower1
ret
Hurdle endp   ; Code for 1 hurdle ends here
    
CreateAllHurdles proc uses ax bx cx dx
; for creating the 1st hurdle
mov FixCount1,33
mov FixHurdX,60
mov HurdY,160  ; 160 + 10 (size of the upper portion) + 1 (size of the blackSpace) + 33 (size of the lower portion) = 204 (total height of the screen)
call Hurdle

; for creating the 2nd hurdle
mov FixCount1,21
mov FixHurdX,150
mov HurdY, 172
call Hurdle

; for creating the 3rd hurdle
mov FixCount1,45
mov FixHurdX,230
mov HurdY,148
call Hurdle

ret 
CreateAllHurdles endp

main proc
mov ax,@data
mov ds,ax
clear ; 

    call Start ; Display at the Start of the Game
    clear

.if fireCount==5
       
    .endif
   
display:    
.if Life>0
call SLDisplay
.if GameEnd==1
    jmp Over
.endif
.if Level3==1 ;                                      still in doubt
    call createnemy2
    call MoveEnemy2
    .if downMove==1
        inc fireyaxis
        call creatfire
        mov bx,fireyaxis
        add bx,14
        .if bx>=200
            mov downMove,0
            mov bx,tempX
            clear
            mov firexaxis,bx
            mov fireyaxis,40
        .endif
    .endif

    
.endif
.if Level2==1 
    call creatheart
    call createEnemy
    call MoveEnemy
    call CollisonWithEnemy
  .endif
ComeOn:
call CreateFlag
call CreateAllHurdles ; creating all the hurdles
call CreateMario

; checking if a key is pressed
mov ah,11h
int 16h
jnz checkey
mov bx,x
mov Lxaxis,bx
mov bx,y
mov Upyaxis,bx
jmp display

checkey:
call Movement
mov bx,y   ; y Upyaxis changes
mov Upyaxis,bx

jmp display
.endif 
Over:
clear
    mov ah,02h
    mov dh,9 ;Row number
	mov dl,55 ;Column number
	int 10h
    mov ah,09h
    mov ah,09h
    mov dx,offset Gameover
    int 21h
mov ah,4ch
int 21h

main endp
end main