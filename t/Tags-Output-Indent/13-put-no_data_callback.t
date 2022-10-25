use strict;
use warnings;

use Tags::Output::Indent;
use Test::More 'tests' => 2;
use Test::NoWarnings;

my $obj = Tags::Output::Indent->new(
	'no_data_callback' => ['element'],
	'xml' => 1,
);
$obj->put(
	['b', 'element'],
	['d', '&'],
	['e', 'element'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<element>
  &
</element>
END
chomp $right_ret;
is($ret, $right_ret, "Test for element in 'no_data_callback' parameter.");
