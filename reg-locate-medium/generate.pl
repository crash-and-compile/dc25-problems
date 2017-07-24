#!/usr/bin/perl
use GD;
use GD::Simple;
use MIME::Base64;
use List::Util qw(shuffle);

use File::Path;
use File::Basename;

($problem_file, $solution_file) = @ARGV;
my $basepath = "./";
my($filename, $dirs, $suffix) = fileparse($problem_file);
unless(-d $dirs){ make_path($dirs); }
my($filename, $dirs, $suffix) = fileparse($solution_file);
unless(-d $dirs){ make_path($dirs); }
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

#open(HTML, '>&', \*STDOUT);
#open(HTML, ">./debug.html");

my $casecnt = 50;
for(my $cases = 0; $cases < $casecnt; $cases++){
	my $pass = 0;
	while($pass == 0){
		my @inputs = ();

		my $subcase = "a";
		my %stars = ();
		my %colored = ();
		my %history = ();
		my $targetref = (int(rand(100)) % 6);
		my $targetx = 0;
		my $targety = 0;
		for(my $i = 0; $i < 5; $i++){
			my $x = int(rand(43)) + 5;
			my $y = int(rand(43)) + 5;
			my $spaced = 0;
			while($spaced == 0){
				my $overlap = 0;
				for(my $xc = ($x - 10); $xc < ($x + 10); $xc++){
					for(my $yc = ($y - 10); $yc < ($y + 10); $yc++){
						if($stars{"$xc,$yc"} ne ""){
							#print "($x,$y) OVERLAP WITH $xc,$yc...\n";
							$overlap++;
						}
					}			
				}
				if($overlap == 0){
					$spaced++;
				} else {
					$x = int(rand(43)) + 5;
					$y = int(rand(43)) + 5;
				}
			}		
			if(($x % 10) == 0){
				if($x > 0){
					$x--;
				} else {
					$x++;
				}
			}
			if(($y % 10) == 0){
				if($y > 0){
					$y--;
				} else {
					$y++;
				}
			}
			if($i == $targetref){
				$targety = $y;
				$targetx = $x;
				$stars{"$x,$y"} = 1;
			} else {
				$stars{"$x,$y"} = 1;
				$colored{"$x,$y"} = "black";
				$history{"$x,$y"} = 1;
			}
		}

		my $targetw = 1;
		if($targetx > 40){
			$outx = "E";
		} elsif($targetx > 30){
			$outx = "D";
		} elsif($targetx > 20){
			$outx = "C";
		} elsif($targetx > 10){
			$outx = "B";
		} else {
			$outx = "A";
		}	
		if($targety > 40){
			$outy = 5;
		} elsif($targety > 30){
			$outy = 4;
		} elsif($targety > 20){
			$outy = 3;
		} elsif($targety > 10){
			$outy = 2;
		} else {
			$outy = 1;
		}	


		if(($targetx % 10) == 0){
			if($targetx > 0){
				$targetx--;
			} else {
				$targetx++;
			}
		}
		if(($targety % 10) == 0){
			if($targety > 0){
				$targety--;
			} else {
				$targety++;
			}
		}
		my $trigger = int(rand(5)) + 2;
		for(my $i = 0; $i < 10; $i++){
			my $subfile = $case . $subcase;
			$subcase++;
			$img = GD::Simple->new(51+$xoffset,51+$yoffset);
			$img->penSize(1,1);
			for(my $j = 0; $j < 51; $j+=10){
				$img->bgcolor(gray);
				$img->fgcolor(gray);
				$img->moveTo($j,0);
				$img->lineTo($j,50);
    			}
			for(my $j = 0; $j < 51; $j+=10){
				$img->bgcolor(gray);
				$img->fgcolor(gray);
				$img->moveTo(0,$j);
				$img->lineTo(50,$j);
    			}
			foreach my $star (keys %stars){
				if(((int(rand(100))) % 2) == 1){
					$img->bgcolor(black);
					$img->fgcolor(black);
				} else {
					$img->bgcolor(black);
					$img->fgcolor(black);		
				}
				my ($x,$y) = split(/,/,$star);
				if(($x == $targetx)&&($y == $targety)){ next; }
				$img->moveTo($x+$xoffset,$y+$yoffset);
				if($i == 8){
					my @history = split(//,$history{"$x,$y"});
					my $decrease = 0;
					for(my $k = 1; $k < @history; $k++){
						if($history[$k] < $history[$k-1]){
							$decrease++;
						}
					}
					if($decrease == 0){
						$img->ellipse(2,2);
						$history{"$x,$y"} .= 2;
						$stars{"$x,$y"} += 2;
					} else {
						$img->ellipse($stars{"$x,$y"},$stars{"$x,$y"});
						$history{"$x,$y"} .= $stars{"$x,$y"};
						$stars{"$x,$y"} = int(rand(4)) + 1;

					}
				} elsif($i == 9){ 
					my @history = split(//,$history{"$x,$y"});
					my $decrease = 0;
					for(my $k = 1; $k < @history; $k++){
						if($history[$k] < $history[$k-1]){
							$decrease++;
						}
					}
					if($decrease == 0){
						$img->ellipse(1,1);
						$history{"$x,$y"} .= 1;
						$stars{"$x,$y"} += 1;
					} else {
						$img->ellipse($stars{"$x,$y"},$stars{"$x,$y"});
						$history{"$x,$y"} .= $stars{"$x,$y"};
						$stars{"$x,$y"} = int(rand(4)) + 1;

					}
				} else {
					$img->ellipse($stars{"$x,$y"},$stars{"$x,$y"});
					$history{"$x,$y"} .= $stars{"$x,$y"};
					$stars{"$x,$y"} = int(rand(4)) + 1;		
				}		

			}
			if($i == 3){ $targetw += 1; }
			if($i == 6){ $targetw += 1; }
			if($i == 8){ $targetw += 1; }
			if($i == $trigger){
				$img->bgcolor(black);
				$img->fgcolor(black);
				$img->moveTo($targetx,$targety);
				$img->ellipse($targetw,$targetw);
				$history{"(target) $targetx,$targety"} .= $targetw;	
			} else {
				$img->bgcolor(black);
				$img->fgcolor(black);
				$img->moveTo($targetx,$targety);
				$img->ellipse($targetw,$targetw);
				$history{"(target) $targetx,$targety"} .= $targetw;	
			}
			my $encoded = MIME::Base64::encode($img->png);
			#print "$encoded\n";
			$decoded = MIME::Base64::decode($encoded);
			#my $debugfile = "debug/" . $subfile . ".png";
			#open my $out, '>', $debugfile or die;
			#binmode $out;
			#print $out $img->png;
			$encoded =~ s/\n//g;
			push(@inputs,$encoded);	
		}
		my $single = 0;
		foreach my $t (keys %history){
			#print "$t -> $history{$t}   ";
			my $decrease = 0;
			my @history = split(//,$history{$t});

			for(my $k = 1; $k < @history; $k++){
				if($history[$k] < $history[$k-1]){
					$decrease++;
				}
			}
			if($decrease == 0){
				#print "NO DECREASE\n";
				$single++;
			} else {
				#print "DECREASE\n";
			}

		}
		#print "$single INCREASING\n";
		if($single == 1){
			my $subcases = 1;
			print HTML "CASE $cases<br>";
			print HTML "$outx$outy HAS INCREASE<br>";
			foreach my $input (@inputs){
				print INFILE "$input\n";
				print HTML "$subcases:<br>\n<img width=300 height=300 src='data:image/png;base64,".$input."'><br>";
				$subcases++;
			}
			print HTML "<hr>";
			print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
			print OUTFILE "$outx$outy\n";
			$pass = 1;

		} else {
			#print "FAILED...rerunning...\n";
		}
	}
}
