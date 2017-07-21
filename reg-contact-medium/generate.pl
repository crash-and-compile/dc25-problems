#!/usr/bin/perl

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
#open(DEBUG, ">./debug");

my $type = "";
my $string = "";
my $casecnt = 50;
for(my $cases = 0; $cases < $casecnt; $cases++){
	my %l2n = qw(
A	1
B	2
C	3
D	4
E	5
F	6
G	7
H	8
I	9
J	10
K	11
L	12
M	13
N	14
O	15
P	16
Q	17
R	18
S	19
T	20
U	21
V	22
W	23
X	24
Y	25
Z	26
);
	my %n2l = reverse %l2n;
	my @strings = (
"INITIATE COUNTER MEASURES WE HAVE BEEN DETECTED",
"PERHAPS THEY ARE NOT AS DUMB AS THEY LOOK",
"INCREASING SIGNAL COMPLEXITY",
"SUPPLY SHIPS SENT TO OUTER RIM",
"MESSAGE TRANSMITTED",
"ALL SHIPS PREPARE FOR INCOMING SOLAR FLARE",
"RADIATION LEVELS NORMAL",
"NO DAMAGE DETECTED",
"PROCEED WITH MISSION",
"NO RESPONSE FROM TARGET PLANET",
"ASSUME TARGET IS HOSTILE",
"INCOMING SURVEY DATA CONFIRMED",
"NO CURRENT DIRECTIVES",
"CONTINUE TO ADVANCE",
"REORIENT TOWARDS SOLAR PLANE",
"DECREASE INTERNAL GRAVITY SENSOR OUTPUT",
"POTENTIAL SIGNAL DETECTION CONFIRMED",
"GENERATE NEW SIGNAL ENCODING"
);
	my $message = $strings[int(rand(@strings))];
	my @signal = ();
	my @chars = split(//,$message);
	my $prev = "";
	my $longest = 0;
	foreach my $char (@chars){
		my $n = $l2n{$char};
		if($n eq ""){ $n = 0; }
		my $line = "*"x$n;
		my $pn = $l2n{$prev};
		$prev = $char;
		if($pn eq ""){ $pn = 0; }
		$line .= "*"x$pn;
		my $length = length $line;
		if($length > $longest){ $longest = $length;}
		#my $sn = 26 - $n;
		#my $line = " "x$sn . "#"x$n ."#" . "#"x$n . " "x$sn . "\n";
		push(@signal,$line);
	}
	foreach my $line (@signal){
		my $slen = length $line;
		my $spaces = $longest - $slen;
		$tline = " "x$spaces . $line;
		my @tline = split(//,$tline);
		my @rtline = reverse @tline;
		foreach my $char (@tline){
			print INFILE "$char";
		}
		foreach my $char (@rtline){
			print INFILE "$char";
		}
		print INFILE "\n";
	}
	print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	print OUTFILE "$message\n";

}


