DIM cracked AS STRING
DIM garb AS STRING
DIM i AS LONG, j AS LONG, k AS LONG
DIM cracktime AS LONG

COLOR 10
CLS
   cracked = "What is the Matrix"
FOR i = 1 TO LEN(cracked) STEP 1
   cracktime = CINT(RND * 5000 + 1) - (50 * i)'gen a random len of time
   FOR j = 1 TO cracktime STEP 1 'print random chars for a random len of time
      LOCATE 12, i + 30
      'gen random chars
      garb = ""
      FOR k = i TO LEN(cracked) STEP 1
         garb = garb + CHR$(CINT((RND * 219) + 32))
      NEXT k
      PRINT garb
   NEXT j
   LOCATE 12, i + 30
   PRINT MID$(cracked, i, 1)              'actually print the char
   FOR j = 1 TO 10000 STEP 1  'delay loop
   NEXT j
NEXT i

