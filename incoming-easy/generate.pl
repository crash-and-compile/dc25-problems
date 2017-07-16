#!/usr/bin/perl
use List::Util qw(shuffle);

($case) = @ARGV;
my $solution_file = $case;
my $problem_file = $case;
my $debug = $case;
open(INFILE,">input/$problem_file");
open(OUTFILE,">output/$solution_file");
open(DEBUG,">debug/$debug");
my $casecnt = 50;
for(my $cases = 0; $cases < $casecnt; $cases++){
	my @debug = ();
	my %used = ();
	my @endpoints = ();
	for(my $i = 0; $i < 50; $i++){
		my $x = int(rand(100000)) + 100*$i;
		my $y = int(rand(100));
		my $range = 1;
		while($range > 0){
			$range = 0;
			for(my $j = 0; $j < 10; $j++){
				if($used{$x+$j} ne ""){
					$range++;
				}
				if($used{$x-$j} ne ""){
					$range++;
				}
			}
			if($range > 0){
				 $x = int(rand(100000));
			} else {
				$used{$x} = 1;
			}
		}
		push(@endpoints,"$x,$y");
	}
	my @traces = ();
	$tracecnt = 0;
	%traceref = ();
	foreach $endpoint (@endpoints){
		my($x,$y) = split(/,/,$endpoint);
		my $upshift = int(rand(1000)) + 10;
		my $sideshift = int(rand(1000)) + 2;
		if((int(rand(10)) % 2) == 1){
			$sideshift *= -1;
		}
		#print "UP: $upshift  SHIFT: $sideshift\n";
		my $trace = int(rand(100)) + 20;
		$traces[$tracecnt][0] = "$x,$y";
		for(my $i = 1; $i < $trace; $i++){
			$x += $sideshift;
			$y += $upshift;
			$traces[$tracecnt][$i] = "$x,$y";
			$traceref{$tracecnt} = $i;
		}
		$tracecnt++;
	}
	my %targets = ();
	my %decoys = ();
	my $target = int(rand($tracecnt));
	my $txy = $traces[$target][0];
	#print "$txy\n";
	while($targets{$txy} ne ""){
		$target = int(rand($tracecnt));
		$txy = $traces[$target][0];
	}
	$targets{$txy} = 1;
	for(my $i = 0; $i < $tracecnt; $i++){
		my $decoy = $traces[$i][0];
		if($targets{$decoy} ne ""){ next; }
		my ($dx,$dy) = split(/,/,$decoy);
		if((int(rand(10)) % 2) == 1){
			$dx += int(rand(20)) + 2;
			$decoys{"$dx,$dy"} = 1;
		}
	}
	my @allbases = ();
	foreach my $target (keys %targets){
		push(@debug,"TARGET: $target\n");
		push(@allbases,$target);
	}
	foreach my $decoy (keys %decoys){
		push(@debug,"SAFE: $decoy\n");
		push(@allbases,$decoy);
	}
	my $baseref = 1;
	my %baserefs = ();
	my @shallbases = shuffle(@allbases);
	my @outbases = ();
	foreach my $base (@shallbases){
		push(@outbases,"$baseref=($base)");
		$baserefs{"$baseref=($base)"} = $base;
		$baseref++;
	}
	my $hitcnt = 0;
	my @msgs = ();
	for(my $i = 0; $i < $tracecnt; $i++){
		my $msg = "INCOMING=";
		my $steps = $traceref{$i};
		my $check = "";
		for(my $j = $steps - 1; $j >= 0; $j--){
			my ($sx,$sy) = split(/,/,$traces[$i][$j]);
			if($j == ($steps - 1)){
				$msg .= "($sx,$sy)->";
			} elsif($j == ($steps - 2)){
				$msg .= "($sx,$sy)";
			} else {
				#print "[$sx,$sy]\n";
			}
			if($targets{"$sx,$sy"} ne ""){
				push(@debug,"$msg = HIT! ($sx,$sy)\n");
				$hitcnt++;
			}
		}
		push(@msgs,"$msg");
	}

	if($hitcnt == 1){
		my @answer = ();
		foreach my $base (@outbases){
			print INFILE "$base\n";
			my $basetmp = $base;
			$basetmp =~ s/=(.*)$//g;
			if($targets{$baserefs{$base}} ne ""){	
				push(@answer,$basetmp);
			}
		}
		foreach my $msg (@msgs){
			print INFILE "$msg\n";
		}
		print INFILE "_______________________________________________________________\n";
		$answer = join(",",@answer);
		print OUTFILE "$answer\n";
		print DEBUG "CASE $cases\n";
		print DEBUG @debug;
		print DEBUG "_______________________________________________________________\n";
	}
}


