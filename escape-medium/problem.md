<!-- RATING: MEDIUM -->
<!-- NAME:  ESCAPE -->
<!-- GENERATOR: generate.pl -->
# ESCAPE

MISSION DIRECTIVE: Evacuate all facilities.

Signficant damage has been reported to facilities in multiple locations. Local evacuation procedures have been impacted by power outages. Multiple requests are coming in for immediate assistance with evacuation routes.

You must use your local copy of the facility blueprints to identify efficient evacuation routes for designated facilities. You must find the fastest route possible to prevent further casualties. Unfortunately, the breakers have been thrown in some facilities, causing all blast doors to lock shut. Instead of a direct route, you must also hit all numbered breakers in order, so that the path to the exit is clear.
 
## INPUT
You will be provided an ASCII map consiting of spaces and '=' characters, as well as other alpha-numeric characters. The 'S' indicates your start position, the 'E' indicates the exit. You may only move up,down,left or right to a space, or to an alpha-numeric character.

Numeric characters represent breakers. Each breaker must be visited, and in order.

The end of a map is indicated by a line of '_' characters.

## OUTPUT
You must output the (x,y) coordinates that provide the optimal route to escape, ensuring that all breaker panels have been accessed in order. The first coordinate will always be the location of the 'S', and the last will always be the coordinate of the 'E'.

Each set of coordinates for a route should end in a line of '_' characters.

## SAMPLE INPUT
=S====================
= =   =    =      ====
= = = = ==   ====  = =
=   = =   ==  = ==   =
  ==   ==  ==     ====
 =   =  ==  == ==  = =
1== ===2== =   = ==  =
= 3  =4=    = =   = ==
== =   = == = = =    =
== == = = = =    = = =
= =       =  = = ==  =
= == = ==  =  ===   ==
=  ===   =   ====== ==
E =  ====  =    =    =
=  = =  == = ==  = = =
==     = ====  =  =  =
= ==== =   =  = ==  ==
=       == = =  =  = =
=== ====     ==   =  =
=     = = ==    =   ==
== ==       = = = ====
======================
_______________________________________________________________

## SAMPLE OUTPUT
(2,1)
(2,2)
(2,3)
(2,4)
(2,5)
(1,5)
(1,6)
(1,7)
(1,6)
(1,5)
(2,5)
(2,4)
(3,4)
(4,4)
(4,3)
(4,2)
(5,2)
(6,2)
(6,3)
(6,4)
(6,5)
(7,5)
(7,6)
(8,6)
(8,7)
(8,6)
(7,6)
(7,5)
(6,5)
(5,5)
(5,6)
(4,6)
(4,7)
(4,8)
(3,8)
(4,8)
(5,8)
(5,9)
(6,9)
(7,9)
(7,8)
(7,9)
(6,9)
(6,10)
(6,11)
(7,11)
(8,11)
(9,11)
(10,11)
(10,12)
(11,12)
(11,13)
(12,13)
(13,13)
(13,12)
(13,11)
(12,11)
(12,10)
(12,9)
(12,8)
(11,8)
(11,7)
(11,6)
(11,5)
(10,5)
(10,4)
(9,4)
(8,4)
(8,3)
(8,2)
(9,2)
(10,2)
(11,2)
(11,3)
(12,3)
(13,3)
(13,4)
(14,4)
(14,5)
(15,5)
(15,6)
(15,7)
(14,7)
(14,8)
(14,9)
(14,10)
(15,10)
(16,10)
(16,9)
(16,8)
(17,8)
(18,8)
(18,9)
(19,9)
(20,9)
(21,9)
(21,10)
(21,11)
(20,11)
(20,12)
(20,13)
(20,14)
(21,14)
(21,15)
(21,16)
(20,16)
(20,17)
(19,17)
(19,18)
(18,18)
(18,19)
(17,19)
(16,19)
(16,20)
(15,20)
(14,20)
(13,20)
(13,19)
(12,19)
(11,19)
(10,19)
(10,20)
(10,21)
(9,21)
(8,21)
(7,21)
(6,21)
(6,20)
(5,20)
(4,20)
(4,19)
(4,18)
(5,18)
(6,18)
(7,18)
(7,17)
(7,16)
(6,16)
(5,16)
(4,16)
(3,16)
(3,15)
(2,15)
(2,14)
(1,14)
_______________________________________________________________
