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
my $casecnt = 20;
for(my $cases = 0; $cases < $casecnt; $cases++){
	print DEBUG "CASE $cases\n";
	my @board = ();
	my $w = 52;
	my $h = 52;
	my $x = int(rand($w));
	my $y = 0; 
	for(my $i = 0; $i < $w; $i++){
		for(my $j = 0; $j < $h; $j++){
			$board[$i][$j] = "=";
		}
	}
	my @path = ();
	my @bpath = ();
	$board[$y][$x] = " ";
	push(@path,"$x,$y");
	$y++;
	$board[$y][$x] = " ";
	push(@path,"$x,$y");
	$continue = 0;
	my $cnt = 2;
	while($continue == 0){
		if(($x == 0)||($x == ($w - 1))){
			if($cnt < 200){
				$x = int(rand($w));
				$y = 0; 
				for(my $i = 0; $i < $w; $i++){
					for(my $j = 0; $j < $h; $j++){
						$board[$i][$j] = "=";
					}
				}
				@path = ();
				$board[$y][$x] = " ";
				push(@path,"$x,$y");
				$y++;
				$board[$y][$x] = " ";
				push(@path,"$x,$y");
				$cnt = 2;
				next;
			} else {
				$continue = 1;
				next;
			}
		}
		if(($y == 0)||($y == ($h - 1))){
			if($cnt < 200){
				$x = int(rand($w));;
				$y = 0; 
				for(my $i = 0; $i < $w; $i++){
					for(my $j = 0; $j < $h; $j++){
						$board[$i][$j] = "=";
					}
				}
				@path = ();
				$board[$y][$x] = " ";
				push(@path,"$x,$y");
				$y++;
				$board[$y][$x] = " ";
				push(@path,"$x,$y");
				$cnt = 2;
				next;
			} else {
				$continue = 1;
				next;
			}
		}
		my $lc = $board[$y][$x-1];
		my $lcc = $y ."|". ($x-1);
		my $rc = $board[$y][$x+1];
		my $rcc = $y ."|". ($x+1);
		my $uc = $board[$y-1][$x];
		my $ucc = ($y-1) ."|". $x;
		my $dc = $board[$y+1][$x];
		my $dcc = ($y+1) ."|". $x;
		my @available = ();
		if($lc eq "="){
			my $lcu = $board[$y-1][$x-1];;  
			my $lcd = $board[$y+1][$x-1];;  
			my $lcl = $board[$y][$x-2];;  
			if(($lcu eq "=")&&($lcd eq "=")&&($lcl eq "=")){
				push(@available,$lcc);
			}
		}
		if($rc eq "="){
			my $rcu = $board[$y-1][$x+1];;  
			my $rcd = $board[$y+1][$x+1];;  
			my $rcr = $board[$y][$x+2];;  
			if(($rcu eq "=")&&($rcd eq "=")&&($rcr eq "=")){
				push(@available,$rcc);
			}
		}
		if($uc eq "="){
			my $ucl = $board[$y-1][$x-1];;  
			my $ucr = $board[$y-1][$x+1];;  
			my $ucu = $board[$y-2][$x];;  
			if(($ucl eq "=")&&($ucr eq "=")&&($ucu eq "=")){
				push(@available,$ucc);
			}
		}
		if($dc eq "="){
			my $dcl = $board[$y+1][$x-1];;  
			my $dcr = $board[$y+1][$x+1];;  
			my $dcd = $board[$y+2][$x];;  
			if(($dcl eq "=")&&($dcr eq "=")&&($dcd eq "=")){
				push(@available,$dcc);
			}		
		}
		#foreach my $available (@available){
		#	print "$available\n";
		#}
		my $choice = int(rand(@available));
		my($yc,$xc) = split(/\|/,$available[$choice]);
		if(($xc eq "")||($yc eq "")){
			$x = int(rand($w));
			$y = 0; 
			for(my $i = 0; $i < $w; $i++){
				for(my $j = 0; $j < $h; $j++){
					$board[$i][$j] = "=";
				}
			}
			@path = ();
			$board[$y][$x] = " ";
			push(@path,"$x,$y");
			$y++;
			$board[$y][$x] = " ";
			push(@path,"$x,$y");
			$cnt = 2;
			next;
		}
		$board[$yc][$xc] = " ";
		push(@path,"$xc,$yc");
		$cnt++;
		$x = $xc;
		$y = $yc;
	}
	
	my @jumppath = ();
	my $length = @path;
	my $segmentlength = $length / 5;
	$segmentlength =~ s/\.(.*)$//g;
	my $spot = int(rand(20)) + 15;
	my $on = 0;
	my @tags = ("A","B","C","D","F","G","H","I","J","K","L","M","N","O","P","Q","R","T","U","V","W","X","Y","Z");
	@tags = shuffle @tags;
	my $cnt = 0;
	my $prev = "";
	my $prevlabel = "";
	my %jumplabels = ();
	foreach my $ref (@path){
		if(($cnt == $segmentlength)&&($on < 4)){
			$on += 1;
			if((($on % 2) == 1)&&($prev ne "")){
				$jumplabels{$prev} = pop @tags;
				$prevlabel = $jumplabels{$prev}
			}
			if((($on % 2) == 0)&&($on > 0)){
				$jumplabels{$ref} = $prevlabel;
			}
			$cnt = 0;
		}
		if(($on % 2) == 0){
			push(@jumppath,$ref);
			$prev = $ref;
			$cnt++;
		} else {
			$cnt++;
		}
	}
	for(my $i = 0; $i < $w; $i++){
		for(my $j = 0; $j < $h; $j++){
			$board[$i][$j] = "=";
		}
	}
	foreach my $ref (@jumppath){
		my ($bx,$by) = split(/,/,$ref);
		$board[$by][$bx] = "|";
	}

	
	
	foreach my $ref (@jumppath){
		if($ref =~ /^\w$/){ next; }
		my @available = ();
		my ($bx,$by) = split(/,/,$ref);
		if(($bx == 0)||($bx == ($w-1))||($by == 0)||($by == ($h-1))){
			next;
		}
		my $brl = $board[$by][$bx-1];
		my $brlu = $board[$by-1][$bx-1]; 
		my $brld = $board[$by+1][$bx-1];
		my $brll = $board[$by][$bx-2];	
		my $brr = $board[$by][$bx+1];
		my $brru = $board[$by-1][$bx+1]; 
		my $brrd = $board[$by+1][$bx+1];
		my $brrr = $board[$by][$bx+2];	
		my $bru = $board[$by-1][$bx];
		my $bruu = $board[$by-2][$bx]; 
		my $brul = $board[$by-1][$bx-1];
		my $brur = $board[$by-1][$bx+1];	
		my $brd = $board[$by+1][$bx];
		my $brdd = $board[$by+2][$bx]; 
		my $brdl = $board[$by+1][$bx-1];
		my $brdr = $board[$by+1][$bx+1];
		
		my $lcc = $by ."|". ($bx-1);
		my $rcc = $by ."|". ($bx+1);
		my $ucc = ($by-1) ."|". $bx;
		my $dcc = ($by+1) ."|". $bx;
	
		if(($brl eq "=")&&($brlu eq "=")&&($brld eq "=")&&($brll eq "=")){
			unless(($bx-1) == 0){
				push(@available,"$lcc");
			}
		}
		if(($brr eq "=")&&($brru eq "=")&&($brrd eq "=")&&($brrr eq "=")){
			unless(($bx+1) == ($w-1)){
				push(@available,"$rcc");
			}
		}
		if(($bru eq "=")&&($bruu eq "=")&&($brur eq "=")&&($brul eq "=")){
			unless(($by-1) == 0){
				push(@available,"$ucc");
			}
		}
		if(($brd eq "=")&&($brdd eq "=")&&($brdr eq "=")&&($brdl eq "=")){
			unless(($by+1) == ($h-1)){
				push(@available,"$dcc");
			}
		}
		my $choice = int(rand(@available));
		my($yc,$xc) = split(/\|/,$available[$choice]);
		if(($xc eq "")||($yc eq "")){
			next;
		}
		$board[$yc][$xc] = " ";
		push(@branches,"$yc,$xc");
	}
	my @final = ();
	foreach my $ref (@branches){
		my ($by,$bx) = split(/,/,$ref);
		my $brl = $board[$by][$bx-1];
		my $brlu = $board[$by-1][$bx-1]; 
		my $brld = $board[$by+1][$bx-1];
		my $brll = $board[$by][$bx-2];	
		my $brr = $board[$by][$bx+1];
		my $brru = $board[$by-1][$bx+1]; 
		my $brrd = $board[$by+1][$bx+1];
		my $brrr = $board[$by][$bx+2];	
		my $bru = $board[$by-1][$bx];
		my $bruu = $board[$by-2][$bx]; 
		my $brul = $board[$by-1][$bx-1];
		my $brur = $board[$by-1][$bx+1];	
		my $brd = $board[$by+1][$bx];
		my $brdd = $board[$by+2][$bx]; 
		my $brdl = $board[$by+1][$bx-1];
		my $brdr = $board[$by+1][$bx+1];
		
		my $lcc = $by ."|". ($bx-1);
		my $rcc = $by ."|". ($bx+1);
		my $ucc = ($by-1) ."|". $bx;
		my $dcc = ($by+1) ."|". $bx;
	
		if(($brl eq "=")&&($brlu eq "=")&&($brld eq "=")&&($brll eq "=")){
			push(@final,"$lcc");
			$board[$by][$bx-1] = " ";
		}
		if(($brr eq "=")&&($brru eq "=")&&($brrd eq "=")&&($brrr eq "=")){
			push(@final,"$rcc");
			$board[$by][$bx+1] = " ";
		}
		if(($bru eq "=")&&($bruu eq "=")&&($brur eq "=")&&($brul eq "=")){
			push(@final,"$ucc");
			$board[$by-1][$bx] = " ";
		}
		if(($brd eq "=")&&($brdd eq "=")&&($brdr eq "=")&&($brdl eq "=")){
			push(@final,"$dcc");
			$board[$by+1][$bx] = " ";
		}

	}
                      
#####|################
	my $jumps = 5;
	$prevlabel = "";

	foreach my $ref (@final){
		my($fy,$fx) = split(/\|/,$ref);
		my $continue = 0;
		my $lastx = "";
		my $lasty = "";
		while($continue == 0){
			my $frl = $board[$fy][$fx-1];
			my $frlu = $board[$fy-1][$fx-1]; 
			my $frld = $board[$fy+1][$fx-1];
			my $frll = $board[$fy][$fx-2];	
			my $frr = $board[$fy][$fx+1];
			my $frru = $board[$fy-1][$fx+1]; 
			my $frrd = $board[$fy+1][$fx+1];
			my $frrr = $board[$fy][$fx+2];	
			my $fru = $board[$fy-1][$fx];
			my $fruu = $board[$fy-2][$fx]; 
			my $frul = $board[$fy-1][$fx-1];
			my $frur = $board[$fy-1][$fx+1];	
			my $frd = $board[$fy+1][$fx];
			my $frdd = $board[$fy+2][$fx]; 
			my $frdl = $board[$fy+1][$fx-1];
			my $frdr = $board[$fy+1][$fx+1];

			my $lcc = $fy ."|". ($fx-1);
			my $rcc = $fy ."|". ($fx+1);
			my $ucc = ($fy-1) ."|". $fx;
			my $dcc = ($fy+1) ."|". $fx;
			my @available = ();

			if(($frl eq "=")&&($frlu eq "=")&&($frld eq "=")&&($frll eq "=")){
				unless(($fx-1) < 2){
					push(@available,"$lcc");
				}
			}
			if(($frr eq "=")&&($frru eq "=")&&($frrd eq "=")&&($frrr eq "=")){
				unless(($fx+1) > ($w - 1)){
					push(@available,"$rcc");
				}
			}
			if(($fru eq "=")&&($fruu eq "=")&&($frur eq "=")&&($frul eq "=")){
				unless(($fy-1) < 2){
					push(@available,"$ucc");
				}
			}
			if(($frd eq "=")&&($frdd eq "=")&&($frdr eq "=")&&($frdl eq "=")){
				unless(($fy+1) > ($h-1)){
					push(@available,"$dcc");
				}
			}
			my $choices = @available;
			if($choices > 0){
				my $choice = int(rand(@available));
				my($yc,$xc) = split(/\|/,$available[$choice]);
				if(($yc eq "")||($xc eq "")){
					$continue = 1;
					next;
				}
				$board[$yc][$xc] = " ";
				$fy = $yc;
				$fx = $xc;
				$lastx = $xc;
				$lasty = $yc;
				
			} else {
				my $label = pop @tags;
				if($label ne ""){
					if($prevlabel eq ""){
						$board[$fy][$fx] = $label;
						$prevlabel = $label;
					} else {
						$board[$fy][$fx] = $prevlabel;
						$prevlabel = "";
					}
				} else {
					$board[$fy][$fx] = "=";
				}
				$continue = 1;
			}
		}

			
	}	
		
		
	for(my $i = 0; $i < $w; $i++){
		for(my $j = 0; $j < $h; $j++){
			if(($i == 0)&&($board[$i][$j] eq " ")){
				$board[$i][$j] = "=";
			}
			if(($j == 0)&&($board[$i][$j] eq " ")){
				$board[$i][$j] = "=";
			}
			if(($i == ($w - 1))&&($board[$i][$j] eq " ")){
				$board[$i][$j] = "=";
			}
			if(($j == ($h - 1))&&($board[$i][$j] eq " ")){
				$board[$i][$j] = "=";
			}
		}
	}


	
	foreach my $ref (@jumppath){
		my ($bx,$by) = split(/,/,$ref);
		$board[$by][$bx] = "|";
	}
	foreach my $ref (keys %jumplabels){
		my ($bx,$by) = split(/,/,$ref);
		$board[$by][$bx] = $jumplabels{$ref};
	}
	my $start = $jumppath[0];
	my ($sx,$sy) = split(/,/,$start);
	my $end = $jumppath[@jumppath - 1];	
	my ($ex,$ey) = split(/,/,$end);
	$board[$sy][$sx] = "S";
	$board[$ey][$ex] = "E";
	
	for(my $i = 0; $i < $w; $i++){
		for(my $j = 0; $j < $h; $j++){
			print DEBUG $board[$i][$j];
		}
		print DEBUG "\n";

	}
	print DEBUG "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	foreach my $ref (@jumppath){
		my ($bx,$by) = split(/,/,$ref);
		$board[$by][$bx] = " ";
	}
	my $start = $jumppath[0];
	my ($sx,$sy) = split(/,/,$start);
	my $end = $jumppath[@jumppath - 1];	
	my ($ex,$ey) = split(/,/,$end);
	$board[$sy][$sx] = "S";
	$board[$ey][$ex] = "E";
	for(my $i = 0; $i < $w; $i++){
		for(my $j = 0; $j < $h; $j++){
			print INFILE $board[$i][$j];
		}
		print INFILE "\n";

	}
	print INFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	foreach my $ref (@jumppath){
		my ($bx,$by) = split(/,/,$ref);
		$bx++;
		$by++;
		print OUTFILE "($bx,$by)\n";

	}
	print OUTFILE "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";

		#<STDIN>;

}


