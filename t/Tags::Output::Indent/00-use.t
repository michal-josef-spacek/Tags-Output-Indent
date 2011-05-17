# Modules.
use Test::More 'tests' => 2;

BEGIN {
	print "Usage tests.\n";
	use_ok('Tags2::Output::Indent');
}
require_ok('Tags2::Output::Indent');
