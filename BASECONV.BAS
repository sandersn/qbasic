DECLARE FUNCTION HexToBin$ (hex AS STRING)
DECLARE FUNCTION BinToHex$ (bits AS STRING)
DECLARE FUNCTION hexx% (hexstr AS STRING)
DECLARE FUNCTION DecToHex$ (Dec AS LONG)
DECLARE FUNCTION HexToDec$ (hex AS STRING)
DECLARE FUNCTION DecToBin$ (Dec AS LONG)
DECLARE FUNCTION BinToDec$ (bits AS STRING)
'convert hex to dec and back again while showing work...using Buchan's
'divison method...I hope I can port this to Sharp's Basic SDK
DIM num AS STRING
DIM answer AS STRING
DIM conversion AS LONG
CLS

DO  'mwahaha endless loop
PRINT "What conversion to do? "
PRINT "1=Dec to Bin"
PRINT "2=Bin to Dec"
PRINT "3=Hex to Dec"
PRINT "4=Dec to Hex"
PRINT "5=Bin to Hex"
PRINT "6=Hex to Bin"
INPUT "7=Quit:", conversion
IF conversion = 7 THEN PRINT "Done": END
INPUT "Enter number: ", num
SELECT CASE conversion
    CASE 1
        answer = DecToBin(VAL(num))
    CASE 2
        answer = BinToDec(num)
    CASE 3
        answer = HexToDec(num)
    CASE 4
        answer = DecToHex(VAL(num))
    CASE 5
        answer = BinToHex(num)
    CASE 6
        answer = HexToBin(num)
END SELECT

PRINT answer
'CLS
LOOP    'loop forever until they press quit above.

FUNCTION BinToDec$ (bits AS STRING)
DIM Dec AS LONG
DIM answer AS STRING
DIM i AS LONG

FOR i = LEN(bits) TO 1 STEP -1
    IF MID$(bits, i, 1) = "1" THEN
        Dec = Dec + (2 ^ (LEN(bits) - i))
        IF i = LEN(bits) THEN
            answer = "(2 ^" + STR$(LEN(bits) - i) + ") =" + answer
        ELSE
            answer = "(2 ^" + STR$(LEN(bits) - i) + ") + " + answer
        END IF
    END IF
NEXT i
PRINT answer;
BinToDec = STR$(Dec)

END FUNCTION

FUNCTION BinToHex$ (bits AS STRING)
DIM i AS INTEGER
DIM hexdigit AS STRING
DIM binseq AS STRING
DIM answer AS STRING
DIM hex AS STRING
DIM quarto AS INTEGER
    'first fill out the leading edge with 0s if needed
    quarto = LEN(bits) MOD 4
    IF quarto > 0 THEN
        bits = STRING$(4 - quarto, "0") + bits
    END IF
    FOR i = 1 TO LEN(bits) STEP 4
        binseq = UCASE$(MID$(bits, i, 4))
        SELECT CASE binseq
            CASE "0000"
                hexdigit = "0"
            CASE "0001"
                hexdigit = "1"
            CASE "0010"
                hexdigit = "2"
            CASE "0011"
                hexdigit = "3"
            CASE "0100"
                hexdigit = "4"
            CASE "0101"
                hexdigit = "5"
            CASE "0110"
                hexdigit = "6"
            CASE "0111"
                hexdigit = "7"
            CASE "1000"
                hexdigit = "8"
            CASE "1001"
                hexdigit = "9"
            CASE "1010"
                hexdigit = "A"
            CASE "1011"
                hexdigit = "B"
            CASE "1100"
                hexdigit = "C"
            CASE "1101"
                hexdigit = "D"
            CASE "1110"
                hexdigit = "E"
            CASE "1111"
                hexdigit = "F"
        END SELECT
        answer = answer + hexdigit + " (" + binseq + ") "
        hex = hex + hexdigit
    NEXT i
    PRINT answer; " = ";
    BinToHex$ = hex

END FUNCTION

FUNCTION DecToBin$ (Dec AS LONG)
DIM bit AS LONG
DIM answer AS STRING

DO
    bit = Dec MOD 2
   
    answer = STR$(bit) + answer
    Dec = Dec \ 2
    PRINT Dec; " | "; bit
LOOP WHILE Dec > 0
DecToBin = answer
END FUNCTION

FUNCTION DecToHex$ (Dec AS LONG)
DIM hex AS LONG
DIM answer AS STRING

DO
    hex = Dec MOD 16
  
    answer = HEX$(hex) + answer
    Dec = Dec \ 16
    PRINT Dec; " | "; hex
LOOP WHILE Dec > 0
DecToHex = answer

END FUNCTION

FUNCTION HexToBin$ (hex AS STRING)
DIM i AS INTEGER
DIM hexdigit AS STRING
DIM binseq AS STRING
DIM answer AS STRING
DIM bits AS STRING
    FOR i = 1 TO LEN(hex) STEP 1
        hexdigit = UCASE$(MID$(hex, i, 1))
        SELECT CASE hexdigit
            CASE "0"
                binseq = "0000"
            CASE "1"
                binseq = "0001"
            CASE "2"
                binseq = "0010"
            CASE "3"
                binseq = "0011"
            CASE "4"
                binseq = "0100"
            CASE "5"
                binseq = "0101"
            CASE "6"
                binseq = "0110"
            CASE "7"
                binseq = "0111"
            CASE "8"
                binseq = "1000"
            CASE "9"
                binseq = "1001"
            CASE "A"
                binseq = "1010"
            CASE "B"
                binseq = "1011"
            CASE "C"
                binseq = "1100"
            CASE "D"
                binseq = "1101"
            CASE "E"
                binseq = "1110"
            CASE "F"
                binseq = "1111"
        END SELECT
        answer = answer + binseq + " (" + hexdigit + ") "
        bits = bits + binseq
    NEXT i
    PRINT answer; " = ";
    HexToBin$ = bits
END FUNCTION

FUNCTION HexToDec$ (hex AS STRING)
DIM Dec AS LONG
DIM answer AS STRING
DIM i AS LONG
DIM hexdigit AS LONG

FOR i = LEN(hex) TO 1 STEP -1
    hexdigit = hexx(MID$(hex, i, 1))
    Dec = Dec + hexdigit * (16 ^ (LEN(hex) - i))
    IF i = LEN(hex) THEN
        answer = "(" + STR$(hexdigit) + " * (16 ^" + STR$(LEN(hex) - i) + ")) =" + answer
    ELSE
        answer = "(" + STR$(hexdigit) + " * (16 ^" + STR$(LEN(hex) - i) + ")) + " + answer
    END IF
NEXT i
PRINT answer;
HexToDec = STR$(Dec)

END FUNCTION

FUNCTION hexx% (hexstr AS STRING)

SELECT CASE UCASE$(hexstr)
    CASE "1" TO "9"
        hexx = VAL(hexstr)
    CASE "A" TO "F" '65 to 70
        hexx = ASC(UCASE$(hexstr)) - 55
END SELECT
END FUNCTION

