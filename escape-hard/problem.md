<!-- RATING: HARD -->
<!-- NAME:  ESCAPE -->
<!-- GENERATOR: generate.pl -->
# ESCAPE

MISSION DIRECTIVE: Evacuate all facilities.

Signficant damage has been reported to facilities in multiple locations. Local evacuation procedures have been impacted by power outages. Multiple requests are coming in for immediate assistance with evacuation routes.

You must use your local copy of the facility blueprints to identify efficient evacuation routes for designated facilities. You must find the fastest route possible to prevent further casualties. Unfortunately, the maps are not actual physical representations, but are likely logical representations of facility layoutss. So you must figure out a route considering you may jump to other locations on the map.
 
## INPUT
You will be provided an ASCII map consiting of spaces and '=' characters, as well as other alpha characters. The 'S' indicates your start position, the 'E' indicates the exit. You may only move up,down,left or right to a space, or to an alpha character.

Alpha characters represent jump points. When you move to an position with an alpha character, you must note the position in your path, and your next position will be the other location of the corresponding alpha character.

The end of a map is indicated by a line of '_' characters.

## OUTPUT
You must output the (x,y) coordinates that provide the shortest route to escape, as shown below. The first coordinate will always be the location of the 'S', and the last will always be the coordinate of the 'E'.

Each set of coordinates for a route should end in a line of '_' characters.

## SAMPLE INPUT
=======================================S============
==================================       M= K=     =
======    =================== ==   == ====K =  == ==
====   ==     ==========      =  ==G   = T=   = =  =
==== ======== ========== ====== ====G=   =  = =   ==
==== ======== ========== =      =====  = = =A=  = N=
==== =======  ========== = =====T==   =      ==  ===
====  ====== =========   = =====  = === = = =N = =U=
===== ======  ======== === ====== = ==  = = A=     =
===== =======   ====== ===  =====   =  =  ===F=U= ==
====  ===   ===    ===  ===  =======Z == ==F  ==   =
===  ==== =   ====  ===  ===  ==========   ==    =O=
=== == =  ===   === = == ====   =     =Z==   = = O==
==  ==   ======       =  =   == = === =  === = = =D=
== =======    ==== ==   == = == = ===  =  =  = = = =
==  ==   = ==   ==  == ==  = ==   ====  =   =D =   =
=== =  = =   ==  ====     == ==========  ===========
==  = == === ===  =   == ====  =========           =
== ==  =  =  ==== =====       ==================== =
==  ==  =   =====  ===  = ====    ==========   ==  =
===   = ========== ==  ==    = == =========  = == ==
===== =        ===  = === =======  ====     =  == ==
===   ========   ==   =         == ==== ====  =   ==
=== ======   ===  ===== === ======   ==  =   == ====
===   ==== =  =====   =====       == ===M= ==== ====
=====  ===  =  ==== ==      ===== == ===== ==== ====
====== ==== == ====  ==== = ===== ==  ==   ====   ==
======   =====   ===  ==   ==   == == == ===   == ==
======== ==   ==    =  ===    = == =  == ==  =    ==
=======  =  = ===== ==  === =  ==    ===    ========
======= =  == ===== ===   = ==    ==   =============
======= = === ===== =====  == = = == ===============
===   =   ===   === ====== == = =  =   =============
=== =  ==== ===     ==   = ==   == ===  ============
=== == = == ========== === ============ ============
==  ==   == =    === = ==  ======    =  ============
== ======== = ==== =   == =   === ==   =============
==   =====  =        =  =   =   = ==================
==== =   = ======== ===  ======   ==================
====   = =      ===    = ===========================
== =====  =====     == =  ==========================
== == === ==   === === == ==========================
==    = = == =        === ==========================
=====      ====== ===  == ==========================
====  == ===  ==    ====  ==========================
===  ==   === ==== = ==  ===========================
==  ==  =     = =    =  ============================
E  ==  == = = =   ===  =============================
==  ===== ==  = =  == ==============================
== ====   ===   ===== ==============================
====    ==    =  ==   ==============================
====================================================
_______________________________________________________________

## SAMPLE OUTPUT
(40,1)
(40,2)
(39,2)
(38,2)
(38,3)
(38,4)
(39,4)
(39,5)
(40,5)
(41,5)
(41,6)
(41,7)
(42,7)
(43,7)
(43,6)
(43,5)
(44,5)
(44,4)
(45,4)
(46,4)
(46,3)
(47,3)
(47,2)
(48,2)
(49,2)
(50,2)
(50,3)
(50,4)
(50,5)
(49,5)
(48,5)
(48,6)
(48,7)
(49,7)
(49,8)
(49,9)
(50,9)
(50,10)
(50,11)
(49,11)
(49,12)
(48,12)
(47,12)
(46,12)
(38,29)
(37,29)
(37,30)
(36,30)
(35,30)
(34,30)
(34,31)
(33,31)
(32,31)
(31,31)
(31,30)
(30,30)
(30,29)
(29,29)
(28,29)
(27,29)
(27,28)
(26,28)
(26,27)
(26,26)
(27,26)
(28,26)
(28,25)
(28,24)
(28,23)
(27,23)
(26,23)
(26,22)
(26,21)
(26,20)
(26,19)
(25,19)
(25,18)
(25,17)
(24,17)
(23,17)
(23,16)
(23,15)
(22,15)
(22,14)
(21,14)
(20,14)
(19,14)
(19,15)
(22,37)
(21,37)
(21,38)
(20,38)
(20,39)
(20,40)
(20,41)
(19,41)
(19,42)
(19,43)
(18,43)
(18,44)
(18,45)
(19,45)
(19,46)
(19,47)
(18,47)
(18,48)
(17,48)
(16,48)
(16,49)
(16,50)
(15,50)
(14,50)
(14,49)
(14,48)
(14,47)
(13,47)
(12,47)
(11,47)
(10,47)
(10,46)
(9,46)
(9,45)
(9,44)
(8,44)
(7,44)
(6,44)
(6,45)
(5,45)
(5,46)
(4,46)
(4,47)
(3,47)
(3,48)
(2,48)
(1,48)
_______________________________________________________________
