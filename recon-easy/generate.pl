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



my $casecnt = 20;
opendir(IMAGES,"images");
my @files = readdir IMAGES;
my @imgs = ();
foreach my $fileref (@files){
	next unless ($fileref =~ /\.png/);
	push(@imgs,"images/$fileref");
}
for(my $cases = 0; $cases < $casecnt; $cases++){

	my $file = $imgs[int(rand(@imgs))];
	my $img = newFromPng GD::Image("$file");
	my $encoded = MIME::Base64::encode($img->png);
	$encoded =~ s/\n//g;
	my $continue = 1;
	my @stokens = ();
	my @tokens = ();
	my %tokens = ();
	while($continue == 1){
		my $length = length $encoded;
		my $chunks = int(rand(3)) + 3;
		my $chunklength = $length/$chunks;
		$chunklength =~ s/\.(.*)//;
		my $ref = 0;
		@tokens = ();
		for(my $i = 0; $i < ($chunks+1); $i++){
			push(@tokens,substr($encoded,$ref,$chunklength));
			$ref += $chunklength;
		}
		my $mixed = "";
		my $cnt = 0;
		foreach my $token (@tokens){
			$tokens{$cnt} = $token;
			$cnt++;
		}
		my @tstokens = shuffle(@tokens);
		foreach my $token (@tstokens){
			$mixed .= $token;
		}
		if(!($encoded eq $mixed)){
			$continue = 0;
			foreach my $token (@tstokens){
				push(@stokens,$token);
			}

		}
	}
	my $mixed = "";
	foreach my $token (@stokens){
		if($token eq ""){ next; }
		print INFILE "$token\n";
		$mixed .= $token;
	}
	print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	my $fixed = "";
	foreach my $token (sort keys %tokens){
		$fixed .= $tokens{$token};
	}

	print OUTFILE "$encoded\n";
	print HTML "CASE $cases:<br>\n";
	print HTML "<img width=$iw height=$ih src='data:image/png;base64,$encoded'><br>\n";
	print HTML "<img width=$iw height=$ih src='data:image/png;base64,$mixed'><br>\n";
	print HTML "<img width=$iw height=$ih src='data:image/png;base64,$fixed'><br>\n";
	print HTML "<hr><br>\n";
}
