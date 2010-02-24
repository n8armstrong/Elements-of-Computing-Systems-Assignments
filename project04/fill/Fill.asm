@16416
D = A
@R1 //Maximum screen value
M = D // Sets R1 to 16416, the laste byte that the screen uses


@SCREEN
D = A
@R0
M = D

@KEYBOARD_TEST
0;JMP

(RESTART)
    @0
    D = !A //Set D to all 1 bits
    @R0 //Technically not necessary since R0 and @0 are the same but I like to be explicit
    A = M
    M = D

(KEYBOARD_TEST)
    @R0
    M = M + 1 // Increment the screen pointer
    //Check to see if M > maximum screen byte and if so reset to @screen 
    @R1
    D = M
    @R0
    D = D - M
    @RESET
    D;JLE

    @KBD
    D=M
    @RESTART
    D;JNE
    
    @KEYBOARD_TEST
    0;JMP

(RESET)
    @SCREEN
    D = A
    @R0
    M = D 

    @KEYBOARD_TEST 
    0;JMP
