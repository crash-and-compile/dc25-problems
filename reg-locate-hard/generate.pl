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
	my $img = GD::Simple->new(200,200);
	$img->penSize(1,1);
	my $gcnt = int(rand(5)) + 5;
	my $rcnt = int(rand(2)) + 1;
	my $bcnt = int(rand(25)) + 25;
	my %centers = ();
	for(my $j = 0; $j < $rcnt; $j++){
		my $x = int(rand(170)) + 30;
		my $y = int(rand(170)) + 30;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 5); $xc < ($x + 5); $xc++){
				for(my $yc = ($y - 5); $yc < ($y + 5); $yc++){
					if($centers{"$xc,$yc"} ne ""){
						#print "($x,$y) OVERLAP WITH $xc,$yc...\n";
						$overlap++;
					}
				}			
			}
			if($overlap == 0){
				$spaced++;
				$centers{"$x,$y"} = 1;

			} else {
				$x = int(rand(180)) + 10;
				$y = int(rand(180)) + 10;;
			}
		}
		$img->bgcolor(red);
		$img->fgcolor(red);
		$img->moveTo($x,$y);
		my $width = int(rand(20))+40;
		$img->ellipse($width,$width);
	}
	my %centers = ();
	for(my $j = 0; $j < $gcnt; $j++){
		my $x = int(rand(170)) + 30;
		my $y = int(rand(170)) + 30;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 5); $xc < ($x + 5); $xc++){
				for(my $yc = ($y - 5); $yc < ($y + 5); $yc++){
					if($centers{"$xc,$yc"} ne ""){
						#print "($x,$y) OVERLAP WITH $xc,$yc...\n";
						$overlap++;
					}
				}			
			}
			if($overlap == 0){
				$spaced++;
				$centers{"$x,$y"} = 1;
			} else {
				$x = int(rand(180)) + 10;
				$y = int(rand(180)) + 10;;
			}
		}
		$img->bgcolor(green);
		$img->fgcolor(green);
		$img->moveTo($x,$y);
		$img->ellipse(30,2);
		$img->ellipse(10,10);
	}
	my %centers = ();
	for(my $j = 0; $j < $bcnt; $j++){
		my $x = int(rand(170)) + 30;
		my $y = int(rand(170)) + 30;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 5); $xc < ($x + 5); $xc++){
				for(my $yc = ($y - 5); $yc < ($y + 5); $yc++){
					if($centers{"$xc,$yc"} ne ""){
						#print "($x,$y) OVERLAP WITH $xc,$yc...\n";
						$overlap++;
					}
				}			
			}
			if($overlap == 0){
				$spaced++;
				$centers{"$x,$y"} = 1;
			} else {
				$x = int(rand(180)) + 10;
				$y = int(rand(180)) + 10;;
			}
		}
		$img->bgcolor(blue);
		$img->fgcolor(blue);
		$img->moveTo($x,$y);
		$img->ellipse(2,2);
	}



	my $encoded = MIME::Base64::encode($img->png);
	$decoded = MIME::Base64::decode($encoded);
	my $debugfile = "debug/" . $case . ".png";
	#open my $out, '>', $debugfile or die;
	#binmode $out;
	#print $out $img->png;
	$encoded =~ s/\n//g;
	print INFILE "$encoded\n";
	print OUTFILE $gcnt + $bcnt . "\n";
	print HTML "GREEN=$gcnt<br>";
	print HTML "BLUE=$bcnt<br>";
	print HTML "RED=$rcnt<br>";
	print HTML "SHIPS=" . ($gcnt + $bcnt) . "<br>";
	print HTML "CASE $cases:<br>\n<img width=300 height=300 src='data:image/png;base64,".$encoded."'><br><hr>";
}
