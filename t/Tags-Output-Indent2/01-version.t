# Modules.
use Tags::Output::Indent2;
use Test::More 'tests' => 1;

print "Testing: Version.\n";
is($Tags::Output::Indent2::VERSION, '0.01');
