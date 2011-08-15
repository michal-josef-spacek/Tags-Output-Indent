# Pragmas.
use strict;
use warnings;

# Modules.
use Tags::Output::Indent;
use Test::More 'tests' => 1;

# Test.
is($Tags::Output::Indent::VERSION, 0.01, 'Version.');
