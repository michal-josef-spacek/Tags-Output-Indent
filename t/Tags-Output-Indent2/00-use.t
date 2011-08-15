# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 2;

BEGIN {

	# Test.
	use_ok('Tags::Output::Indent2');
}

# Test.
require_ok('Tags::Output::Indent2');
