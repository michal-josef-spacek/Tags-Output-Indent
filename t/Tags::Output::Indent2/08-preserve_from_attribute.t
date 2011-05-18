# Modules.
use Tags::Output::Indent2;
#use Test::More 'tests' => 2;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Preserving from attributes.\n";
# TODO Preserving v sgml (coz je tento kod) urcite neni definovano jako
# xml:space.
print "- CHILD1 preserving is off.\n";
my $obj = Tags::Output::Indent2->new;
my $text = <<"END";
  text
     text
	text
END
$obj->put(
	['b', 'MAIN'],
	['b', 'CHILD1'],
	['a', 'xml:space', 'default'],
	['d', $text],
	['e', 'CHILD1'],
	['e', 'MAIN'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<MAIN>
  <CHILD1 xml:space="default">
      text
     text
	text

  </CHILD1>
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "- CHILD1 preserving is on.\n";
$obj->reset;
$obj->put(
	['b', 'MAIN'],
	['b', 'CHILD1'],
	['a', 'xml:space', 'preserve'],
	['d', $text],
	['e', 'CHILD1'],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN>
  <CHILD1 xml:space="preserve">
  text
     text
	text
</CHILD1>
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

# TODO Pridat vnorene testy.
# Bude jich hromada. Viz. ex18.pl az ex24.pl v Tags::Output::Indent.
