TYPE BOB
    life AS INTEGER '0 = Dead  ; 100 = Healthy
    rest AS INTEGER '0 = Psycho; 100 = Rested
    Mood AS INTEGER '0 = Scared; 100 = Mad
    X AS LONG   'reserved for future use
    Y AS LONG   'reserved for future use
    ScreenX AS INTEGER
    ScreenY AS INTEGER
END TYPE
DIM players(0 TO 1) AS BOB
CONST NUMPLAYERS = 1
'let the BOBs begin!
quit = 1
DO WHILE quit
   FOR i = 0 TO NUMPLAYERS
        SELECT CASE players(i).Mood
            CASE IS < 20
                IF players(i).rest < 10 THEN
                    'completely random move
                elseif
                IF life > 90 THEN   'attack

            CASE IS < 40
            CASE IS < 60
            CASE IS < 80
            CASE ELSE   'so you can cheat and have +100 life
        END SELECT
   NEXT i
LOOP

