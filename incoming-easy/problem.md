<!-- RATING: EASY -->
<!-- NAME:  INCOMING -->
<!-- GENERATOR: generate.pl -->
# INCOMING

MISSION DIRECTIVE: Incoming! Incoming! Incoming!

Sonar sensors are detecting incoming torpedoes targeting our naval operations, but all tracking capabilities have been disabled on deployed vessels by enemy EMP generators.

Incoming torpedo positions have been relayed for rapid analysis. Communications are currently being interrupted, we can only send notification to a single vessel in each grid location.

## INPUT
Your input will be a either a designation of a vessel identification number and location, or a vector of an incoming torpedo, based on a Cartesian grid.
Vessel locations are in the format: #=(x,y) 
Torpedo vectors are in the format: INCOMING=(x1,y1)->(x2,y2)

Individual scenarios for a grid location are indicated by a line of '%' characters.


## OUTPUT
You must output the targeted base ID number for each grid location, one per line.

## SAMPLE INPUT
    1=(32919,70)
    2=(8851,37)
    3=(40594,50)
    4=(54099,3)
    5=(92502,20)
    6=(23120,19)
    7=(47557,91)
    8=(11273,93)
    9=(48737,74)
    10=(1106,37)
    11=(51997,60)
    12=(4712,79)
    13=(19480,71)
    14=(91437,38)
    15=(16303,30)
    16=(20626,27)
    17=(21469,12)
    18=(31546,92)
    19=(84829,29)
    20=(71997,73)
    21=(12063,29)
    22=(71082,60)
    23=(15680,66)
    24=(85437,18)
    25=(80766,7)
    26=(93082,55)
    27=(86456,26)
    INCOMING=(63367,11106)->(62992,10489)
    INCOMING=(93182,10501)->(92992,10263)
    INCOMING=(97286,61365)->(96351,60699)
    INCOMING=(73342,75430)->(73605,74425)
    INCOMING=(91941,20230)->(91414,20050)
    INCOMING=(25768,23068)->(26575,22217)
    INCOMING=(63427,32163)->(62604,31507)
    INCOMING=(102473,62194)->(102139,61533)
    INCOMING=(73897,71103)->(74008,70474)
    INCOMING=(98191,64178)->(97485,63625)
    INCOMING=(-52630,6127)->(-51752,6040)
    INCOMING=(-5047,11947)->(-4294,11838)
    INCOMING=(-3810,24912)->(-3112,24201)
    INCOMING=(64047,65302)->(63905,64465)
    INCOMING=(52620,9392)->(53088,9152)
    INCOMING=(69865,8971)->(68936,8663)
    INCOMING=(36220,18000)->(37008,17103)
    INCOMING=(137043,77382)->(136569,76559)
    INCOMING=(37004,5925)->(37147,5690)
    INCOMING=(39646,8654)->(39811,8498)
    INCOMING=(45134,43986)->(44520,43071)
    INCOMING=(-92936,96793)->(-91959,95959)
    INCOMING=(89899,68001)->(89920,67070)
    INCOMING=(-23482,32301)->(-22526,31614)
    INCOMING=(-6587,43476)->(-5812,42940)
    INCOMING=(137105,58878)->(136491,57987)
    INCOMING=(38798,12938)->(39021,12293)
    INCOMING=(-16081,32043)->(-15458,31500)
    INCOMING=(99648,76847)->(98706,76021)
    INCOMING=(73129,76587)->(73471,75707)
    INCOMING=(64519,3769)->(64765,3712)
    INCOMING=(72611,19525)->(72108,18916)
    INCOMING=(998,6819)->(1183,6482)
    INCOMING=(2073,32536)->(2860,32079)
    INCOMING=(54502,72032)->(54080,71165)
    INCOMING=(66910,36851)->(67047,35857)
    INCOMING=(100184,21182)->(99513,20220)
    INCOMING=(52585,52101)->(52966,51155)
    INCOMING=(76193,2549)->(75330,2458)
    INCOMING=(40172,75939)->(40001,75195)
    INCOMING=(28053,27248)->(28809,26823)
    INCOMING=(9580,25285)->(9315,24496)
    INCOMING=(7918,6424)->(8442,6369)
    INCOMING=(3644,51578)->(4572,50606)
    INCOMING=(88891,19550)->(88146,18921)
    INCOMING=(18814,7264)->(19392,6938)
    INCOMING=(38536,24897)->(38824,24436)
    INCOMING=(65273,17364)->(64421,17076)
    INCOMING=(9055,18655)->(9897,18316)
    INCOMING=(47824,18695)->(48752,17765)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                     
## SAMPLE OUTPUT
    7
