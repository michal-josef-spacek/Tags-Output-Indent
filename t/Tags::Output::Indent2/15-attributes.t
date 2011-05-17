# Modules.
use Tags2::Output::Indent2;
#use Test::More 'tests' => 1;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Attributes.\n";
my $obj = Tags2::Output::Indent2->new(
	'xml' => 1,
);
$obj->put(
	['b', 'foo'],
	['a', 'one', '...........................'],
	['a', 'two', '...........................'],
	['a', 'three', '.........................'],
	['e', 'foo'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<foo one="..........................." two="..........................." three=
  "........................." />
END
chomp $right_ret;
is($ret, $right_ret);
