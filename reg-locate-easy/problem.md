<!-- RATING: EASY -->
<!-- NAME: LOCATE -->
<!-- GENERATOR: generate.pl -->
# LOCATE

MISSION DIRECTIVE: Intelligence and decryption services have detected anomolous signals originating from a nearby galaxy cluster. The initial assessment is that the signals have originated from an inhabited system. We are initiating a focused search in that cluster for potential signs of inhabited star systems.

Begin analysis of primary sectors G-9 through G-21. The key indicator of a potentially inhabitable star system is a red shift in the light detected by our sensors. Report all positive hits immediately to command. Each sector has supplied scans of light readings over a period of time. 

## INPUT
The input will be a series of Base64 encoded images, one per line. Each sector will have multiple images associated with it, representing light readings over time.

Images for different sectors are indicated by a line of '%' characters.

## The Output
Print the grid reference for potentially inhabited systems in that sector. The grid is arranged as follows:

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
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAW0lEQVQokWNYhQRWMDQwcDAACQkGMAvK46AXD6tbiDNFAIUXgkeOJLfMQnFLCIpKARLNPEGtcBFAURmC4Fmgy0EZzHBeAIpcCApPgDpx1MLAYYDgTUWXo1l6AQB1K3657Or2egAAAABJRU5ErkJggg==
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAYklEQVQokWNYBQGzQMQKhgYGDgYgEcIAZkF5Eig8DtrxViGBFaSZIoDCC8EjR5JbZqG4JQRFpQBBU04g85h/4JYjLVwEUFSGIHgW6HJQBjOcV4Ai9weFZ0C1OBJA8Froll4ACxWBV3OiRJ0AAAAASUVORK5CYII=
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAdElEQVQokWNYBQGzQMQKhgYGDgYgEcIAZkF5Eig8DtrxViGBFYT0CaDwQpB5nKG45dD0EXDLLBS3hKCoFCDRfyeoFS4CCDkLhKOAxB+4HDNEDih8AEjwH4CayXwBKgexIQTFPgHqxFELA4cBgjcVXY5m6QUAXHGC2ECtarIAAAAASUVORK5CYII=
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAU0lEQVQokWNYhQRWMDQwcDAACQsGMAvK46AXD6tbcOkTQOGFIPM4Q3HLoekjyS0GFPnvBG3CRQDBk8BiigOQYIbxGANQ5AKo7RYowwDB66FbegEAfZ1+9yyOQWIAAAAASUVORK5CYII=
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzBAMAAADIjy0ZAAAAD1BMVEX///8AAACAgIAAgAD/AADjPYHoAAAAbklEQVQ4jWNQwgUUGBQYgABOMCJzUaUYho0U0aFBml0suKVcHHBJqbi4kKELn100Cg3mAYovg6GRNhixSjFj0cWI4QwBGEtQAE2KURi3LmMDnP5iHoDQYMZqoACIMDbAIqUoSEAXxY6nuhTu0AAArP05ibqxpFsAAAAASUVORK5CYII=
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAZUlEQVQokWNYhQRWMDQwcDAACQsGMAvK46AXD6tbcOkTQOGFIPM4Q3HLoekj4JZZKG4JQVEpQKL/PKgVLgIIOQmEo4BECLockOEAJJhhZjIGoNgQQLlboMIGKCr/IHgt6HI0Sy8ATliAfwCcjBEAAAAASUVORK5CYII=
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAZ0lEQVQokWNYhQRWMDQwcDAACQsGMAvK46AXD6tbECpDkHmcocg81lAHInmo+lDNJOQWA4r8d4IG4WLB0CCA4P2ByzFD5IC8A0CC/wDUTOYPUDmIDReoH0cMDC0MHAII3lR0OZqlFwCXfoSMy/FlWQAAAABJRU5ErkJggg==
    iVBORw0KGgoAAAANSUhEUgAAADMAAAAzAgMAAABHz9i5AAAADFBMVEX///8AAACAgIAAgACBAIh3AAAAYklEQVQokWNYBQGzQMQKhgYGDgYgEcIAZkF5Eig8DtrxViGBFZgqQ5B5nKHIPNZQByJ5qPpQzSTkFgOK/OdBm3ARQPAkcJjCDOcVoMj9QeEZUCOOGBh6GDgMELz96HI0Sy8AhU+Bhdfc24cAAAAASUVORK5CYII=
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Sample output
    B2
