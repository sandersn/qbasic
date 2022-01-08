DO
   start = TIMER
   ink$ = INKEY$
   IF ink$ <> "" THEN
      PRINT "|"; ink$; "|"
   END IF
   DO
      endd = TIMER
   LOOP UNTIL endd - start > .2
LOOP UNTIL ink$ = "q"

