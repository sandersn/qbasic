'palette twiddling
DIM rgb AS LONG
DIM r AS LONG
DIM g AS LONG
DIM b AS LONG
DIM answer AS STRING
SCREEN 13
DO
   CLS
   PRINT "Enter the rgb you wish to see(0-63):"
   INPUT r, g, b
   rgb = r + (g * 64) + (b * 2048)
   PALETTE 4, rgb   'twiddle red
   CIRCLE (160, 100), 30, 4
   INPUT "Do you want to try a different color?", answer
LOOP UNTIL LEFT$(LCASE$(answer), 1) = "n"

