<!-- RATING: HARD -->
<!-- NAME:  CONTACT -->
<!-- GENERATOR: generate.pl -->
# CONTACT
 
MISSION DIRECTIVE: Agents recently discovered evidence of encoded data in signals originating from galactic cluster N1337, however the signals appeared to have introduced yet another encoding scheme after several days. 

Initially, the advanced analytics team indicated the new signals still contained encoded or encrypted data, and the decoded contents became increasingly cryptic. The last message referenced a "convoy" and other messages eluded to a significant fleet, possibly indicating an invasion force by a hostile species. This assumption could also be supported by the increased security around the signal. Or, it could simply be a false positive. 

Shortly after detection of the "convoy" message, the signal changed again. The signal has now been overlayed on top of several carrier signals in an attempt to evade detection. The new signal data has been forwarded to your team for more advanced analysis. 

You must determine a way to decode the messages, so that mission control can attempt to identify whether this is a significant threat.

## INPUT
The signal data has been encoded using four characters: '.','o','O' and '0'. The number of each character on a line indicates the signal strength for that carrier signal element. The end of the message is indicated by a line of '%' characters.

## OUTPUT
You must output the decoded message in all caps, including spaces, one per line.

## SAMPLE INPUT
    .0o0o00.0.Oo0o0O0...oOo.0oOo..00Ooo.0o0.O00o0Oo0.oOo000oo00o..O0.
    0oO00..0o0O.0o00O0.O00.O.0o0Ooo.0o.0.00o.O.0O.0OO0oO.o0O.O00O.o0.
    .Oo0o00.0O0O.0o0o.O.o0o00.0o.o00ooOo0o00.O0..0.OO0..oO0.0000..o0.
    0.0o..0O0O.0OO.OOOO.0.0O.00O.0.O0.0O00O..O00.000.O0OO0O...0O0O000
    0o00...0..00Oo0.000o0.OO0o0o.00.Oo0.O0o.0.O.0.00o...0o0Oo..Oo0oO0
    000o.oo0..00ooo0..oo0.0..000.o00..ooo.o0o.o0..O..0oo.o000.00.00oo
    .O.00.O.0O00O.o00.0O0O...O.0O.0.00...0.0.OO0O0.OO0OO0OOO.00.O0.0O
    o....oO0.000o000o.O0o0.oOo....00.Ooo.0o..oO0o.000.0.o0..0o00.o0o.
    .0o00o00o..o0..00ooo0oo0oo..o0.o.0o.0.o.......oo0...00.o000oo0o.0
    .0000..oO.0.0o.00ooO.ooo..0O.o00....ooo.00.o0o.00.oo0.0o0o0.o....
    0.oO.00.o.0.O0.OO0O..0.OO.o....o.O0oO.00O.OO0..0..0O.000..0.0oO0O
    OOO.O.0.O.0....OO0.0..0.O0..O0000O0O.000OO0.O0.....OOO.O0.O.OO.0.
    O..O.0...000O.O..0o00Ooo..O.o0O.o..OO0oo.O....o00oO.OO0000.0..O.0
    ...0O0OO.OO0...O0.O.O.0..Oo.OOO000...00O.0.o.O..0o.0oOO0OOOO.0o.0
    .o.o...00..OooooooO..o.o00o.O..00.o00o.oo.o0Oo.00o.0..o0ooOo0...0
    .0.oO.oO0.0O.OoOO0.o0.O0o...00oOo..O.O...o0.0o.O.oOO..0O000OOO.Oo
    o.0.00o0.o..0..0..oo...oo.0oooooooo0o00.o.o.o.o.ooooo0o0ooo.0.o.o
    O.0.Oo.OO..0ooo.o.oOo.oOO0oooo.0Ooo0oo0oO..O0o00OoO...0...o.0.O0.
    ooo.0.oo00ooooo.0oooooo0o.o0...o.o.0o..OooOo0Oo..0o...oooO.O0.o.0
    ...0.ooo.o..0o0oo0o...oO0oooooo00oo.ooo0.oo.oooo.ooo.o0ooo.o0o.o.
    ..Oo.o...o.o0o0oO0oO..o.0.ooOO0OOoOo0.OoO.O0O0Oooo.OoO..OOOo0oO.o
    ooo.oo.OO0.0OO0oOOoo.O.oOoo.Oo..O00.oOO.OOooO0O.oOOO...O.oO0.ooo0
    oOO.oOOO.0.Oo.OOOO0o0OoO..O.O0oOoo.oo.o.0oOoo.Ooo0Oo.o.ooooo..oo0
    0oo.0Oooooo.ooooooo.o0.ooo.oO.0o.o.OooO.00oooo.o.ooooooo.Oo.o.ooo
    0.oo0OOOO.O0..ooOOoO.ooo.oo.o.0oooOo.OOoOO.ooOo..Ooo.OOoooOOooo0o
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
    INIT?????????????????????

MISSION NOTE: Our decryption teams are relying on you, the above is all they were able to decipher. Your output will not contain the '?' character.
