# Modules.
use Tags2::Output::Indent;
use Test::More 'tests' => 1;

print "Testing: Tags combination.\n";
my $obj = Tags2::Output::Indent->new;
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
<MAIN>
  <!-- COMMENT -->
</MAIN>
<MAIN>
  DATA
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);
