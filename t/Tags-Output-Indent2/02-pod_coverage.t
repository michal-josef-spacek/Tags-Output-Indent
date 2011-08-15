# Modules.
use Test::Pod::Coverage 'tests' => 1;

print "Testing: Pod coverage.\n";
pod_coverage_ok('Tags::Output::Indent2', 'Tags::Output::Indent2 is covered.');
