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
my $casecnt = 50;
for(my $cases = 0; $cases < $casecnt; $cases++){
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

	my %lines = qw(
A	5
E	4
F	3
H	4
K	3
L	1
M	3
N	2
T	2
V	1
W	3
X	4
Y	3
Z	2
);
my %n2l = reverse %l2n;

$lines{"#"} = 16;
$lines{"^"} = 1;
$lines{"<"} = 1;
$lines{">"} = 1;
$lines{"]"} = 2;
$lines{"["} = 2;
my @ones = ();
my @twos = ();
my @threes = ();
my @fours = ();
my @fives = ();
my @sixteens = ();
foreach my $ref (keys %lines){
	if($lines{$ref} == 1){
		push(@ones,$ref);
	} elsif($lines{$ref} == 2){
		push(@twos,$ref);
	} elsif($lines{$ref} == 3){
		push(@threes,$ref);
	} elsif($lines{$ref} == 4){
		push(@fours,$ref);
	} elsif($lines{$ref} == 5){
		push(@fivess,$ref);
	} elsif($lines{$ref} == 16){
		push(@sixteens,$ref);
	}
}
	my @phoen = qw(
ALPHA
BRAVO
CHARLIE
DELTA
ECHO
FOXTROT
GOLF
HOLIDAY
INDIGO
LIMA
KILO
);
	
	my $message = $phoen[int(rand(@phoen))] . "SQUADRONFORMATION" . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))];
	my @chars = split(//,$message);
	my $string = "";
	foreach my $char (@chars){
		my $cnt = $l2n{$char};
		while(!($cnt == 0)){
			if($cnt >= 16){
				$cnt -= 16;
				$string .= "#";				
			} elsif($cnt == 1){
				$cnt -= 1;
				$string .= $ones[int(rand(@ones))];
			} elsif($cnt == 2){
				$cnt -= 2;
				$string .= $twos[int(rand(@twos))];
			} elsif($cnt == 3){
				$cnt -= 3;
				$string .= $threes[int(rand(@threes))];
			} elsif($cnt == 4){
				$cnt -= 4;
				$string .= $fours[int(rand(@fours))];
			} elsif($cnt == 5){
				$cnt -= 5;
				$string .= "A";
			} else {
				my $rand = int(rand($cnt)) + 1;
				if($rand >= 16){
					$cnt -= 16;
					$string .= "#";				
				} elsif($rand == 1){
					$cnt -= 1;
					$string .= $ones[int(rand(@ones))];
				} elsif($rand == 2){
					$cnt -= 2;
					$string .= $twos[int(rand(@twos))];
				} elsif($rand == 3){
					$cnt -= 3;
					$string .= $threes[int(rand(@threes))];
				} elsif($rand == 4){
					$cnt -= 4;
					$string .= $fours[int(rand(@fours))];
				} elsif($rand >= 5){
					$cnt -= 5;
					$string .= "A";				
				}
			}
		}
		$string .= " ";
	
			 
	}
	$string =~ s/ $//;
	print DEBUG "CASE $cases:\nMESSAGE: $message\n";
	print DEBUG "CIPHER: $string\n";
	my @tokens = split(/ /,$string);
	foreach my $token (@tokens){
		print DEBUG "$token -> ";
		my @chars = split(//,$token);
		my $total = 0;
		foreach my $char (@chars){
			print DEBUG  $lines{$char};
			$total += $lines{$char};
		}
		print DEBUG " -> $total -> $n2l{$total}\n";
	} 


	#print "$encoded\n";
	print DEBUG "_____________________________________________________________\n";
	print INFILE "$string\n";
	print OUTFILE "$message\n";

}


