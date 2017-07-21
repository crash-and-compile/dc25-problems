<!-- RATING: MEDIUM -->
<!-- NAME: LOCATE -->
<!-- GENERATOR: generate.pl -->
# LOCATE

MISSION DIRECTIVE: Preliminary scans have identified a series of potentially inhabited systems in nearby galactic clusters, one of which could be the potential source of the anomolous signals. Initiate proximity scans over the identified sectors to determine additional information. Signals intelligence speculate that an incoming fleet may be detected.

Begin analysis of primary sectors G-9-35 through G-9-41. The key indicator of a potential fleet is the consistent decrease in distance from the detection point. This will be seen in analysis as an overall increase in the perceived size of the object. Planetary elements, however, will appear to "wobble", or decrease in apparent size at some point due to gravitational shifts.  

## INPUT
The input will be a series of Base64 encoded images, one per line.

Images for different sectors are indicated by a line of '%' characters.

## The Output
Print the grid reference for potential incoming fleet from each image. The grid is arranged as follows:

  A B C D E
 ***********
1* * * * * *
 ***********
2* * * * * *
 ***********
3* * * * * *
 ***********
4* * * * * *
 ***********
5* * * * * *
 ***********

For example, the upper left quadrant is referenced as A1.

## Sample input
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAMklEQVQokWNYhQRWMDQwcDAgCKrzHPCrpL1bWjDkWAbMLYR4DtR2iwM1XDbg4cKIwy0Ao718Qm9cfYoAAAAASUVORK5CYII=
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAR0lEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAELdzSgsKbCsQsKHKiKPpYaOoW0ngO1HaLAzVcNgDhwojCY0UJl5VwtwAAWzh9SZHsvUcAAAAASUVORK5CYII=
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAATUlEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAEddzSgsKbisILdUCXY8Ghj8bhQgTPgXK3oPgWFPq45Ig3cwDChRGFx4oSLivhbgEA+gR966A0K3UAAAAASUVORK5CYII=
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAVklEQVQokWNYhQRWMDQwcDAgCLJ4Dsi8xgBkXmsIbjmQPqq7BUi0oPCmAjELipwoij6EHC3cQojngMxjDEBxSxY5bnFA5oHCG5cc8WYORLig8BhxuAUAfxd+USWJTUgAAAAASUVORK5CYII=
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAV0lEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAELdzSgsKbCsQsKHKiKPpYaOoWQjwHZB5jAIpbsshxiwMyDxT6uOSIN5Mu4cKIwmNFCRdRlHBZCg8XAP6rfgyhID6HAAAAAElFTkSuQmCC
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAUUlEQVQokWNYhQRWMDQwcDAgCKrzHPCrpIVbWlB4U4GYBUVOFEUfC03dQojngMxjDEBxSxY5bnFA5jUG4JYj3ky6hAsjCo8VJVxEUcJlKTxcAKh/fXuaB3UiAAAAAElFTkSuQmCC
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAUUlEQVQokWNYhQRWMDQwcDAgCKrzHPCrpJVbWOC8FiAWRZELdUDmiaK4ZRm9wgXKc0DmMQaguCWLOLc4IPMaA5B5rSG45VD1DUQcEc1jxOEWADqffckH4wvuAAAAAElFTkSuQmCC
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAV0lEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAELdzSgsKbCsQsKHKiKPpYaOoWQjwHZB5jAIpbsshxiwMyDxT6uOSIN5Mu4cKIwmNFCRdRlHBZCg8XAP6rfgyhID6HAAAAAElFTkSuQmCC
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAXklEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAELdzSgsKbiiHHgkMfjcMFynNA5jEGIPNYQ5DdsjIKxS0OxNnggMwDhT4uOeJdTZdwYUThsaL4VjQA2S1Ls2BuAQB08X57ma1oaAAAAABJRU5ErkJggg==
iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAACVBMVEX///8AAACAgIBJX6m2AAAAZklEQVQokWNYhQRWMDQwcDAgCCrwHJB5jQG45UAELdzSAsQscN5UIBZFkQt1QNYniuKWZbQLFyjPAZnHGIDMYw1BdsvKKBS3OBBngwMyDxT6uOSIdzWN0ws2HiMKj9UB2S0r4W4BANTQfpVNtppIAAAAAElFTkSuQmCC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Sample output
B3
