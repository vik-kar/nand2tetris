//Declare Variables
@R0
D=M //D = RAM[0]

@i
M=D //M = RAM[i], RAM[i] = D (D = RAM[0])

@R1
D=M

@j
M=D

@sum
M=0

(LOOP)
    //Check if we can break from loop
    @j
    D=M
    @STOP
    D;JEQ

    @i 
    D=M //D = RAM[i]  = RAM[0]
    @sum
    M=D+M 
    //D=D+M
    //j--
    @1
    D=A
    @j
    M=M-D
    @LOOP
    0;JMP

//Set R2 to sum    
(STOP)
    @sum
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP
