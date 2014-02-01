#!/usr/bin/env perl
# (C) Matthew Slowe, 2014
# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# http://creativecommons.org/licenses/by-sa/4.0/

use JSON::PP;
$DEBUG = $ENV{DEBUG};
my @todo = @ARGV;
@ARGV = ();

$script = $ENV{script} || "/path/to/river_levels_";
$urlbase = $ENV{urlbase} || "http://path.to/service";

print STDERR "Decoding...\n" if $DEBUG;
$in = decode_json(<>) or die;

foreach $CatchmentId (@todo) {
	$catchment = "Name";
	print STDERR "ln -s $script /etc/munin/plugins/river_levels_$CatchmentId\n";
	print "[river_levels_$CatchmentId]\nenv.urlbase $urlbase\nenv.stations " unless $DEBUG;
	foreach $station (@{$in->{data}}) {
		if ($station->{url} =~ /CatchmentId=$CatchmentId$/) {
			print "$station->{id}", $DEBUG ? ": $station->{station} on $station->{river}\n" : " " unless $station->{watercourse} eq "Tide";
			$catchment = $station->{watercourse} unless $station->{watercourse} eq "Tide";
		}
	}
	print "\nenv.catchmentname $catchment\n\n" unless $DEBUG;
}
