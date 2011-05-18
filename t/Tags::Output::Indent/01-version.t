# Modules.
use Tags::Output::Indent;
use Test::More 'tests' => 1;

print "Testing: Version.\n";
is($Tags::Output::Indent::VERSION, '0.06');
