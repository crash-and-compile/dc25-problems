<!-- RATING: HARD -->
<!-- NAME: INCOMING -->
<!-- GENERATOR: generate.pl -->
# INCOMING

MISSION DIRECTIVE: Incoming enemy fighters! Aircraft have been deployed to intercept, however the enemy is jamming all radar for our aircraft. They are completely dependant on external sensor data.

Remote tracking systems have identified multiple incoming missiles targeting our aircraft. They need your analysis to relay immediate course corrections to our aircraft. Aircraft altitude is indicated by color, so red designated aircraft are only affected by incoming missiles with red indicators.

## INPUT
The input will be a Base64 encoded image showing aircraft locations and incoming missile vectors. Aircraft are identified as colored rectangles at the bottom of the image. Incoming missiles, obviously, are lines originating from the top.

Distinct images are indicated by a line of '%' characters.
 
## The Output
You must output the comma-delimited designations for aircraft that must change course. Aircraft designation will be relayed by color and index from the left side of the image. The first red rectangle from the left, for example, is RED1. Output order is RED,GREEN,BLUE. If no aircraft are targeted, output NONE.

Output one set of designations for each image, one per line.

## Sample input
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Sample output
RED4,GREEN2
