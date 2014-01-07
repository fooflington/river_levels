#!/usr/bin/env perl
# (C) Matthew Slowe, 2014
# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# http://creativecommons.org/licenses/by-sa/4.0/

use JSON::PP;
$DEBUG = $ENV{DEBUG};
$CatchmentId = shift @ARGV;

print "Decoding...\n" if $DEBUG;
$in = decode_json(<>) or die;

print "# ln -s /path/to/river_levels_ /etc/munin/plugins/river_levels_$CatchmentId\n\n[river_levels_$CatchmentId]\nenv.urlbase http://path.to/service\nenv.catchmentname Name\nenv.stations " unless $DEBUG;
foreach $station (@{$in->{data}}) {
	if ($station->{url} =~ /CatchmentId=$CatchmentId$/) {
		print "$station->{id}", $DEBUG ? ": $station->{station} on $station->{river}\n" : " ";
	}
}
print "\n" unless $DEBUG;
