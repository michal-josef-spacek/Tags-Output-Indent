# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Tags::Output::Indent');
}
require_ok('Tags::Output::Indent');
