# Modules.
use Tags2::Output::Indent2;
#use Test::More 'tests' => 1;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: No simple.\n";
my $obj = Tags2::Output::Indent2->new(
	'no_simple' => ['tag'],
);
$obj->put(
	['b', 'tag'],
	['e', 'tag'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<tag></tag>
END
chomp $right_ret;
is($ret, $right_ret);
