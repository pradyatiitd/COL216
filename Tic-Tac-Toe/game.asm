.data
char_x: .byte 'X'
char_o: .byte 'O'
newline: .asciiz "\n"

instr1: .asciiz "1. Welcome to Assembly tic tac toe.\n"
instr2: .asciiz "2. Player 1 is X and Player 2 is O.\n"
instr3: .asciiz "3. Grid indexing is 0 based.\n"
instr4: .asciiz "a. Enter row number: "
instr5: .asciiz "b. Enter column number: "

player1_turn: .asciiz "Turn of player 1\n"
player2_turn: .asciiz "Turn of player 2:\n"
player1_msg: .asciiz "Player 1 won.\n"
player2_msg: .asciiz "Player 2 won.\n"
player1_score: .word 3
player2_score: .word -3

draw_msg: .asciiz "The match ended in a draw.\n"
invalid_msg: .asciiz "INVALID MOVE!!!\n"

board0: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
board1: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
board2: .byte '_', '_', '_', '_', '_', '_', '_', '_', '_'

.globl main
.text

invalid:
	li $v0, 4
	la $a0, invalid_msg
	syscall
	beq $t4, $zero, player1_input
	j player2_input

input:
	beq $t4, $zero, player1_input
	j player2_input

player1_input:
	li $v0, 4
	la $a0, player1_turn
	syscall
	b take_input

player2_input:
	li $v0, 4
	la $a0, player2_turn
	syscall
	b take_input

take_input:
	li $v0, 4
	la $a0, instr4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, newline
	syscall
	li $v0, 4
	la $a0, instr5
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	addi $t8, $zero, 0
	addi $t9, $zero, 2
	blt $t1, $t8, invalid
	blt $t2, $t8, invalid
	bgt $t1, $t9, invalid
	bgt $t2, $t9, invalid
	beq $t4, $zero, player1_move
	j player2_move

player1_move:
	la $t0, board0
	mul $t3, $t1, 12
	mul $t8, $t2, 4
	add $t3, $t3, $t8
	add $t0, $t0, $t3
	lw $t6, 0($t0)
	bne $t6, $zero, invalid
	addi $t6, $zero, 1
	sw $t6, 0($t0)

	la $t0, board1
	mul $t3, $t1, 4
	mul $t8, $t2, 12
	add $t3, $t3, $t8
	add $t0, $t0, $t3
	lw $t6, 0($t0)
	addi $t6, $zero, 1
	sw $t6, 0($t0)

	la $t0, board2
	mul $t1, $t1, 3
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	lb $t2, char_x
	sb $t2, ($t0)

	addi $t0, $zero, 1
	sub $t5, $t5, $t0

	la $t0, board2
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t3, $zero, 3
	addi $t8, $zero, 9
	j display

player2_move:
	la $t0, board0
	mul $t3, $t1, 12
	mul $t8, $t2, 4
	add $t3, $t3, $t8
	add $t0, $t0, $t3
	lw $t6, 0($t0)
	bne $t6, $zero, invalid
	addi $t6, $zero, -1
	sw $t6, 0($t0)

	la $t0, board1
	mul $t3, $t1, 4
	mul $t8, $t2, 12
	add $t3, $t3, $t8
	add $t0, $t0, $t3
	lw $t6, 0($t0)
	addi $t6, $zero, -1
	sw $t6, 0($t0)

	la $t0, board2
	mul $t1, $t1, 3
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	lb $t2, char_o
	sb $t2, ($t0)

	addi $t0, $zero, 1
	sub $t5, $t5, $t0

	la $t0, board2
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t3, $zero, 3
	addi $t8, $zero, 9
	j display

main:
	li $v0, 4
	la $a0, instr1
	syscall

	li $v0, 4
	la $a0, instr2
	syscall

	li $v0, 4
	la $a0, instr3
	syscall

	# Loads the base address of the matrix
	la $t0, board2
	# Keeps count of how empty spaces in matrix
	addi $t5, $zero, 9
	# Keeps track of turn
	addi $t4, $zero, 1

	# Actual game-play starts
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t3, $zero, 3
	addi $t8, $zero, 9
	j display

display:
	# Display the value
	li $v0, 11
	lb $t9, ($t0)
	move $a0, $t9
	syscall
	addi $t0, $t0, 1

	# Incrementing the counters
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	bne $t2, $t3, display

	# New line for making 3x3
	li $v0, 4
	la $a0, newline
	syscall

	# Resetting the counter
	addi $t2, $zero, 0
	beq $t1, $t8, end_game
	j display

end_game:
	# Loading the parameters
	la $t0, board0
	lw $t8, player1_score
	lw $t9, player2_score

	# For checking the rows
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t3, $zero, 3
	addi $t6, $zero, 2
	addi $t7, $zero, 0
	j linear_check

linear_check:
	sub $sp, $sp, 4
	sw $t6, 0($sp)

	# Adding the scores present in the row
	lw $t6, 0($t0)
	add $t2, $zero, $t6
	addi $t0, $t0, 4
	lw $t6, 0($t0)
	add $t2, $t2, $t6
	addi $t0, $t0, 4
	lw $t6, 0($t0)
	add $t2, $t2, $t6
	addi $t0, $t0, 4
	addi $t1, $t1, 1

	lw $t6, 0($sp)
	addi $sp, $sp, 4

	# Branch on basis of score
	beq $t2, $t8, player1_win
	beq $t2, $t9, player2_win
	bne $t1, $t3, linear_check

	# For deciding ki check row/ col/ diagonal
	addi $t7, $t7, 1
	beq $t7, $t6, diagonal_check

	# Check the columns
	la $t0, board1
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	j linear_check

diagonal_check:
	sub $sp, $sp, 4
	sw $t5, 0($sp)
	la $t0, board0

	# Check the \ diagonal
	lw $t5, 0($t0)
	add $t1, $zero, $t5
	lw $t5, 16($t0)
	add $t1, $t1, $t5
	lw $t5, 32($t0)
	add $t1, $t1, $t5
	beq $t1, $t8, player1_win
	beq $t1, $t9, player2_win

	# Check the / diagonal
	addi $t1, $zero, 0
	lw $t5, 8($t0)
	add $t1, $t1, $t5
	lw $t5, 16($t0)
	add $t1, $t1, $t5
	lw $t5, 24($t0)
	add $t1, $t1, $t5

	lw $t5, 0($sp)
	addi $sp, $sp, 4

	beq $t1, $t8, player1_win
	beq $t1, $t9, player2_win
	beq $t5, $zero, draw
	addi $t1, $zero, 1
	sub $t4, $t1, $t4
	j input

player1_win:
	li $v0, 4
	la $a0, player1_msg
	syscall
	li $v0, 10
	syscall

player2_win:
	li $v0, 4
	la $a0, player2_msg
	syscall
	li $v0, 10
	syscall

draw:
	li $v0, 4
	la $a0, draw_msg
	syscall
	li $v0, 10
	syscall
