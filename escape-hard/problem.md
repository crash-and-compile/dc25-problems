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

The end of a map is indicated by a line of '%' characters.

## OUTPUT
You must output the (x,y) coordinates that provide the shortest route to escape, as shown below. The first coordinate will always be the location of the 'S', and the last will always be the coordinate of the 'E'.

Each set of coordinates for a route should end in a line of '%' characters.

## SAMPLE INPUT
    ===================================S================
    ========================    = =     ================
    =====================    ==     = =   ==============
    ================    = ===A = == =V= = ==============
    ================ == = = R=X=  =====B=  =============
    ================  = = = =  ==     L===   ===========
    ================= =   =  =  = == ======= ===========
    ================  ====R=   =H==      ===  ==========
    ================ =   =   = =    = ==   == ==========
    ===============  = =  == = A== ==  ===  =   ========
    ==============  == W=     == =   =    = L== ========
    ============== ========W=      = Y=== H===  ========
    =============  =      ==U = == Y==   ==    =========
    ============= =U ====  == =O==O=== =    ============
    =============  =======    ==B ==== =================
    ==============    ===========   ==   ===============
    ================= =   ===Z===== ==== =    ==========
    ==========   ==== = =   =    ==  =   ==== ==========
    =========  =  ==  = ===  X== ===   ====   ==========
    ========= === =  == ==  == =   ====   = ============
    ========= === = ==  === =   ==  === =   ============
    ========= === =  ===      =  == ==  ================
    ========  === == === = = ===  =Z== =================
    =======  ====  = ==  = === ==  === =================
    ======  ======   == == ==  ===     =================
    =====  ============ =====N== == ====================
    ===== =============  ==      =      ================
    ====  ==   ========= === == ==== ==   ==============
    ==== =   = ===   === ==  ==   ==   == ==   =========
    ====   === ==  =  == ==== = ===  =  =  = ===========
    ==========  ===== ==   ==    =  ===  = = ==   ======
    ===========  ===  ====   ===   =  ====   =  = ======
    ============ === ======= === =   ========  =  ======
    ==   =======  =  ======= =   = =====      == =======
    == =  ======= = ======== =====    == =======   =====
    == ==  ====== = ========  =   === == =========  ====
    ==  == ====== = =========   =   = == ========== ====
    ======   ==== =  ============== =  = ========== ====
    ==    == ==== ==  ===========   == =  ========= ====
    == ==  =  ==  ===   ========= ====  = ========= ====
    ==  ==  = == ==  N=     =====     = = ========= ====
    ===  == = == V== ====== ========= = = =======   ====
    ==== ==   ====   === == ========= === ======= ======
    == =   ===     = ==  == ==    ===  == ===     ======
    ==  ==   ======   = ===  = == ====  ====  ==========
    ===   ==  = == ==     ==   == =====  === ===========
    =====  == = =   = == = ====   ======  =  ===========
    ==   =  =     = = ==   ===  =========   ============
    E  ==== = == =   ==  ===== =========================
    ==  = =    = = =    == === =========================
    ===     == === == = ==     =========================
    ====================================================
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## SAMPLE OUTPUT
    (36,1)
    (36,2)
    (35,2)
    (34,2)
    (33,2)
    (32,2)
    (32,3)
    (31,3)
    (30,3)
    (29,3)
    (29,4)
    (29,5)
    (30,5)
    (30,6)
    (31,6)
    (32,6)
    (33,6)
    (33,7)
    (33,8)
    (32,8)
    (32,9)
    (31,9)
    (31,10)
    (31,11)
    (31,12)
    (30,12)
    (29,12)
    (28,12)
    (27,12)
    (26,12)
    (26,11)
    (25,11)
    (25,10)
    (25,9)
    (25,8)
    (26,8)
    (27,8)
    (27,7)
    (27,6)
    (27,5)
    (26,19)
    (25,19)
    (24,19)
    (24,20)
    (24,21)
    (24,22)
    (25,22)
    (26,22)
    (26,21)
    (27,21)
    (28,21)
    (28,22)
    (29,22)
    (29,23)
    (30,23)
    (30,24)
    (31,24)
    (31,25)
    (32,25)
    (32,26)
    (32,27)
    (33,27)
    (33,28)
    (33,29)
    (33,30)
    (32,30)
    (32,31)
    (31,31)
    (31,32)
    (30,32)
    (29,32)
    (29,31)
    (28,31)
    (28,30)
    (28,29)
    (28,28)
    (28,27)
    (27,27)
    (26,27)
    (26,26)
    (18,41)
    (17,41)
    (17,42)
    (17,43)
    (17,44)
    (17,45)
    (18,45)
    (18,46)
    (19,46)
    (20,46)
    (21,46)
    (21,47)
    (21,48)
    (21,49)
    (20,49)
    (20,50)
    (19,50)
    (18,50)
    (17,50)
    (17,49)
    (16,49)
    (16,48)
    (16,47)
    (15,47)
    (14,47)
    (14,48)
    (13,48)
    (12,48)
    (11,48)
    (10,48)
    (10,49)
    (10,50)
    (9,50)
    (8,50)
    (8,51)
    (7,51)
    (6,51)
    (5,51)
    (4,51)
    (4,50)
    (3,50)
    (3,49)
    (2,49)
    (1,49)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
