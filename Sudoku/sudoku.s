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
    .equ Left_LED, 0x02
    .equ Right_LED, 0x01
    .equ SWI_SETLED, 0x201

@r3 contains row r4 contains column and r5 contains data
@r6 contains the total number of boxes filled

.text


initial_display:

ldr r7,=A0
ldr r8,=A1
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#0
mov r0,#0

loopA:
@display first row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopA

ldr r8,=A2
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#1
mov r0,#0

loopB:
@display second row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopB

ldr r8,=A3
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#2
mov r0,#0

loopC:
@display third row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopC

ldr r8,=A4
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#3
mov r0,#0

loopD:
@display fourth row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopD

ldr r8,=A5
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#4
mov r0,#0

loopE:
@display fifth row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopE

ldr r8,=A6
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#5
mov r0,#0

loopF:
@display sixth row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopF

ldr r8,=A7
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#6
mov r0,#0

loopG:
@display seventh row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopG

ldr r8,=A8
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#7
mov r0,#0

loopH:
@display eighth row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopH

ldr r8,=A9
str r8,[r7]
add r7,r7,#4
mov r9,#0
mov r1,#8
mov r0,#0

loopI:
@display ninth row
mov r2,#0
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loopI
b starting_stage


starting_stage:

@opening the file
ldr r0,=InFileName     
mov r1,#0           
swi SWI_Open            
ldr r1,=InputFileHandle         
str r0,[r1]                

@reading the integers
mov r3,#1
outer_loop:
mov r4,#1
inner_loop:
ldr r0,=InputFileHandle     
ldr r0,[r0] 
swi SWI_RdInt           
mov r5,r0
bl update_start_stage
add r4,r4,#1
cmp r4,#9
ble inner_loop
add r3,r3,#1
cmp r3,#9
ble outer_loop

@closing the file
ldr r0, =InputFileHandle     
ldr r0,[r0]            
swi SWI_Close
b display


update_start_stage:
@yahan r0,r3,r4,r5 nhi chhedna h
ldr r7,=A0
mov r1,r3
sub r1,r1,#1
mov r2,#4
mul r1,r2,r1
@offset for getting Ai
add r7,r7,r1
@r0 has address of first element of row
mov r1,r4
sub r1,r1,#1
mul r1,r2,r1
add r7,r7,r1
str r5,[r7]
add r6,r6,#1
mov pc,lr

takeinputx:
mov r0,#0
swi SWI_SETLED
mov r11,#0
swi SWI_CheckBlue
cmp r0,#0
beq takeinputx
swi SWI_CLEAR_DISPLAY
cmp r0,BLUE_KEY_00
beq Zero
cmp r0,BLUE_KEY_01
beq One
cmp r0,BLUE_KEY_02
beq Two
cmp r0,BLUE_KEY_03
beq Three
cmp r0,BLUE_KEY_04
beq Four
cmp r0,BLUE_KEY_05
beq Five
cmp r0,BLUE_KEY_06
beq Six
cmp r0,BLUE_KEY_07
beq Seven
cmp r0,BLUE_KEY_08
beq Eight
b invalid_input

takeinputy:
mov r11,#1
swi SWI_CheckBlue
cmp r0,#0
beq takeinputy
cmp r0,BLUE_KEY_00
beq Zero
cmp r0,BLUE_KEY_01
beq One
cmp r0,BLUE_KEY_02
beq Two
cmp r0,BLUE_KEY_03
beq Three
cmp r0,BLUE_KEY_04
beq Four
cmp r0,BLUE_KEY_05
beq Five
cmp r0,BLUE_KEY_06
beq Six
cmp r0,BLUE_KEY_07
beq Seven
cmp r0,BLUE_KEY_08
beq Eight
b invalid_input

takeinputd:
mov r11,#2
swi SWI_CheckBlue
cmp r0,#0
beq takeinputd
cmp r0,BLUE_KEY_00
beq Zero
cmp r0,BLUE_KEY_01
beq One
cmp r0,BLUE_KEY_02
beq Two
cmp r0,BLUE_KEY_03
beq Three
cmp r0,BLUE_KEY_04
beq Four
cmp r0,BLUE_KEY_05
beq Five
cmp r0,BLUE_KEY_06
beq Six
cmp r0,BLUE_KEY_07
beq Seven
cmp r0,BLUE_KEY_08
beq Eight
b invalid_input

Zero:
cmp r11,#0
moveq r3,#1
cmp r11,#1
moveq r4,#1
cmp r11,#2
moveq r5,#1
b valid_inputs

One:
cmp r11,#0
moveq r3,#2
cmp r11,#1
moveq r4,#2
cmp r11,#2
moveq r5,#2
b valid_inputs

Two:
cmp r11,#0
moveq r3,#3
cmp r11,#1
moveq r4,#3
cmp r11,#2
moveq r5,#3
b valid_inputs

Three:
cmp r11,#0
moveq r3,#4
cmp r11,#1
moveq r4,#4
cmp r11,#2
moveq r5,#4
b valid_inputs

Four:
cmp r11,#0
moveq r3,#5
cmp r11,#1
moveq r4,#5
cmp r11,#2
moveq r5,#5
b valid_inputs

Five:
cmp r11,#0
moveq r3,#6
cmp r11,#1
moveq r4,#6
cmp r11,#2
moveq r5,#6
b valid_inputs

Six:
cmp r11,#0
moveq r3,#7
cmp r11,#1
moveq r4,#7
cmp r11,#2
moveq r5,#7
b valid_inputs

Seven:
cmp r11,#0
moveq r3,#8
cmp r11,#1
moveq r4,#8
cmp r11,#2
moveq r5,#8
b valid_inputs

Eight:
cmp r11,#0
moveq r3,#9
cmp r11,#1
moveq r4,#9
cmp r11,#2
moveq r5,#9
b valid_inputs

invalid_input:
mov r0,#Left_LED
swi SWI_SETLED
b takeinputx

valid_inputs:
mov r0,#Right_LED
swi SWI_SETLED
b check_valid

check_valid:
mov r0,#0
swi SWI_SETLED
b check_valid_move

display:

ldr r8,=A1
mov r9,#0
mov r1,#0
mov r0,#0

loop1:
@display first row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop1

ldr r8,=A2
mov r9,#0
mov r1,#1
mov r0,#0

loop2:
@display second row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop2

ldr r8,=A3
mov r9,#0
mov r1,#2
mov r0,#0

loop3:
@display third row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop3

ldr r8,=A4
mov r9,#0
mov r1,#3
mov r0,#0

loop4:
@display fourth row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop4

ldr r8,=A5
mov r9,#0
mov r1,#4
mov r0,#0

loop5:
@display fifth row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop5

ldr r8,=A6
mov r9,#0
mov r1,#5
mov r0,#0

loop6:
@display sixth row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop6

ldr r8,=A7
mov r9,#0
mov r1,#6
mov r0,#0

loop7:
@display seventh row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop7

ldr r8,=A8
mov r9,#0
mov r1,#7
mov r0,#0

loop8:
@display eighth row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop8

ldr r8,=A9
mov r9,#0
mov r1,#8
mov r0,#0

loop9:
@display ninth row
ldr r2,[r8]
swi SWI_DRAW_INT
add r0,r0,#1
ldr r2,=bar
swi SWI_DRAW_STRING
add r0,r0,#1
add r8,r8,#4
add r9,r9,#1
cmp r9,#9
blt loop9
b check_end_game


check_valid_move:
@checking in row
ldr r0,=A0
mov r1,r3
sub r1,r1,#1
mov r2,#4
mul r1,r2,r1
@offset for getting Ai
add r0,r0,r1
@r0 has address of first element of row
mov r1,#1

loop_row:
ldr r2,[r0]
cmp r2,r5
bne break_r
cmp r1,r3
bne invalid_move
break_r:
add r0,r0,#4
add r1,r1,#1
cmp r1,#9
ble loop_row

@checking in column
mov r1,r4
sub r1,r1,#1
mov r2,#4
mul r1,r2,r1
ldr r0,=A0
mov r2,#1

loop_col:
ldr r8,[r0]
ldr r7,[r8,r1]
cmp r7,r5
bne break_c
cmp r2,r5
bne invalid_move
break_c:
add r0,r0,#4
add r2,r2,#1
cmp r2,#9
ble loop_col

@checking in 3*3 grid
@you can use any register except r3,r4,r5,r6
ldr r0,=A0
@now calculate the row i.e 1st or 4th or 7th
@we will move that data in register r1
cmp r3,#1
moveq r1,#1
cmp r3,#2
moveq r1,#1
cmp r3,#3
moveq r1,#1
cmp r3,#4
moveq r1,#4
cmp r3,#5
moveq r1,#4
cmp r3,#6
moveq r1,#4
cmp r3,#7
moveq r1,#7
cmp r3,#8
moveq r1,#7
cmp r3,#9
moveq r1,#7
sub r1,r1,#1
mov r2,#4
mul r1,r2,r1

@now calculate the column i.e 1st or 4th or 7th
@we will move that data in register r2
cmp r4,#1
moveq r2,#1
cmp r4,#2
moveq r2,#1
cmp r4,#3
moveq r2,#1
cmp r4,#4
moveq r2,#4
cmp r4,#5
moveq r2,#4
cmp r4,#6
moveq r2,#4
cmp r4,#7
moveq r2,#7
cmp r4,#8
moveq r2,#7
cmp r4,#9
moveq r2,#7
mov r11,r2
sub r2,r2,#1
mov r7,#4
mul r2,r7,r2
@now we have the offset for the top-left element in (r1,r2)
ldr r9,[r0,r1]
@r9 contains the address of the first element of 3*3 grid

mov r7,#1
outer_loop:
@here we will traverse in different row
mov r8,#1
add r0,r0,#4
ldr r9,[r0,r1]
inner_loop:
@here we will traverse a row
ldr r10,[r9]
cmp r10,r5
bne break_inner
cmp r11,r4
bne invalid_move
break_inner:
add r9,r9,#4
add r11,#1
add r8,r8,#1
cmp r8,#3
ble inner_loop
sub r11,r11,#3
add r7,r7,#1
cmp r7,#3
ble outer_loop
b update


update:
ldr r0,=A0
mov r1,r3
sub r1,r1,#1
mov r2,#4
mul r1,r2,r1
@offset for getting Ai
add r0,r0,r1
@r0 has address of first element of row
mov r1,r4
sub r1,r1,#1
mul r1,r2,r1
add r0,r0,r1
str r5,[r0]
add r6,r6,#1
b display


invalid_move:
@display krna h invalid move hai and take input bhi call krna h
swi SWI_CLEAR_DISPLAY
mov r0,#0
mov r1,#0
ldr r2,=invald
swi SWI_DRAW_STRING
resume:
swi SWI_CheckBlack
cmp r0,#0
bne resume
b display


check_end_game:
cmp r6,#81
bne takeinputx
swi SWI_CLEAR_DISPLAY
mov r0,#0
mov r1,#0
ldr r2,=end
swi SWI_DRAW_STRING


.data
A1:  	.space 36
A2:		.space 36
A3:		.space 36	
A4:		.space 36
A5:		.space 36
A6:		.space 36
A7:		.space 36
A8:		.space 36
A9:		.space 36
A0:		.space 36
bar:    .asciz " "
end: 	.asciz "CONGRATS!YOU WON THE GAME"
invald: .asciz "INVALID MOVE.TRY ANOTHER ONE"
InFileName: .asciz "initial.txt"
InputFileHandle: .word 0
.end