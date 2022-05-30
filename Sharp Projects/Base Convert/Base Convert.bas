Define conversion, num$, bit, Dec, answer$, answer2$, hexdigit, hex
10 CLS
11 WHILE
20 PRINT "What conversion to do?"
30 PRINT "1=Dec to Bin"
40 PRINT "2=Bin to Dec"
50 PRINT "3=Hex to Dec"
60 PRINT "4=Dec to Hex"
70 INPUT "5=Quit:", conversion
80 IF conversion = 5 THEN PRINT "Done": END
90 INPUT "Enter number: ", num$
100 if conversion = 1 then
105   Dec = VAL(num$)
110   WHILE Dec > 0
120      bit = Dec MOD 2
130      answer$ = STR$(bit) + answer$
140      Dec = Dec \ 2
150      PRINT Dec; " | "; bit
160   WEND
170 elseif conversion = 2 then
180 FOR i = LEN(num$) TO 1 STEP -1
190    IF MID$(num$, i, 1) = "1" THEN
200        Dec = Dec + (2 ^ (LEN(num$) - i))
210        IF i = LEN(num$) THEN
220            answer2$ = "(2 ^" + STR$(LEN(num$) - i) + ") =" + answer2$
230        ELSE
240            answer2$ = "(2 ^" + STR$(LEN(num$) - i) + ") + " + answer2$
250        END IF
260    END IF
270 NEXT i
280 PRINT answer2$;
290 answer$ = STR$(Dec)
300 elseif conversion = 3 then
310 FOR i = LEN(num$) TO 1 STEP -1
320    if ucase$(mid$(num$, i, 1)) >= "1" and ucase$(mid$(num$, i, 1)) <= "9" then hexdigit=val(mid$(num$, i, 1))
330    if ucase$(mid$(num, i, 1)) >= "A" and ucase$(mid$(num, i, 1)) <= "F" then hexdigit=(asc(ucase$(mid$(num$, i, 1)))-55)
340    Dec = Dec + hexdigit * (16 ^ (LEN(num$) - i))
350    IF i = LEN(num$) THEN
360        answer2$ = "(" + STR$(hexdigit) + " * (16 ^" + STR$(LEN(num$) - i) + ")) =" + answer2$
370    ELSE
380        answer2$ = "(" + STR$(hexdigit) + " * (16 ^" + STR$(LEN(num$) - i) + ")) + " + answer2$
390    END IF
400 NEXT i
410 PRINT answer2$;
420 answer$ = STR$(Dec)
430 elseif conversion = 4 then
440 Dec = VAL(num$)
450 WHILE Dec > 0
460    hex = Dec MOD 16
470    answer$ = HEX$(hex) + answer$
480    Dec = Dec \ 16
490    PRINT Dec; " | "; hex
500 WEND
510 END if
520 PRINT answer$
530 WEND
