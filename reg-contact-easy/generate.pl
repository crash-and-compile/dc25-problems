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

my $casecnt = 50;
for(my $cases = 0; $cases < $casecnt; $cases++){
	my $type = "";
	my $string = "";
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
"THIS IS A MESSAGE FROM OUTER SPACE",
"WE HAVE DETECTED YOU",
"YOU ARE NOT ALONE",
"THIS IS A WARNING",
"WE KNOW WHERE YOU ARE",
"SURRENDER IMMEDIATELY",
"YOU ARE NO LONGER SAFE",
"FIGHT OR DIE",
"WE ARE COMING",
"YOU WILL FALL BEFORE OUR MIGHT",
"RESISTANCE IS FUTILE",
"YOU ARE NOT GOING TO WIN",
"FORGIVENESS IS NOT IN OUR NATURE",
"ONLY THE STRONG SURVIVE",
"YOU ARE NOT WORTHY OF OUR SKIES",
"FATE HAS BROUGHT THIS END TO YOU",
"YOU ARE A BLIGHT ON THIS UNIVERSE",
"WE WILL DESTROY YOU",
"THE END OF YOUR TIME IS NOW",
"NOBODY EXPECTS THE SPANISH INQUISITION",
"FEAR IS ALL YOU HAVE LEFT",
"WE WILL BE THERE SOON",
"IF YOU DO NOT SURRENDER YOU WILL DIE",
"EARTH SHALL BE OURS",
"YOUR PLANET IS DOOMED",
"YOU MUST BE PREPARED"
);
	my $message = $strings[int(rand(@strings))];
	my @signal = ();
	my @chars = split(//,$message);
	foreach my $char (@chars){
		my $n = $l2n{$char};
		if($n eq ""){ $n = 0; }
		my $sn = 26 - $n;
		my $line = " "x$sn . "*"x$n ."*" . "*"x$n . " "x$sn . "\n";
		push(@signal,$line);
	}
	foreach my $line (@signal){
		print INFILE "$line";
	}
	print OUTFILE "$message\n";
	print INFILE "_______________________________________________________________\n";

}


