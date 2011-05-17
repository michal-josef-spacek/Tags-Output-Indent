# Modules.
use English qw(-no_match_vars);
use Tags2::Output::Indent2;
use Test::More 'tests' => 5;

print "Testing: new('') bad constructor.\n";
my $obj;
eval {
	$obj = Tags2::Output::Indent2->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent2->new('something' => 'value');
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new('attr_delimeter' => '-') bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent2->new('attr_delimeter' => '-');
};
is($EVAL_ERROR, "Bad attribute delimeter '-'.\n");

print "Testing: new() right constructor.\n";
$obj = Tags2::Output::Indent2->new;
ok(defined $obj);
ok($obj->isa('Tags2::Output::Indent2'));
