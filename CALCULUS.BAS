DECLARE FUNCTION f# (x AS DOUBLE)
'summate.bas-- this automatically summates for you...

DIM total AS DOUBLE   'init the total completely
total = 0
numLoops = 30   'your number of iterations here


CLS
FOR i = 0 TO 1.5 STEP .5
    total = total + (f(CDBL(i)) * .5)  'your operation here
    PRINT total
NEXT i

PRINT "And the grand total is:";
PRINT total 'and here's your answer

FUNCTION f# (x AS DOUBLE)
DIM answer AS DOUBLE
    answer = -(x ^ 2) + 4
    PRINT TAB(20); answer
    f = answer
END FUNCTION

