DECLARE SUB SleepExt (Delay AS LONG, TimerTop AS DOUBLE)
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
'2nd rewriting:(N. Sanders; 23/06/1998)
'I turned the SleepExt into a separate Sub for modularity and readability.
DIM X AS INTEGER
DIM Y AS INTEGER
DIM Radius AS INTEGER
DIM Col AS INTEGER
DIM Fill AS STRING
DIM TimeTemp AS DOUBLE
    RANDOMIZE TIMER ' Try commenting out this line...It's cool
    SCREEN 12
    DO WHILE INKEY$ = ""
        Fill = ""
        TimeTemp = TIMER
        X = (RND * 640) + 1
        Y = (RND * 480) + 1
        Radius = (RND * (480 / 4)) + 1
        Col = (RND * 16) + 1
        CIRCLE (X, Y), Radius, Col

        IF X > 639 THEN
            Fill = "M639, " + STR$(Y) + " "
        ELSEIF X < 0 THEN
            Fill = "M0, " + STR$(Y) + " "
        END IF
        IF Y > 479 THEN
            Fill = "M" + STR$(X) + ",479 "
        ELSEIF Y < 0 THEN
            Fill = "M" + STR$(X) + ",0 "
        END IF

        Fill = Fill + "P" + STR$(Col) + ", " + STR$(Col)
        DRAW "X" + VARPTR$(Fill)
        SleepExt 25, TimeTemp 'This sub parameters are:
        'The time to sleep in ms, and a time obtained from TIMER
        '(usually at the top of the loop to be delayed)
    LOOP

SUB SleepExt (Delay AS LONG, TimerTop AS DOUBLE)
    DO UNTIL (TIMER - TimerTop) >= (Delay / 1000)
    LOOP
END SUB

