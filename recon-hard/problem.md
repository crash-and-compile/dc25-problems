<!-- RATING: HARD -->
<!-- NAME: RECON -->
<!-- GENERATOR: generate.pl -->
# RECON

MISSION DIRECTIVE: Reconnaissance teams have isolated multiple enemy installations. Intelligence continues to trickle in about potential targets, however we only get one shot at this. We do not have enough munitions to cover all targets, we need to isolate only the relevant sectors for our bombing campaigns. 

The latest batch of intelligence photos should provide enough information for us to finally take the fight back to the invasion fleet and push them out of our system. They contain critical information about topography for the regions. The images we have recieved, however, have been modified during transmission by enemy interceptors. The images have not only been reordered, but have been rotated in some cases as well.

You must reconstruct the images so we can develope an accurate target profile.


## INPUT
The input will be a series of index values and Base64 encoded images, tab delimited one per line.

Groups of images are indicated by a line of '%' characters.
 
## The Output
You must output the correct sequence to order the images, left-to-right, top-to bottem. For example, to order the images like:
	123
	456
	789

the output should be

	123456789


## Sample input
    1	iVBORw0KGgoAAAANSUhEUgAAABgAAAAeCAMAAAAB8C7XAAAA6lBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYHBwcJCQkMDAwNDQ0PDw8SEhIUFBQaGhobGxslJSUmJiYxMTE0NDQ8PDxCQkJDQ0NMTExNTU1QUFBRUVFUVFRcXFxhYWFkZGRlZWVmZmZpaWlsbGxxcXF3d3d6enp9fX2Hh4eJiYmMjIyOjo6cnJyenp6oqKitra2urq6vr6+2tra4uLi9vb3IyMjJycnLy8vW1tbc3Nze3t7i4uLj4+Pl5eXm5ubp6enr6+vt7e3x8fHz8/P19fX29vb39/f4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7///91ImJ9AAABCklEQVQokeVSB27DMAw8WYqb7jbdw91775E23XUsm/z/d0rKbpoAyQtKQMDpjuRRA5C4itAd21wwBcSrPcK7CFwKb67DGhwyFVQKxAdCVEL8pDyDWRNaw+a3YNNrpyAI8HumHMDimom0QpYAukUpRGPPJAXiIf2IC3qdDi4RNr5DogelWV5Ir31jRXA4psJnac74VI/0q32OmggxLlOvtjdYWD9tKmxNRNLLxi/sHy+2VqYka3RmbinZPWoEk5HF5fnGeJivOnS9Xo2r4ZzOaCJr/27RysbgP4QbqMQD+EkM9aNruJvt001fk5sJbO8X1f0OMv44Edh108YhOmuDc+b7BJ2fqGDtgfkHqg0tCmNmROUAAAAASUVORK5CYII=
    2	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAAolBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYREREVFRUXFxcgICAkJCQlJSUnJycsLCw6Ojo9PT1CQkJNTU1dXV1sbGx0dHR1dXV5eXmAgICGhoaJiYmPj4+WlpaXl5empqaurq64uLi9vb2/v7/GxsbIyMjPz8/S0tLf39/j4+Pk5OTm5ubn5+fo6Oj19fX39/f5+fn6+vr7+/v8/Pz9/f3+/v7///8XUTWSAAAA3klEQVQokW3R53bCMAwF4CsH0l3oontASyej2Lrv/2pVOIFiR/qp71xJToCyAt6VVh0A9ma+BFzM6UoVHtXP9PCqyRPByZcvfbmN/rSAF0ZPggy+Gb3batynmJxMkKMpV+pkaoxiWl9WiGB/YhEn08elrtpIJgHHtoXalZ5cc9n2M6lwvtisz0Rw+BZ/2c2I4InLf9hKENxlwO0O3HChO8DNQw4eDFhKVWE4ae7dBROpgauPDtAG4Wycmg+cg2VOn2dsflYBxPjH+onlDivrpXLS51rUHqEFTNuMUw38ASLDTkEM6pgBAAAAAElFTkSuQmCC
    3	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAA8FBMVEUAAAABAQECAgIDAwMEBAQGBgYHBwcICAgKCgoNDQ0QEBARERETExMVFRUXFxcZGRkaGhodHR0hISEjIyMkJCQmJiYoKCgrKyssLCwyMjI1NTU7Ozs8PDxAQEBBQUFGRkZMTExOTk5SUlJWVlZjY2NkZGRnZ2dra2ttbW11dXV5eXl+fn6GhoaHh4eJiYmLi4uMjIyPj4+RkZGcnJyjo6OoqKitra2xsbGzs7O/v7/CwsLFxcXPz8/Q0NDR0dHU1NTa2tro6Ojp6enr6+vy8vLz8/P19fX39/f4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7////YPvAgAAABBklEQVQokZ3P2VYDIQwG4ABt3bV1X2qr1n1f6m6tdcVhIO//Nv4wWj1HcyMXMMlHEobo91J0z8x/AORSEKIzUQ5E2RNlQ5SWKE1RFkSZFaUmyogoWhT6h4yJMv9TlCpOY7Ct9kVpbIOj1cn6+mkDn9ufEvND04vtzgsSvEIlOi4E5RPL7WcEPrPuYY40XSQxNNy6RtbmPgTLJxVM7BQ19XNm6zwHDt5la2g20Euy2eM3h2xA9O5vamjWsFGOcsYZ00DHu6S1OvRR2LviPlbmuzOkS3QbA0oDuCjJeZ+MUlOPMUPfwI7vxpU2aselmi/Au/3rFv6hjGZpTr8Vel1VynjZ0lOI8gFlPk/HDNfCYwAAAABJRU5ErkJggg==
    4	iVBORw0KGgoAAAANSUhEUgAAABgAAAAeCAMAAAAB8C7XAAAAZlBMVEUAAAABAQECAgIDAwMEBAQFBQUJCQkbGxsgICAnJyc5OTk/Pz9LS0tTU1Nra2tsbGx2dnaNjY2Ojo6QkJCwsLCysrK8vLzPz8/S0tLb29vl5eXr6+v19fX39/f4+Pj7+/v+/v7///8j96p4AAAAQUlEQVQokWNgGAWjgH6AiYGZiRFDlJEZKsaILAfjiAtzs6Fp4ACTigpy0hIigvw8nMws7Fy8AkJikjIQCSwAJA4Ae9gEVn64s2UAAAAASUVORK5CYII=
    5	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAAulBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYHBwcPDw8RERETExMVFRUXFxcaGhofHx8vLy8xMTE8PDxJSUlLS0tOTk5WVlZXV1dZWVldXV1eXl5iYmKEhISHh4eMjIyTk5OampqgoKCtra22tra8vLzAwMDBwcHDw8PMzMzPz8/T09PV1dXd3d3g4ODh4eHj4+Pr6+vv7+/w8PDx8fHz8/P09PT39/f4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7///8xWY2oAAAA4UlEQVQokXXR2XLCMAwF0Osk7Muwt7QwhbAO61DKkjj6/99CSQlEYOvRZ65lyQAXmSoGRBSJw90yFc0gbJcKUcgxmUukPz2S1m99lOsBXwui4CUUZ9wcysNfuspeSR9w7GNFF0H/ApVHY0LnLCEtDzVf0EPgoupnL3wKHNTn0fMZGeFUcxsGKUHS5/kxMiSpb7re9ytFoTSjwJTh+3qHKEz29CIoYESBNmS4U3sf/8m7II+xRRzV5d8yCa9iaRFP/WjjbTxT58/0tpiKG3OGp/UtGUcNLBmF1sksQOVoE6xZbn4nTcYLmXFdAAAAAElFTkSuQmCC
    6	iVBORw0KGgoAAAANSUhEUgAAABgAAAAeCAMAAAAB8C7XAAAAUVBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYKCgotLS0/Pz9WVlZYWFhoaGhsbGySkpKbm5vS0tLo6Oju7u7v7+/y8vLz8/P6+vr8/Pz9/f3+/v7////dH9ZfAAAAUElEQVQoke3MORaAIBBEwQ8q7uKOzP0Pqs9MIPAAVDjdPYiTWfNRL8+Ry+0NgXb1jtOPKgzoD0GmMgo0w4Y1Ohqg6KhU/AmKd5diSPWz7J8bWXICUU4VRrUAAAAASUVORK5CYII=
    7	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAA7VBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYICAgJCQkNDQ0ODg4SEhIUFBQYGBgaGhobGxsdHR0hISEnJycqKiotLS0vLy80NDQ2NjY3Nzc4ODg8PDxCQkJERERHR0dISEhJSUlSUlJTU1NYWFhaWlpvb291dXV2dnZ3d3d+fn6CgoKLi4uMjIyQkJCRkZGTk5OZmZmdnZ2ioqKlpaWqqqqtra20tLS7u7u8vLy9vb3BwcHHx8fNzc3W1tbc3Nzf39/n5+fq6urr6+vu7u7w8PDy8vL29vb39/f4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7////PNlVLAAABC0lEQVQokXXNaVMCMQwG4LfdBQ/AE2/xwBPxPvFARRG6u23+/88x24KDM5t8yEzy5G3hyJdzLqXbcilSzb6z+QY0IiJrv/YRlfBCQRI+H6UMXU/HkWplFDKGxrHMfm6jpJZ6fkaXjA0x5xI6hY7xHDIbT+SMC5bYTg2RPkm9oNY2ZBI2cpnrNxBheeAlBnbv+Ny/OaQDXuj3kNEKlZ17/sakdujOYqXwGAScR2W9/cHTIOnMQeFiLFBs5cXNqzei3io0jv6ETXObqi40zussexOSo8p7nJ/U/8tEzYgCUWZFmRdlRZQtUZqiHIrSEuVSEIUHMfMqZrpSpvpd+BLX2k/xXuM4K5YIN/6PX5nyUALD0E0TAAAAAElFTkSuQmCC
    8	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAA0lBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYHBwcICAgJCQkKCgoNDQ0PDw8QEBASEhITExMZGRkfHx8qKio7Ozs9PT0/Pz9CQkJERERISEhRUVFXV1daWlpbW1tra2ttbW1ubm51dXV7e3t/f3+AgICEhISJiYmNjY2Pj4+WlpaampqdnZ2fn5+ioqK6urrFxcXKysrMzMzS0tLV1dXf39/g4ODi4uLk5OTm5ubp6ens7Ozx8fHz8/P09PT29vb4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7///+IPoozAAABHUlEQVQokW2S50LDMAyELzEUyiijzLJH2ZTRQqGMJLbu/V8JxU0D1NZPfT7pJAuMhtAhmhcWjBEhc44ixIPBflSTs7+BkIgUMmyjERChde+bmA00arf47JQA00CsnHkQaIS3zRQhUfC4iCQg2oSj5QpgWrKHSfw3zBtESFmrvxAjlCxvI0J0K7xoRIh+iTy3ECPy7XYnhgGTopZkvGuZihjzR1Nkr+swPp/o2ra7+G1/OjcGM8DW9bC+g1weVuE3aTB/+UJmqCTOHY1rGez09KGTSpPzfsm3T3HwRmv1rSeqyA7L+ur6/EsHK+8H3nHOXjPxjrtO1yr1pNrmpJSkOLZ0+hUTIpZPK1rIoPOhQDM1EbnSo0iwNtBSvofGD9LuijN+RTBFAAAAAElFTkSuQmCC
    9	iVBORw0KGgoAAAANSUhEUgAAABkAAAAeCAMAAADuMkXpAAAAw1BMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYHBwcJCQkLCwsPDw8RERETExMgICAkJCQlJSUoKCgzMzNBQUFCQkJISEhKSkpUVFRcXFxdXV1vb29wcHB7e3t9fX2Pj4+QkJCRkZGVlZWgoKChoaGioqKtra2urq6ysrK0tLS3t7e8vLzCwsLIyMjJycnNzc3Ozs7Z2dnb29vd3d3g4ODj4+Pn5+fp6enw8PDx8fH19fX4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7///8R4y2KAAABE0lEQVQokXXS6VaDMBQE4AkgqNWqda1brbvWfUElJJn3fypvUmzxkObvx0xu7gGQ4yyvkCfYeqMhHcNBEMOPAdIMR6R1DQWh0FjlyHBBa/9l5MvPHaRIcOcpGII7pzkuckAt3/sCNxOpN+WehKBwSdb+rkYcK96sKgUpPP1iXc9E+gyHqYSwhP1bUus/kQr9siEJT9nxw/ye0Dda8SEZHv3h9Tzj3M/3bngElNhaS2Sk596UkIixRZonRUMyPlvkqmqA2WkLLd/zmAQ6j4ov5EFUfKjsLcg4PhYxCXaWpRGR/dv60C+om6Ex5bastSNSV9vXTaGOiNV86kcy/irNyXo0Q1dxEpMpRSUUxsX/cAtEZv8FDgmLC6ysQ0MAAAAASUVORK5CYII=
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Sample output
    245763918
