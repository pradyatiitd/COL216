    .equ SWI_Exit, 0x11
	.equ SWI_PrInt,0x6b @write an integer
	.equ SWI_Open, 0x66 @Open a file
	.equ SWI_DRAW_STRING, 0x204        @display a string on LCD
	.equ SWI_DRAW_INT,    0x205        @display an int on LCD
	.equ SWI_CLEAR_DISPLAY,0x206        @clear LCD
	.equ SWI_DRAW_CHAR,   0x207        @display a char on LCD
	.equ SWI_Board_Input, 0x203
	.equ SWI_CheckBlue, 0x203
	.equ SWI_Light_Bulb, 0x201
	.equ BLUE_KEY_00, 0x01
	.equ BLUE_KEY_01, 0x02
	.equ BLUE_KEY_02, 0x04
	.equ BLUE_KEY_03, 0x08
	.equ BLUE_KEY_04, 0x10
	.equ BLUE_KEY_05, 0x20
	.equ BLUE_KEY_06, 0x40
	.equ BLUE_KEY_07, 0x80
	.equ BLUE_KEY_08, 1<<8
	.equ BLUE_KEY_09, 1<<9
	.equ BLUE_KEY_10, 1<<10
	.equ BLUE_KEY_11, 1<<11
	.equ BLUE_KEY_12, 1<<12
	.equ BLUE_KEY_13, 1<<13
	.equ BLUE_KEY_14, 1<<14
	.equ BLUE_KEY_15, 1<<15
    .equ SWI_SETSEG8, 0x200
    .equ SEG_A, 0x80
    .equ SEG_B, 0x40
    .equ SEG_C, 0x20
    .equ SEG_D, 0x08
    .equ SEG_E, 0x04
    .equ SEG_F, 0x02
    .equ SEG_G, 0x01
    .equ SEG_P, 0x10
    .equ SWI_LCD_String,0x204
    .equ SWI_GetTicks, 0x6d
    .equ SWI_CheckBlack, 0x202
    
    .text

    mov r11,#1
    ldr r0,=SEG_B|SEG_C
    swi SWI_SETSEG8

display:
    ldr r3,=Line
    ldr r4,=A1
    ldr r10,=A9
    str r4,[r10]
    add r10,r10,#4
    A:
        ldr r0,[r3]
        ldr r2,[r4]
        swi 0X205
        add r3,r3,#4
        add r4,r4,#4
        cmp r0,#7
        bne A

    mov r1,#1
    ldr r3,=Line
    ldr r4,=A2
    str r4,[r10]
    add r10,r10,#4
    H:
        ldr r0,[r3]
        ldr r2,[r4]
        swi 0X205
        add r3,r3,#4
        add r4,r4,#4
        cmp r0,#7
        bne H

mov r1,#2
ldr r3,=Line
ldr r4,=A3
str r4,[r10]
    add r10,r10,#4
B:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne B

mov r1,#3
ldr r3,=Line
ldr r4,=A4
str r4,[r10]
    add r10,r10,#4
C:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne C
mov r1,#4
ldr r3,=Line
ldr r4,=A5
str r4,[r10]
    add r10,r10,#4
D:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne D
mov r1,#5
ldr r3,=Line
ldr r4,=A6
str r4,[r10]
    add r10,r10,#4
E:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne E
mov r1,#6
ldr r3,=Line
ldr r4,=A7
str r4,[r10]
    add r10,r10,#4
F:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne F
mov r1,#7
ldr r3,=Line
ldr r4,=A8
str r4,[r10]
    add r10,r10,#4
G:
    ldr r0,[r3]
    ldr r2,[r4]
    swi 0X205
    add r3,r3,#4
    add r4,r4,#4
    cmp r0,#7
    bne G

    take_inputx:
		swi SWI_CheckBlue
		cmp r0, #0
		beq take_inputx
		cmp r0,#BLUE_KEY_07
		beq Seven
		cmp r0,#BLUE_KEY_06
		beq Six
		cmp r0,#BLUE_KEY_05
		beq Five
		cmp r0,#BLUE_KEY_04
		beq Four
		cmp r0,#BLUE_KEY_03
		beq Three
		cmp r0,#BLUE_KEY_02
		beq Two
		cmp r0,#BLUE_KEY_01
		beq One
		cmp r0,#BLUE_KEY_00
		beq Zero
Zero:
	mov r2,#1
	b take_inputy
One:
	mov r2,#2
	b take_inputy
Two:
	mov r2,#3
	b take_inputy
Three:
	mov r2,#4
	b take_inputy
Four:
	mov r2,#5
	b take_inputy
Five:
	mov r2,#6
	b take_inputy
Six:
	mov r2,#7
	b take_inputy
Seven:
	mov r2,#8
	b take_inputy


	take_inputy:
		swi SWI_CheckBlue
		cmp r0, #0
		beq take_inputy
		cmp r0,#BLUE_KEY_15
		beq Fifteen
		cmp r0,#BLUE_KEY_14
		beq Fourteen
		cmp r0,#BLUE_KEY_13
		beq Thirteen
		cmp r0,#BLUE_KEY_12
		beq Twelve
		cmp r0,#BLUE_KEY_11
		beq Eleven
		cmp r0,#BLUE_KEY_10
		beq Ten
		cmp r0,#BLUE_KEY_09
		beq Nine
		cmp r0,#BLUE_KEY_08
		beq Eight
		
Eight:
	mov r3,#1
	b main2
Nine:
	mov r3,#2
	b main2
Ten:
	mov r3,#3
	b main2
Eleven:
	mov r3,#4
	b main2
Twelve:
	mov r3,#5
	b main2
Thirteen:
	mov r3,#6
	b main2
Fourteen:
	mov r3,#7
	b main2
Fifteen:
	mov r3,#8
	b main2

main2:
    cmp r2,#1
    beq case1
    cmp r2,#2
    beq case1
    cmp r2,#7
    beq case2
    cmp r2,#8
    beq case2
    cmp r3,#1
    beq case3
    cmp r3,#2
    beq case3
    cmp r3,#7
    beq case4
    cmp r3,#8
    beq case4
    b case5

case1:
    cmp r3,#1
    beq case1a
    cmp r3,#2
    beq case1a
    cmp r3,#7
    beq case1b
    cmp r3,#8
    beq case1b
    b case1c
 
case2:
    cmp r3,#1
    beq case2a
    cmp r3,#2
    beq case2a
    cmp r3,#7
    beq case2b
    cmp r3,#8
    beq case2b
    b case2c

case3:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a2
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a3

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a2
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a3
    b invalid_move
    
case4:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b3

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4 
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b3
    b invalid_move

case5:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a2

    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b3

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4 
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b3

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a2
    b invalid_move

case1a:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a1

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a2
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a3
    b invalid_move
    

case1b:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b1

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4 
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b3
    b invalid_move
    

case1c:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b1

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4 
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1b3

    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a1

    mov r5,r2
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate1a2
    b invalid_move

case2a:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a2
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a3
    b invalid_move
    
case2b:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b2
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b3
    b invalid_move

case2c:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    add r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    add r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a2
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2a3

    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,#0
    bne take_inputx
    sub r5,r5,#8
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b1

    mov r5,r2
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#3
    mov r6,#4
    mul r5,r6,r5
    ldr r6,[r4,r5]
    cmp r6,r11
    beq validate2b2
    b invalid_move
    
validate1a1:
    sub r5,r5,#4
    str r11,[r4,r5]
    sub r5,r5,#4
    str r11,[r4,r5]
    b chance_change

validate1a2:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate1a3:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate1b1:
    add r5,r5,#4 
    str r11,[r4,r5]
    add r5,r5,#4
    str r11,[r4,r5]
    b chance_change

validate1b2:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate1b3:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate2a1:
    sub r5,r5,#4
    str r11,[r4,r5]
    sub r5,r5,#4
    str r11,[r4,r5]
    b chance_change

validate2a2:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate2a3:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change

validate2b1:
    add r5,r5,#4
    str r11,[r4,r5]
    add r5,r5,#4
    str r11,[r4,r5]
    b chance_change

validate2b2:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change    

validate2b3:
    mov r5,r2
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]

    mov r5,r2
    sub r5,r5,#2
    mov r6,#4
    mul r5,r6,r5
    ldr r6,=A9
    ldr r4,[r6,r5]
    mov r5,r3
    sub r5,r5,#1
    mov r6,#4
    mul r5,r6,r5
    str r11,[r4,r5]
    b chance_change


chance_change:
cmp r11,#1
beq twoa
mov r11,r0
ldr r0,=SEG_B|SEG_C
swi SWI_SETSEG8
mov r0,r11
mov r11,#1
b outa
twoa:
mov r11,r0
ldr r0,=SEG_A|SEG_B|SEG_F|SEG_E|SEG_D
swi SWI_SETSEG8
mov r0,r11
mov r11,#2
outa:
b display

invalid_move:
cmp r11,#1
bne two
mov r11,r0
ldr r0,=SEG_B|SEG_C|SEG_P
swi SWI_SETSEG8
mov r0,r11
mov r11,#1
b out
two:
mov r11,r0
ldr r0,=SEG_A|SEG_B|SEG_F|SEG_E|SEG_D|SEG_P
swi SWI_SETSEG8
mov r0,r11
mov r11,#2
out:
b take_inputx

swi SWI_Exit


.data
A1: .word 0,0,0,0,0,0,0,0
A2: .word 0,0,0,0,0,0,0,0
A3: .word 0,0,0,0,0,0,0,0
A4: .word 0,0,0,1,2,0,0,0
A5: .word 0,0,0,2,1,0,0,0
A6: .word 0,0,0,0,0,0,0,0
A7: .word 0,0,0,0,0,0,0,0
A8: .word 0,0,0,0,0,0,0,0
Line: .word 0,1,2,3,4,5,6,7,8
A9: .space 32

.end




