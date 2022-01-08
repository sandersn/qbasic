'RndCirc.bas
'written by Nathan C. Sanders
'This program demos randomization, filled circle drawing, and the more
'efficient method of waiting(e.g. Sleep with fractions of a second.)
'1st writing:(23/06/1998)
'Note that I'm not sure how far down the Sleep routine works; I've only tried
'it to about 20 ms with Print, and it wasn't working too well(maybe on a
'faster machine). I'm guessing that it's limit is approximately 50 ms.
'
'Also, I couldn't figure out how to fill a circle any other way except to
'draw it and then use DRAW to fill it.
'Note that there is a small bug here:
'If the center of a circle is drawn on top of a center of another circle
'of the same color, DRAW will not fill the new circle. It merely refills the
'old circle. This is because it is searching for the border color passed
'it. When it hits A border of the right color it stops filling. This is
'annoying, but I don't know of any way to fix it.
'New Note:I just noticed another filling bug. DRAW doesn't work if the center
'of the circle is off the screen either.
'
'As for the weird way I put together the draw string, I would welcome
'suggestions on how to make that cleaner.
DIM X AS INTEGER
DIM Y AS INTEGER
DIM Radius AS INTEGER
DIM Col AS INTEGER
DIM Fill AS STRING
DIM TimeTemp AS DOUBLE
RANDOMIZE TIMER
SCREEN 12
    DO WHILE INKEY$ = ""
        TimeTemp = TIMER 'What's the time at the top of the loop?(in secs
        X = (RND * 640) + 1                          ' past midnight)
        Y = (RND * 480) + 1
        Radius = (RND * (480 / 4)) + 1 ' I decided that circles with half the
        Col = (RND * 16) + 1        'screen height were too big
        CIRCLE (X, Y), Radius, Col ' QBasic wouldn't let me use Color as a
        'variable name as it is already a statement.       or whatever\/
        Fill = "P" + STR$(Col) + ", " + STR$(Col) ' This equates to:"P12, 12"
        DRAW "X" + VARPTR$(Fill)        '(P is the fill function for DRAW)
        DO UNTIL (TIMER - TimeTemp) >= .25 'What is the time at the bottom?
            'This equates to something like this the first time:
            '121341.03 - 121341.02 = .01 which is smaller than .25
            ' if 250 (or more)ms have passed skip the loop. Else loop, then
            'check again.
        LOOP
    LOOP

