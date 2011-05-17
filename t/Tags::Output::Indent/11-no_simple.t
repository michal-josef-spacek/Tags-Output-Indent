# Modules.
use Tags2::Output::Indent;
use Test::More 'tests' => 1;

print "Testing: No simple.\n";
my $obj = Tags2::Output::Indent->new(
	'no_simple' => ['tag'],
);
$obj->put(
	['b', 'tag'],
	['e', 'tag'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<tag>
</tag>
END
chomp $right_ret;
is($ret, $right_ret);
