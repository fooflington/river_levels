use JSON::PP;
$DEBUG = $ENV{DEBUG};
$CatchmentId = shift @ARGV;

print "Decoding...\n" if $DEBUG;
$in = decode_json(<>) or die;
foreach $station (@{$in->{data}}) {
	if ($station->{url} =~ /CatchmentId=$CatchmentId$/) {
		print "$station->{id}", $DEBUG ? ": $station->{station} on $station->{river}\n" : " ";
	}
}
print "\n" unless $DEBUG;
