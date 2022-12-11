// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(START)		
// set addr to first pixel of screen
    @SCREEN
    D=A
    @screenaddr
    M=D

    @8192	// total number of pixels to draw is (256 * 32)
    D=A
    @pixels
    M=D

// get user input from keyboard
(CHECK) 	

// check if there are pixels left to paint
    @pixels	
    D=M
    @START
    D;JEQ

// get keyboard input to check if it user pressed a key or not
    @KBD	
    D=M

// black screen if key is pressed
    @BLACKSC 	
    D;JNE

// blank screen if no key is pressed
    @BLANKSC 	
    D;JEQ

(BLACKSC)	
	@screenaddr
    A=M
    M=-1

    @screenaddr
    M=M+1

	@pixels	// one less pixel to paint
    M=M-1
	
	@CHECK	// get user input
    0;JMP

(BLANKSC)	
	@screenaddr	// set the pixel at screenaddr to 0
    A=M
    M=0

	@screenaddr
    M=M+1

	@pixels
    M=M-1
	
	@CHECK
	0;JMP
