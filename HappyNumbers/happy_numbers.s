    .equ SWI_Open, 0x66 @open a file
    .equ SWI_Close,0x68 @close a file
    .equ SWI_PrChr,0x00 @ Write an ASCII char to Stdout
    .equ SWI_PrStr, 0x69 @ Write a null-ending string
    .equ SWI_PrInt,0x6b @ Write an Integer
    .equ SWI_RdInt,0x6c @ Read an Integer from a file
    .equ Stdout, 1 @ Set output target to be Stdout
    .equ SWI_Exit, 0x11 @ Stop execution
    .text

main: @r10,r1,r5,
    bl open_file
    mov r10,#0 @j=0
    ldr r0,=x
    ldr r1,=one_arr
    bl copy_bcd
    mov r9, #100
    mov r5, #100
    mul r5,r9,r5
    sub r5,r5,#1
    
    Loop:
    ldr r1,=x
    ldr r11,[r1]	
    ldr r0,=y
    bl copy_bcd
    ldr r11,[r1]	
    A:
        bl check_gt1
        cmp r3,#1
        bne AA
        ldr r0,=s
        ldr r1,=y
        bl sum_square
        ldr r1,=s
        ldr r0,=y
        bl copy_bcd
        b A
    AA:
        ldr r0,=y
        bl check_happy
        cmp r3,#1
        bne XX
        add r10,r10,#1
        
        @printf("number[%i] = %i%i%i%i \n", j, x[3], x[2], x[1], x[0])
        bl Print_text
    XX:
        ldr r0,=x
	ldr r11,[r0]	
        ldr r1,=x 
	ldr r11,[r1]	
        ldr r2,=one_arr
        bl add_BCD
	ldr r11,[r0,#12]
	ldr r11,[r0,#8]	

	ldr r11,[r0,#4]
	ldr r11,[r0]	
	
        sub r5,r5,#1
        cmp r5,#0   
        bne Loop
        bhs Close_file
        ldr r0,=FileHandle
        ldr r0,[r0]
        mov r1,#0
        swi SWI_PrInt 
        bl exit 

Print_text:
    stmfd r13!, {r5,lr}
    ldr r0,=FileHandle
    ldr r0,[r0]
    ldr r1,=number
    swi SWI_PrStr
    mov r1,r10
    swi SWI_PrInt
    ldr r1,=isequal
    swi SWI_PrStr
    ldr r4,=x
    ldr r1,[r4,#12]
    swi SWI_PrInt
    ldr r1,[r4,#8]
    swi SWI_PrInt
    ldr r1,[r4,#4]
    swi SWI_PrInt
    ldr r1,[r4]
    swi SWI_PrInt
    ldr r1,=newline
    swi SWI_PrStr
    ldmfd r13!, {r5,pc}



open_file:
    ldr r0,=FileName
    mov r1,#1
    swi SWI_Open
    ldr r1,=FileHandle
    str r0,[r1]
    mov pc,lr

Close_file:
    ldr r0,=FileHandle
    ldr r0,[r0]
    swi SWI_Close

exit:
    swi SWI_Exit

check_happy:
    ldr r2,[r0]
    cmp r2,#1
    beq W
    cmp r2,#7
    beq W
    mov r3,#0
    mov pc,lr
    W:
        mov r3,#1
        mov pc,lr


copy_bcd:
    stmfd r13!,{lr}
    mov r2,#4
    first: 
        ldr r3,[r1]
        str r3,[r0]
        add r0,r0,#4
        add r1,r1,#4
        subs r2,r2,#1
        cmp r2,#0
        bne first
        sub r0,r0,#16
        sub r1,r1,#16
    ldmfd r13!,{pc}

check_gt1:@r0=x
    ldr r2,[r0,#4]
    cmp r2,#0
    bgt CCC
    ldr r3,[r0, #8]	
    cmp r3,#0
    bgt CCC
    ldr r4,[r0, #12]
    cmp r4,#0
    bgt CCC
    mov r3,#0
    mov pc,lr
    CCC:
    mov r3,#1
    mov pc,lr


sum_square:@r9,r0
    stmfd sp!, {lr}
    ldr r7,=dd
    stmfd r13!, {r1}
    ldr r1,=zero_arr
    bl copy_bcd @r0=s
    ldmfd r13!, {r1} 
    mov r9,#4
    AAA:
        ldr r2,[r1]
        bl square_digit @DD=R7,R0=S,R1=y
        stmfd r13!,{r1,r9}
        ldr r2,=dd
        ldr r1,=s
	
        bl add_BCD
	
        ldmfd r13!,{r1,r9}
        sub r9,r9,#1
        add r1,r1,#4 
        cmp r9,#0
        bne AAA
        ldmfd sp!, {pc}    

add_BCD:@r0 is reult arr and r1, r2 is y and z
    stmfd sp!, {r5,r7,lr}
    mov r4,#0
    mov r9,#0
    XXX:
    
        ldr r5,[r1]
	ldr r11,[r0]	
        ldr r6,[r2]
        add r5,r5,r6
        add r3,r9,r5
        str r3,[r0]
        mov r7,r3
        cmp r7,#9
        add r0,r0,#4
        add r1,r1,#4
        add r2,r2,#4
        add r4,r4,#1
        mov r9, #0
        ble YY
        sub r0,r0,#4
        sub r3,r3,#10
        str r3,[r0]
        add r0,r0,#4
        mov r9,#1
        b YY
    YY:    
        cmp r4,#4
        bne XXX
	sub r0,r0,#16
        ldmfd sp!, {r5,r7,pc}
        
square_digit: @pointer of *dd in r0 and d in r2
    stmfd r13!, {r0,r1,lr}
    ldr r1,=zero_arr
    ldr r0,=dd
    stmfd r13!, {r2}
    bl copy_bcd         
    ldmfd r13!, {r2}
    mul r1,r2,r2
    str r1,[r0]
    AAAA:
        ldr r8,[r0] 
        cmp r8,#9
        ble BB
        ldr r1,[r0] 
        sub r1,r1,#10
        str r1,[r0]
        ldr r1,[r0, #4]
        add r1,r1,#1
        str r1,[r0, #4]
        b AAAA 
    BB:
    ldmfd r13!, {r0,r1,pc}

.data
x: .space 16
y: .space 16
s: .space 16
dd: .space 16
zero_arr: .word 0,0,0,0
one_arr: .word 1,0,0,0
number: .asciz "number["
isequal: .asciz "]="
newline: .asciz "\n"
FileName: .asciz "bbc.txt"
FileHandle: .word 0