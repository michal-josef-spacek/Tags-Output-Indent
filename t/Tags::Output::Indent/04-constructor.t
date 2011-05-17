# Modules.
use English qw(-no_match_vars);
use Tags2::Output::Indent;
use Test::More 'tests' => 7;

print "Testing: new('') bad constructor.\n";
my $obj;
eval {
	$obj = Tags2::Output::Indent->new('');
};
is($EVAL_ERROR, "Unknown parameter ''.\n");

print "Testing: new('something' => 'value') bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent->new('something' => 'value');
};
is($EVAL_ERROR, "Unknown parameter 'something'.\n");

print "Testing: new('attr_delimeter' => '-') bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent->new('attr_delimeter' => '-');
};
is($EVAL_ERROR, "Bad attribute delimeter '-'.\n");

print "Testing: new('auto_flush' => 1) bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent->new('auto_flush' => 1);
};
is($EVAL_ERROR, 'Auto-flush can\'t use without output handler.'."\n");

print "Testing: new('output_handler' = '') bad constructor.\n";
eval {
	$obj = Tags2::Output::Indent->new('output_handler' => '');
};
is($EVAL_ERROR, 'Output handler is bad file handler.'."\n");

print "Testing: new() right constructor.\n";
$obj = Tags2::Output::Indent->new;
ok(defined $obj);
ok($obj->isa('Tags2::Output::Indent'));
