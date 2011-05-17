# Modules.
use Tags2::Output::Indent;
use Test::More 'tests' => 1;

print "Testing: Version.\n";
is($Tags2::Output::Indent::VERSION, '0.06');
