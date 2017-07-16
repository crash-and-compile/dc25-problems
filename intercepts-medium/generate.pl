#!/usr/bin/perl

($case) = @ARGV;
my $solution_file = $case;
my $problem_file = $case;
my $debug = $case;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
open(DEBUG,">debug/$debug");
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

	my %lines = qw(
C	1
E	4
F	3
H	3
K	3
L	2
M	4
N	3
O	1
P	2
Q	2
S	1
T	2
U	1
V	2
W	4
Y	3
Z	3
);
my %n2l = reverse %l2n;

$lines{"@"} = 1;
$lines{"#"} = 4;
$lines{"%"} = 3;
$lines{"^"} = 2;
$lines{"("} = 1;
$lines{")"} = 1;
$lines{"'"} = 1;
$lines{"-"} = 1;
$lines{"="} = 2;
my @ones = ();
my @twos = ();
my @threes = ();
my @fours = ();
foreach my $ref (keys %lines){
	if($lines{$ref} == 1){
		push(@ones,$ref);
	} elsif($lines{$ref} == 2){
		push(@twos,$ref);
	} elsif($lines{$ref} == 3){
		push(@threes,$ref);
	} elsif($lines{$ref} == 4){
		push(@fours,$ref);
	}
}


	my @strings = ();
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
	
	push(@strings,$phoen[int(rand(@phoen))] . "SQUADRONELEADERCOMMENCINGATTACKONTARGET" . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))]);
	push(@strings,$phoen[int(rand(@phoen))] . "SQUADRONEFORMUPONSIGNAL" . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))]);
	push(@strings,$phoen[int(rand(@phoen))] . "SQUADRONEATTACKFORMATION" . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))]);
	push(@strings,$phoen[int(rand(@phoen))] . "SQUADRONEINCOMINGRESPONSEONVECTOR" . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))] . $phoen[int(rand(@phoen))]);

	my $message = $strings[int(rand(@strings))];
	my @chars = split(//,$message);
	my $string = "";
	foreach my $char (@chars){
		my $cnt = $l2n{$char};
		while(!($cnt == 0)){
			if($cnt == 1){
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
			} else {
				my $rand = int(rand(4)) + 1;
				if($rand == 1){
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
				}
			}
		}
		$string .= " ";
	
			 
	}
	$string =~ s/ $//;
	print DEBUG "CASE $cases:\n";
	print DEBUG "MESSAGE: $message\n";
	print DEBUG "CIPHER: $string\n";
	my @tokens = split(/ /,$string);
	foreach my $token (@tokens){
		print DEBUG "$token -> ";
		my @chars = split(//,$token);
		my $total = 0;
		foreach my $char (@chars){
			print DEBUG $lines{$char};
			$total += $lines{$char};
		}
		print DEBUG " -> $total -> $n2l{$total}\n";
	} 


	#print "$encoded\n";
	print INFILE "$string\n";
	print OUTFILE "$message\n";

}


