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

#open(DEBUG, '>&', \*STDOUT);
#open(HTML, ">./debug.html");

opendir(IMAGES,"images");
my @files = readdir IMAGES;
my @imgs = ();
foreach my $fileref (@files){
	next unless (($fileref =~ /^cut/)&&(-d "images/$fileref"));
	push(@imgs,"images/$fileref");
}
my $casecnt = 10;
for(my $cases = 0; $cases < $casecnt; $cases++){

	my $files = $imgs[int(rand(@imgs))];
	opendir(PIECES,"$files");
	my @pieces = readdir PIECES;
	my @encoded = ();
	my %ref = ();

	my $incnt = 0;
	my $img = new GD::Image(100,100);
	$white = $img->colorAllocate(255,255,255);
	$black = $img->colorAllocate(0,0,0);       
	$red = $img->colorAllocate(255,0,0);      
	$blue = $img->colorAllocate(0,0,255);
	my $ocnt = 1;
	my %unrotated = ();
	my %rotated = ();
	foreach my $piece (@pieces){
		unless($piece =~ /\.png/){ next;}
		$img = newFromPng GD::Image("$files/$piece");
		my $width = $img->width;
		my $height = $img->height;
		my $rand = int(rand(100));
		$img->filledRectangle(0,0,3,3,$yr);
		my $origencoded = MIME::Base64::encode($img->png);
		my $rotate = 0;
		if(($rand % 5) == 0){
			$img->rotate180();
			$rotate += 1;
		}
		if(($rand % 5) == 1){
			$img->rotate180();
			$rotate += 1;
		}
		my $encoded = MIME::Base64::encode($img->png);
		$encoded =~ s/\n//g;
		push(@encoded,$encoded);
		$piece =~ s/image_part_00//;
		$piece =~ s/\.png//;
		$ref{$piece} = $encoded;
		$ref{$encoded} = $piece;
		$unrotated{$piece} = $origencoded;
		$rotated{$piece} = $rotate;
		#print "$encoded\n";
		$incnt++;
	}
	print HTML "Original image:<br>\n";
	print HTML "<img src='data:image/png;base64,$unrotated{1}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{2}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{3}'><br>";
	print HTML "<img src='data:image/png;base64,$unrotated{4}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{5}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{6}'><br>";
	print HTML "<img src='data:image/png;base64,$unrotated{7}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{8}'>";
	print HTML "<img src='data:image/png;base64,$unrotated{9}'><br>";
	print HTML "Rotated pieces:<br>\n";
	print HTML "<img src='data:image/png;base64,$ref{1}'>";
	print HTML "<img src='data:image/png;base64,$ref{2}'>";
	print HTML "<img src='data:image/png;base64,$ref{3}'><br>";
	print HTML "<img src='data:image/png;base64,$ref{4}'>";
	print HTML "<img src='data:image/png;base64,$ref{5}'>";
	print HTML "<img src='data:image/png;base64,$ref{6}'><br>";
	print HTML "<img src='data:image/png;base64,$ref{7}'>";
	print HTML "<img src='data:image/png;base64,$ref{8}'>";
	print HTML "<img src='data:image/png;base64,$ref{9}'><br>";
	my @sencoded = shuffle(@encoded);
	print HTML "Shuffled hashes:<br>\n";
	print HTML "<img src='data:image/png;base64,".$sencoded[0]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[1]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[2]."'><br>";
	print HTML "<img src='data:image/png;base64,".$sencoded[3]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[4]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[5]."'><br>";
	print HTML "<img src='data:image/png;base64,".$sencoded[6]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[7]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[8]."'><br>";
	my %mapping = ();
	my $cnt = 1;
	foreach my $encoded (@sencoded){
		print INFILE "$cnt\t$encoded\n";
		print HTML "Image $ref{$encoded} -> Hash $cnt  and Rotated = $rotated{$ref{$encoded}}<br>\n";
		$mapping{$ref{$encoded}} = $cnt;
		$cnt++;
	}
	print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	print HTML "<br>\n";
	my $order = "";
	foreach my $key (sort {$a <=> $b} keys %mapping){
		$order .= $mapping{$key};
	}
	my @orefs = split(//,$order);
	my $scnt = 1;
	foreach my $ordered (@orefs){
		print HTML "$ordered\n";
		print HTML "<img src='data:image/png;base64,".$sencoded[($ordered-1)]."'>";
		if(($scnt == 3)||($scnt == 6)||($scnt == 9)){ print HTML "<br>\n";}
		$scnt++;
	}
	print HTML "<hr>\n";
	print OUTFILE "$order\n";
}
