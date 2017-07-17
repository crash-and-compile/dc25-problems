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
	my @inputs = ();

	my $subcase = "a";
	my %stars = ();
	my %colored = ();
	for(my $i = 0; $i < 10; $i++){
		my $x = int(rand(50));
		my $y = int(rand(50));
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
		$stars{"$x,$y"} = 1;
		$colored{"$x,$y"} = "black";
	}
	my $targetw = 1;
	my $targetx = int(rand(50));
	my $targety = int(rand(50));
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
	print HTML "CASE $cases: <br>\n";
	my $subcaseref = 1;
	for(my $i = 0; $i < 8; $i++){
		my $subfile = $case . $subcase;
		$subcase++;
		$img = GD::Simple->new(51+$xoffset,51+$yoffset);
		$img->penSize(1,1);
		for(my $j = 0; $j < 51; $j+=10){
			$img->bgcolor(gray);
			$img->fgcolor(gray);
			$img->moveTo($j+$xoffset,0+$yoffset);
			$img->lineTo($j+$xoffset,50+$yoffset);
    		}
		for(my $j = 0; $j < 51; $j+=10){
			$img->bgcolor(gray);
			$img->fgcolor(gray);
			$img->moveTo(0+$xoffset,$j+$yoffset);
			$img->lineTo(50+$xoffset,$j+$yoffset);
    		}
		foreach my $star (keys %stars){
			my $w = $stars{$star} + int(rand(2));
			if(((int(rand(100))) % 2) == 1){
				$img->bgcolor(black);
				$img->fgcolor(black);
			} else {
				$img->bgcolor(green);
				$img->fgcolor(green);		
			}
			my ($x,$y) = split(/,/,$star);
			$img->moveTo($x+$xoffset,$y+$yoffset);
			$img->ellipse($w,$w);

		}
		$targetw += int(rand(2));
		if($i == $trigger){
			$img->bgcolor(red);
			$img->fgcolor(red);
			$img->moveTo($targetx,$targety);
			$img->ellipse($targetw,$targetw);	
		} else {
			$img->bgcolor(black);
			$img->fgcolor(black);
			$img->moveTo($targetx,$targety);
			$img->ellipse($targetw,$targetw);
		}
		my $encoded = MIME::Base64::encode($img->png);
		#print "$encoded\n";
		$decoded = MIME::Base64::decode($encoded);
		my $debugfile = "debug/" . $subfile . ".png";
		#open my $out, '>', $debugfile or die;
		#binmode $out;
		#print $out $img->png;
		$encoded =~ s/\n//g;
		push(@inputs,$encoded);	
		print HTML "$subcaseref: <img width=200 height=200 src='data:image/png;base64,".$encoded."'><br>";
		$subcaseref++;
	}
	print HTML "\n<hr>\n";
	foreach my $input (@inputs){
		print INFILE "$input\n";
	}

	print INFILE "_______________________________________________________________\n";
	print OUTFILE "$outx$outy\n";
}
