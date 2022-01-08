DIM garb AS STRING
DIM i AS INTEGER
DIM j AS LONG
DIM backBuf(25) AS STRING * 80   'note only 24 used because printing to the last
                                 'line causes scrolling -_-
COLOR 10
CONST NUMSTRINGS = 150
TYPE strin
   col AS INTEGER
   row AS INTEGER
   length AS INTEGER
   text AS STRING * 15  'need to use rtrim to get rid of extra spaces at runtime
   v AS INTEGER
END TYPE
DIM strings(1 TO 150) AS strin

CLS
'init strings the first time           
FOR i = 1 TO NUMSTRINGS STEP 1
   strings(i).length = CINT(RND * 10) + 5
   strings(i).col = CINT(RND * 79) + 1
   garb = ""
   FOR j = 1 TO strings(i).length STEP 1  'random text
      garb = garb + CHR$(CINT((RND * 219) + 32))
   NEXT j
   strings(i).text = garb
   strings(i).v = CINT(RND) + 1 'either 1 or 2
   strings(i).row = 1 - LEN(RTRIM$(strings(i).text))  'start so it slides into view
NEXT i
DO
   'render each string(this is the hard part :)
      FOR i = 1 TO 25 STEP 1  'loop through each line
         backBuf(i) = ""  'enable to prevent 'trails' from strings
                        'by clearing the backBuffer
         FOR j = 1 TO NUMSTRINGS STEP 1
            IF i >= strings(j).row AND i <= LEN(RTRIM$(strings(j).text)) + strings(j).row THEN
               'write to a back buffer instead of directly to the screen
               'to reduce flickering
               MID$(backBuf(i), strings(j).col, 1) = MID$(strings(j).text, i - strings(j).row + 1, 1)
            END IF
         NEXT j
      NEXT i
      'figure out for each line, for each string, if there is a character
      'that needs to be printed. If there is, print it at the col position.
      'make sure you rtrim the string before checking it
  
   FOR i = 1 TO NUMSTRINGS STEP 1
   'move each string down by its velocity
      strings(i).row = strings(i).row + strings(i).v
   'reset the height if the top character has scrolled below the bottom of
   'the screen so that the length. Regen all the stats too
      IF strings(i).row > 25 THEN
         strings(i).length = CINT(RND * 10) + 5
         strings(i).col = CINT(RND * 79) + 1
         garb = ""
         FOR j = 1 TO strings(i).length STEP 1  'random text
            garb = garb + CHR$(CINT((RND * 219) + 32))
         NEXT j
         strings(i).text = garb
         strings(i).v = CINT(RND) + 1 'either 1 or 2
         strings(i).row = 1 - LEN(RTRIM$(strings(i).text))  'start so it slides into view
      END IF
   NEXT i
   'print the back buffer to reduce flickering (we hope)
   LOCATE 1, 1
   FOR i = 1 TO 24 STEP 1  'only print 24 lines because writing the 25th
      PRINT backBuf(i)     'causes minute scrolling
   NEXT i
   'delay loop
   FOR j = 1 TO 100 STEP 1
   NEXT j

LOOP WHILE INKEY$ = ""

