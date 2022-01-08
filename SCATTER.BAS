'this effect is somehow disappointing ... -_-

TYPE flyingChar  'type to hold each char that is scattering
'x,y,xvel,yvel, colour,char
   x AS INTEGER
   y AS INTEGER
   xvel AS SINGLE
   yvel AS SINGLE
   colour AS INTEGER
   char AS STRING * 1
END TYPE
'need a way to print text in its respective colours
'and erase the old text
DIM scatter(1 TO 80, 1 TO 25) AS flyingChar 'only enough pixels for half of entire screen
DIM x AS INTEGER, y AS INTEGER
DIM i AS INTEGER, j AS INTEGER
DIM backBuf(1 TO 25) AS STRING * 80

'print a couple of lines
RANDOMIZE TIMER
'CLS
COLOR 10
LOCATE 12, 24
PRINT "What is the Matrix"
LOCATE 24, 40
COLOR 2
PRINT "This program is not guaranteed to run"
DO
LOOP WHILE INKEY$ = ""  'wait for keypress
'start effect
   'init array
FOR x = 1 TO 80 STEP 1
   FOR y = 1 TO 25 STEP 1
      'first get current colour/char for whole screen
      scatter(x, y).char = CHR$(SCREEN(y, x, 0))
      scatter(x, y).colour = SCREEN(y, x, 1)
      'set x,y
      scatter(x, y).x = x
      scatter(x, y).y = y
      'xvel and yvel are randomized from 1 to 3 and then (-) depending on the
      'quarter of the screen on which x,y are
      scatter(x, y).xvel = INT(RND * 2) + 1
      scatter(x, y).yvel = INT(RND * 2) + 1
      IF scatter(x, y).x <= 40 THEN
         scatter(x, y).xvel = -scatter(x, y).xvel
      END IF
      IF scatter(x, y).y < 13 THEN
         scatter(x, y).yvel = -scatter(x, y).yvel
      END IF
   NEXT y
NEXT x
'now run effect until key is pressed
FOR j = 1 TO 25 STEP 1
   'draw effect (on backbuffer)
   FOR x = 1 TO 80 STEP 1
      FOR y = 1 TO 25 STEP 1
         scatter(x, y).x = scatter(x, y).x + scatter(x, y).xvel
         scatter(x, y).y = scatter(x, y).y + scatter(x, y).yvel
         'make sure position in range first
         IF scatter(x, y).x > 0 AND scatter(x, y).x < 81 AND scatter(x, y).y > 0 AND scatter(x, y).y < 26 THEN
            MID$(backBuf(scatter(x, y).y), scatter(x, y).x, 1) = scatter(x, y).char
         END IF
      NEXT y
   NEXT x
   'draw backbuffer
   FOR i = 1 TO 25 STEP 1
      LOCATE i, 1
      PRINT backBuf(i)  'need a way to print text in correct colours
      backBuf(i) = SPACE$(80) 'clear this line of the back buf
   NEXT i
   'wait loop(may need a long one)
   FOR i = 1 TO 10000 STEP 1
   NEXT i
NEXT j
COLOR 0  'prevent cute little 'press any key' from showing up

