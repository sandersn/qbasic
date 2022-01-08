'randot.bas: plots dots randomly and not-so randomly

SCREEN 12   'set mode(VGA) VGA is much better because the pixels are closer
'to square.
'onan interesting side note, 320x200's pixels are higher than long, while
'a TV's pixels are longer than high.
RANDOMIZE TIMER
CLS

CONST White = 15
CONST Black = 0   'hmm pretty easy.

DIM i AS LONG
DIM dots AS LONG
INPUT "Enter number of dots to plot:", dots
CLS

FOR i = 1 TO dots STEP 1
   PSET (INT(RND * 640), INT(RND * 480)), White
NEXT i

