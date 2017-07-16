#!/usr/bin/perl

($case) = @ARGV;
my $solution_file = $case;
my $problem_file = $case;
my $debug = $case;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
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
"BEGIN ATTACK FORMATION",
"FIRST SHIP DEPLOY TO SOUTH",
"MIGRATE TO SOUTH",
"CENTRAL COMMAND MOVING TO SECONDARY SHIP",
"ACKNOWLEDGE TRANSMISSION OF LOGISTICS",
"FLEET MOVEMENT COORDINATED THROUGH CENTRAL COMMAND",
"MODIFY INCOMING VECTOR",
"DEPLOY FLEET TO MAIN LAUNCH ZONE",
"INITIATE CENTRAL DEFENSE SHIELDING",
"NOTIFY CENTRAL COMMAND OF TASK COMPLETION",
"STAR FORMATION ON TERMINATION",
"COMMUNICATION RELAY CHANNEL CONFIRMED",
"INTERPROCESS COMMUNICATIONS HALTED",
"DEPLOY DEPLOY DEPLOY",
"MASTER CONTROL OF INTERCEPTS RELAYED",
"NEGATIVE ON INCOMING TARGETS",
"FLEET COORDINATION COMPLETED"
);
	my $message = $strings[int(rand(@strings))];
	my @chars = split(//,$message);
	my $single = "";
	foreach my $char (@chars){
		my $n = $l2n{$char};
		if($n eq ""){ 
			$single .= "|";
		} else {
			$single .= "O"x$n . "|";
		}
	}
	
	my $length = length $single;
	
	if(($length % 2) == 1){
		$single .= "|";
	}
	my @single = split(//,$single);
	my $half = @single / 2;
	#for (my $i = 0; $i < @single; $i++){
		#if($i == $half){ print "\n"; }
		#print $single[$i];
	#}
	#print "\n";
	my $i = 0;
	my $j = $half;
	my $encoded = "";
	for (my $i = 0; $i < $half; $i++){
		if(($single[$i] eq "O")&&($single[$j] eq "O")){
			if((int(rand(100)) % 2) == 0){
				$encoded .= "B";
			} else {
				$encoded .= "8";
			}
		} elsif(($single[$i] eq "O")&&($single[$j] eq "|")){
			if((int(rand(100)) % 2) == 0){
				$encoded .= "P";
			} else {
				$encoded .= "9";
			}
		} elsif(($single[$i] eq "|")&&($single[$j] eq "O")){
			if((int(rand(100)) % 2) == 0){
				$encoded .= "b";
			} else {
				$encoded .= "d";
			}
		} elsif(($single[$i] eq "|")&&($single[$j] eq "|")){
			if((int(rand(100)) % 2) == 0){
				$encoded .= "|";
			} else {
				$encoded .= "l";
			}
		}	
		$j++;
	}
	


	#print "$encoded\n";
	print INFILE "$encoded\n";
	print OUTFILE "$message\n";

}


