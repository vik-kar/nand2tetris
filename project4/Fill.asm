// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(RESTART)
@SCREEN
D=A
@0
M=D	//RAM[0] will hold the address of the screen memory map

//Look at the current input from the keyboard
(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	//If a key is pressed, D > 0
@WHITE
D;JEQ	//If no key is presssed, D = 0

//loop again
@KBDCHECK 
0;JMP

(BLACK)
@1
M=-1	//-1 is all 1s
@CHANGE
0;JMP

(WHITE)
@1
M=0	//0 = clear
@CHANGE
0;JMP

(CHANGE)
@1
D=M	

@0
A=M	//Get address of pixel we want to fill
M=D	

@0
D=M+1 //Move to the next pixel
@KBD
D=A-D

@0
M=M+1	
A=M

@CHANGE
D;JGT

@RESTART
0;JMP