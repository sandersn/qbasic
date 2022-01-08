'Stupid.bas
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating
'NO cheating
'No cheating

DIM ans AS STRING
CLS
DO
    INPUT "Are you stupid? ", ans
    ans = UCASE$(LEFT$(ans, 1))
    IF ans = "Y" THEN
        PRINT "No you're not"
    ELSEIF ans = "N" THEN
        PRINT "Yes you are"
    END IF
LOOP UNTIL ans <> "N" AND ans <> "Y" AND ans <> ""

