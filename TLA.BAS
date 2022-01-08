
RANDOMIZE TIMER
CLS
DIM s1achar AS STRING
DIM s2achar AS STRING
DIM s3achar AS STRING
INPUT "How many TLAs do you want to generate? ", num
FOR i = 1 TO num STEP 1
   s1achar = CHR$(INT(RND * 26) + 65)
   s2achar = CHR$(INT(RND * 26) + 65)
   s3achar = CHR$(INT(RND * 26) + 65)
   PRINT s1achar; s2achar; s3achar
   'PRINT   'makes too many spaces
NEXT i

