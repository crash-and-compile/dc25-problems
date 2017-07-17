#!/usr/bin/perl
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
"INITIATE COUNTER MEASURES",
"SIGNAL HAS BEEN DETECTED",
"THEY KNOW WE ARE COMING",
"ALL SHIPS REPORT LOCATION",
"APPROACHING ASTEROID FIELD",
"NEW ENCODING DEPLOYED",
"REPORT ALL CONTACTS",
"WE HAVE THE TARGET IN SIGHT",
"THEY WILL NOT SURVIVE",
"TAKE NO PRISONERS",
"THE FATE OF OUR RACE DEPENDS ON OUR SUCCESS",
"DESTROY ALL INCOMING TARGETS",
"NO CONTACT YET FROM TARGET",
"BEAM ANALYSIS COMPLETE",
"TARGETING PROTOCOLS ENGAGED",
"MODIFYING TRANSMISSION RATE",
"ENCRYPTION KEY HAS BEEN COMRPOMISED",
"DISABLE ALL NON CRITICAL COMMUNICATIONS"
);
	my @false = (
"ABCDEFGHIJKLMNOPQRSTUVWXYZYXWVUTSRQPONMLKJIHGFEDCB",
"EFGHIJKLMNOPQRSTUVWXYZYXWVUTSRQPONMLKJIHGFEDCBABCD",
"OPQRSTUVWXYZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMN",
"TUVWXYZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRS",
"VWXYZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTU",
"XYZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTUVW",
"YZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTUVWX",
"UTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTUVWXYZYXWV",
"PONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTUVWXYZYXWVUTSRQ",
"WXYZYXWVUTSRQPONMLKJIHGFEDCBABCDEFGHIJKLMNOPQRSTUV"
);
	my $message = $strings[int(rand(@strings))];
	my $bmessage1 = $false[int(rand(@false))];
	my $bmessage2 = $false[int(rand(@false))];
	$bmessage1 = "$bmessage1"x4;
	$bmessage2 = "$bmessage2"x4;
	my @message = split(//,$message);
	my @bmessagea = split(//,$bmessage1);
	my @bmessageb = split(//,$bmessage2);
	my @signal = ();
	my $mix = int(rand(100));
	my $good = "";
	my $bad1 = "";
	my $bad2 = "";
	if(($mix % 3) == 0){
		$good = ".";
		$bad1 = "o";
		$bad2 = "O";
		$filler = "0";
	} elsif(($mix % 3) == 0){
		$good = "0";
		$bad1 = ".";
		$bad2 = "o";
		$filler = "O";
	} else {
		$good = "O";
		$bad1 = "0";
		$bad2 = ".";
		$filler = "o";
	}
	
	my $length = length $message;
	my $longest = 0;
	for(my $i = 0; $i < $length; $i++){
		$m = "$good"x$l2n{$message[$i]};
		$b1 = "$bad1"x$l2n{$bmessagea[$i]};
		$b2 = "$bad2"x$l2n{$bmessageb[$i]};
		$ml = length $m;
		$b1l = length $b1;
		$b2l = length $b2;
		$lc = $ml + $b1l + $b2l;
		if($lc > $longest){ $longest = $lc; }
		push(@signal,"$m$b1$b2");
	}
	foreach my $line (@signal){
		my $slen = length $line;
		my $spaces = $longest - $slen;
		$tline = "$filler"x$spaces . $line;
		my $fline = join("",shuffle(split("",$tline)));
		print INFILE "$fline\n";
	}
	print OUTFILE "$message\n";
	print INFILE "_______________________________________________________________\n";
}


