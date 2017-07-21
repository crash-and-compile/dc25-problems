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
	print HTML "CASE $cases<br>\n";
	my $iw = 500;
	my $ih = 500;
	$img = GD::Simple->new($ih,$iw);
	$img->penSize(3);
	my $gcnt = 5;
	my $rcnt = 5;
	my $bcnt = 5;
	my $gmcnt = int(rand(3)) + 1;
	my $rmcnt = int(rand(3)) + 1;
	my $bmcnt = int(rand(3)) + 1;
	my %centers = ();
	my %reds = ();
	my %greens = ();
	my %blues= ();
	my $tred = "RED" . int(rand(($rcnt+1)));
	my $tgreen = "GREEN" . int(rand(($gcnt+1)));
	my $tblue = "BLUE" . int(rand(($bcnt+1)));
	my @targeted = ();
	if(($tred =~ /0/)&&($tgreen =~ /0/)&&($tblue =~ /0/)){
		push(@targeted,"NONE");
		print HTML "NONE TARGETED<br>\n";

	}
	for(my $j = 0; $j < $rcnt; $j++){
		my $x = int(rand(100)) + 100*$j +10;
		my $y = $ih - 10;
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		my $desig = "RED".($j+1);
		if($tred eq $desig){
			print HTML "$desig is targeted!<br>\n";
			push(@targeted,$desig);
			$img->bgcolor(red);
			$img->fgcolor(red);
			$img->moveTo($x,$y);
			my $randx = int(rand($iw));
	    		$img->lineTo($randx,0);
			print HTML "MISSILE: $x,$y -> $randx,0<br>\n";
		}
		$reds{"$x,$y"} = "RED".($j+1);
		$img->bgcolor(red);
		$img->fgcolor(red);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);


	}
	for(my $j = 0; $j < $rmcnt; $j++){
		my $x = int(rand(100)) + 100*$j;
		my $y = $ih - 10;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 7); $xc < ($x + 7); $xc++){
				for(my $yc = ($y - 7); $yc < ($y + 7); $yc++){
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		$img->bgcolor(red);
		$img->fgcolor(red);
		$img->moveTo($x,$y);
		my $randx = int(rand($iw));
    		$img->lineTo($randx,0);
		print HTML "MISSILE: $x,$y -> $randx,0<br>\n";

	}
	for(my $j = 0; $j < $gcnt; $j++){
		my $x = int(rand(100)) + 100*$j +10;
		my $y = $ih - 10;
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		my $desig = "GREEN".($j+1);
		if($tgreen eq $desig){
			print HTML "$desig is targeted!<br>";
			push(@targeted,$desig);
			$img->bgcolor(green);
			$img->fgcolor(green);
			$img->moveTo($x,$y);
			my $randx = int(rand($iw));
	    		$img->lineTo($randx,0);
			print HTML "MISSILE: $x,$y -> $randx,0<br>\n";
		}
		$greens{"$x,$y"} = "GREEN".($j+1);
		$img->bgcolor(green);
		$img->fgcolor(green);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);


	}
	for(my $j = 0; $j < $gmcnt; $j++){
		my $x = int(rand(100)) + 100*$j;
		my $y = $ih - 10;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 7); $xc < ($x + 7); $xc++){
				for(my $yc = ($y - 7); $yc < ($y + 7); $yc++){
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		$img->bgcolor(green);
		$img->fgcolor(green);
		$img->moveTo($x,$y);
		my $randx = int(rand($iw));
    		$img->lineTo($randx,0);
		print HTML "MISSILE: $x,$y -> $randx,0<br>\n";

	}
	for(my $j = 0; $j < $bcnt; $j++){
		my $x = int(rand(100)) + 100*$j +10;
		my $y = $ih - 10;
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		my $desig = "BLUE".($j+1);
		if($tgreen eq $desig){
			print HTML "$desig is targeted!<br>\n";
			push(@targeted,$desig);
			$img->bgcolor(blue);
			$img->fgcolor(blue);
			$img->moveTo($x,$y);
			my $randx = int(rand($iw));
	    		$img->lineTo($randx,0);
			print HTML "MISSILE: $x,$y -> $randx,0<br>\n";
		}
		$blues{"$x,$y"} = "BLUE".($j+1);
		$img->bgcolor(blue);
		$img->fgcolor(blue);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);

	}
	for(my $j = 0; $j < $bmcnt; $j++){
		my $x = int(rand(100)) + 100*$j;
		my $y = $ih - 10;
		my $spaced = 0;
		while($spaced == 0){
			my $overlap = 0;
			for(my $xc = ($x - 7); $xc < ($x + 7); $xc++){
				for(my $yc = ($y - 7); $yc < ($y + 7); $yc++){
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
				$x = int(rand(100)) + 100*$j;
				$y = $ih - 10;
			}
		}
		$img->bgcolor(blue);
		$img->fgcolor(blue);
		$img->moveTo($x,$y);
		my $randx = int(rand($iw));
    		$img->lineTo($randx,0);
		print HTML "MISSILE: $x,$y -> $randx,0<br>\n";

	}
	my $debugencoded = MIME::Base64::encode($img->png);
	$img->bgcolor(white);
	$img->fgcolor(white);
	$img->rectangle(0,225,$iw,$ih);
	foreach my $red (keys %reds){
		my ($x,$y) = split(/,/,$red);
		print HTML "$reds{$red} is at $red<br>\n";
		$img->bgcolor(red);
		$img->fgcolor(red);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);
	}
	foreach my $green (keys %greens){
		my ($x,$y) = split(/,/,$green);
		print HTML "$greens{$green} is at $green<br>\n";
		$img->bgcolor(green);
		$img->fgcolor(green);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);
	}
	foreach my $blue (keys %blues){
		my ($x,$y) = split(/,/,$blue);
		print HTML "$blues{$blue} is at $blue<br>\n";
		$img->bgcolor(blue);
		$img->fgcolor(blue);
		$img->rectangle($x+2,$y+2,$x-2,$y-2);
	}

	my $encoded = MIME::Base64::encode($img->png);
	$decoded = MIME::Base64::decode($encoded);
	#my $debugfile = "debug/" . $case . "-" .$cases. ".png";
	#open my $out, '>', $debugfile or die;
	#binmode $out;
	#print $out $img->png;
	$encoded =~ s/\n//g;
	print INFILE "$encoded\n";
	print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	my $targeted = join(",",@targeted);
	if($targeted eq ""){ $targeted = "NONE";}
	print OUTFILE $targeted . "\n";
	print HTML "[$targeted]<br><img width=$iw height=$ih src='data:image/png;base64,$debugencoded'><br>\n<hr><br>";
}
