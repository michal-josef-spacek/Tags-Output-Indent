# Modules.
use Tags::Output::Indent;
use Test::More 'tests' => 1;

my $obj = Tags::Output::Indent->new(
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
