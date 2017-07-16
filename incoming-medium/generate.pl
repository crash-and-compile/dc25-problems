#!/usr/bin/perl
use List::Util qw(shuffle);

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
	my @debug = ();
	my %used = ();
	my @endpoints = ();
	for(my $i = 0; $i < 50; $i++){
		my $x = int(rand(100000)) + 100*$i * (-1 * (int(rand(10)) % 2));
		my $y = int(rand(100));
		my $z = int(rand(100000)) + 100*$i * (-1 * (int(rand(10)) % 2));
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
				 $x = int(rand(100000)) + 100*$i * (-1 * (int(rand(10)) % 2));
			} else {
				$used{$x} = 1;
			}
		}
		push(@endpoints,"$x,$y,$z");
	}
	my @traces = ();
	$tracecnt = 0;
	%traceref = ();
	foreach $endpoint (@endpoints){
		my($x,$y,$z) = split(/,/,$endpoint);
		my $yshift = int(rand(1000)) + 100;
		my $xshift = int(rand(1000)) + 2;
		my $zshift = int(rand(1000)) + 2;
		if((int(rand(10)) % 2) == 1){
			$zshift *= -1;
		}
		if((int(rand(10)) % 2) == 1){
			$xshift *= -1;
		}
		#print "UP: $upshift  SHIFT: $sideshift\n";
		my $trace = int(rand(100)) + 20;
		$traces[$tracecnt][0] = "$x,$y,$z";
		for(my $i = 1; $i < $trace; $i++){
			$x += $xshift;
			$y += $yshift;
			$z += $zshift;
			$traces[$tracecnt][$i] = "$x,$y,$z";
			$traceref{$tracecnt} = $i;
		}
		$tracecnt++;
	}
	my %targets = ();
	my %decoys = ();
	for(my $i = 0; $i < 3; $i++){
		my $target = int(rand($tracecnt));
		my $txyz = $traces[$target][0];
		#print "$txy\n";
		while($targets{$txyz} ne ""){
			$target = int(rand($tracecnt));
			$txyz = $traces[$target][0];
		}
		$targets{$txyz} = 1;
	}
	for(my $i = 0; $i < $tracecnt; $i++){
		my $decoy = $traces[$i][0];
		if($targets{$decoy} ne ""){ next; }
		my ($dx,$dy,$dy) = split(/,/,$decoy);
		if((int(rand(10)) % 2) == 1){
			$dx += int(rand(20)) + 2;
			$dz += int(rand(20)) + 2;
			$decoys{"$dx,$dy,$dz"} = 1;
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
			my ($sx,$sy,$sz) = split(/,/,$traces[$i][$j]);
			if($j == ($steps - 1)){
				$msg .= "($sx,$sy,$sz)->";
			} elsif($j == ($steps - 2)){
				$msg .= "($sx,$sy,$sz)";
			} else {
				#print "[$sx,$sy]\n";
			}
			if($targets{"$sx,$sy,$sz"} ne ""){
				push(@debug,"$msg = HIT! ($sx,$sy,$sz)\n");
				$hitcnt++;
			}
		}
		push(@msgs,"$msg");
	}
	if($hitcnt == 3){
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
		$answer = join(",",@answer);
		print OUTFILE "$answer\n";	
		print INFILE "_______________________________________________________________\n";
		print DEBUG "CASE $cases\n";
		print DEBUG @debug;
		print DEBUG "_______________________________________________________________\n";
	}

}


