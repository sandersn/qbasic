'this is a sample guess a number program
DIM Ans AS STRING
DIM Number AS LONG
DIM Guess AS LONG
DIM MaxNum AS LONG
RANDOMIZE TIMER
    PRINT "Welcome to the amazing guess-a-number program"
    PRINT "(Hint: type in a number at the prompt)"
DO
    CLS
    INPUT "What should be the highest number you can guess"; MaxNum
    Number = INT(RND * MaxNum) + 1
    DO
        PRINT
        INPUT "What do you think the number is"; Guess
        IF Guess < Number THEN
            PRINT "Too low, you're off by"; Number - Guess; "."  'offer a rid-
        ELSEIF Guess > Number THEN                          'iculous amount
            PRINT "Too high, you're off by"; Guess - Number; "." 'of help
        END IF
    LOOP WHILE Guess <> Number
    INPUT "Very good! Play again(Y/N)"; Ans
LOOP WHILE LEFT$(UCASE$(Ans), 1) = "Y"

