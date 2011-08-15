# Modules.
use Tags::Output::Indent2;
#use Test::More 'tests' => 1;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Tags combination.\n";
my $obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['c', ' COMMENT '],
	['e', 'MAIN'],
	['b', 'MAIN'],
	['d', 'DATA'],
	['e', 'MAIN'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<MAIN><!-- COMMENT --></MAIN>
<MAIN>DATA</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);
