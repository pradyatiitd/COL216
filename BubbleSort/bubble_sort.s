	.equ SWI_EXIT, 0x11
	.text
	ldr r1, =AA
	mov r2, #5	@ 5 is length of list
	mov r7, r1	@ initial address of list
	mov r5, #1	@ initial index of list
Loop1:
	ldr r3, [r1]
	ldr r4, [r1, #4]
	 
Loop2:
	cmp r3, r4
	ble Loop3 
	str r4, [r1]
	str r3, [r1, #4]
	
Loop3:
	add r1, r1, #4
	ldr r3, [r1]
	ldr r4, [r1, #4]
	add r5, r5, #1
	cmp r5, r2
	bne Loop2
	sub r2, r2, #1
	mov r1, r7
	mov r5, #1
	cmp r2, #1
	ldr r3, [r1]
	ldr r4, [r1, #4]
	bne Loop2 
	
AA:	.word 100, 45, 35, 21, 2   @ initialisation of list.
	.end
