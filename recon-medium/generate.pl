#!/usr/bin/perl
use GD;
use GD::Simple;
use MIME::Base64;
use List::Util qw(shuffle);

($case) = @ARGV;
my $solution_file = $case;
my $problem_file = $case;
my $debug = $case;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
open(HTML,">debug/$case.html");
opendir(IMAGES,"images");
my @files = readdir IMAGES;
my @imgs = ();
foreach my $fileref (@files){
	next unless (($fileref =~ /^cut/)&&(-d "images/$fileref"));
	push(@imgs,"images/$fileref");
}
my $casecnt = 15;
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
	foreach my $piece (@pieces){
		print "$piece\n";
		unless($piece =~ /\.png/){ next;}
		$img = newFromPng GD::Image("$files/$piece");
		my $width = $img->width;
		my $height = $img->height;
		    $img->transparent($white);
		    $img->interlaced('true');
		if($incnt == 0){
			$img->filledRectangle($width-10,$height-10,$width,$height,$yr);
		} elsif($incnt == 1){
			$img->filledRectangle($width-10,0,$width,10,$yr);
		} elsif($incnt == 2){
			$img->filledRectangle(0,$height,10,$height-10,$yr);
		} elsif($incnt == 3){
			$img->filledRectangle(0,0,10,10,$yr);
		}
		my $encoded = MIME::Base64::encode($img->png);
		$encoded =~ s/\n//g;
		push(@encoded,$encoded);
		$piece =~ s/image_part_00//;
		$piece =~ s/\.png//;
		$ref{$piece} = $encoded;
		$ref{$encoded} = $piece;
		#print "$encoded\n";
		$incnt++;
	}
	print HTML "Original image:<br>\n";
	print HTML "<img src='data:image/png;base64,$ref{1}'>";
	print HTML "<img src='data:image/png;base64,$ref{2}'><br>";
	print HTML "<img src='data:image/png;base64,$ref{3}'>";
	print HTML "<img src='data:image/png;base64,$ref{4}'><br>";
	my @sencoded = shuffle(@encoded);
	print HTML "Shuffled hashes:<br>\n";
	print HTML "<img src='data:image/png;base64,".$sencoded[0]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[1]."'><br>";
	print HTML "<img src='data:image/png;base64,".$sencoded[2]."'>";
	print HTML "<img src='data:image/png;base64,".$sencoded[3]."'><br>";
	my %mapping = ();
	my $cnt = 1;
	foreach my $encoded (@sencoded){
		print INFILE "$cnt\t$encoded\n";
		print HTML "Image $ref{$encoded} -> Hash $cnt<br>\n";
		$mapping{$ref{$encoded}} = $cnt;
		$cnt++;
	}
	print INFILE "_______________________________________________________________\n";
	print HTML "<br>\n";
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
		if($scnt == 2){ print HTML "<br>\n";}
		$scnt++;
	}
	print OUTFILE "$order\n";
	print HTML "<hr>\n";
}
