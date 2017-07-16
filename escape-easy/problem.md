<!-- RATING: EASY -->
<!-- NAME:  ESCAPE -->
<!-- GENERATOR: generate.pl -->
# ESCAPE

MISSION DIRECTIVE: Evacuate all facilities.

Signficant damage has been reported to facilities in multiple locations. Local evacuation procedures have been impacted by power outages. Multiple requests are coming in for immediate assistance with evacuation routes.

You must use your local copy of the facility blueprints to identify efficient evacuation routes for designated facilities. You must find the fastest route possible to prevent further casualties. 

## INPUT
You will be provided an ASCII map consiting of spaces and '=' characters, as well as an 'S' and an 'E'. The 'S' indicates your start position. You may only move up,down,left or right to a space. 

The end of a map is indicated by a line of '_' characters.

## OUTPUT
You must output the (x,y) coordinates that provide the shortest route to escape, as shown below. The first coordinate will always be the location of the 'S', and the last will always be the coordinate of the 'E'.

Each set of coordinates for a route should end in a line of '_' characters.

## SAMPLE INPUT
========S=============
========   =  ========
== =     =  =   =  = =
== = ===  =   = = =  =
== =  ====  =  =  = ==
==  =     ==  = =    =
===  =====   ==   == =
== =   = = = == ==   =
E   == =  ==     = = =
= ===    =   = = =  ==
=     ==  ====  =  ===
  = =   =  = ==  = ===
= = = ==  =    ==   ==
== ====  =  = =  ==  =
== ==  = == =  =   = =
==   =    =  = = =   =
====   ===  =  =  == =
==  == =   =  = = = ==
== =    = =  == =    =
== ==== = = =    === =
==        =   ==     =
======================
_______________________________________________________________

## SAMPLE OUTPUT
(9,1)
(9,2)
(10,2)
(11,2)
(11,3)
(12,3)
(12,4)
(13,4)
(14,4)
(14,5)
(14,6)
(13,6)
(13,7)
(13,8)
(13,9)
(14,9)
(15,9)
(16,9)
(16,8)
(16,7)
(17,7)
(18,7)
(18,6)
(19,6)
(20,6)
(21,6)
(21,7)
(21,8)
(20,8)
(19,8)
(19,9)
(19,10)
(19,11)
(19,12)
(19,13)
(20,13)
(20,14)
(21,14)
(21,15)
(21,16)
(20,16)
(19,16)
(19,15)
(18,15)
(17,15)
(17,16)
(17,17)
(18,17)
(18,18)
(18,19)
(19,19)
(20,19)
(21,19)
(21,20)
(21,21)
(20,21)
(19,21)
(18,21)
(17,21)
(17,20)
(16,20)
(15,20)
(14,20)
(14,21)
(13,21)
(12,21)
(12,20)
(12,19)
(13,19)
(13,18)
(14,18)
(14,17)
(15,17)
(15,16)
(15,15)
(14,15)
(14,14)
(14,13)
(13,13)
(12,13)
(12,14)
(12,15)
(12,16)
(12,17)
(11,17)
(11,18)
(10,18)
(10,19)
(10,20)
(10,21)
(9,21)
(8,21)
(8,20)
(8,19)
(7,19)
(7,18)
(7,17)
(7,16)
(8,16)
(9,16)
(9,15)
(9,14)
(9,13)
(10,13)
(10,12)
(10,11)
(9,11)
(9,10)
(8,10)
(7,10)
(6,10)
(6,11)
(5,11)
(4,11)
(3,11)
(2,11)
(2,10)
(2,9)
(1,9)
_______________________________________________________________
