# Modules.
use Tags2::Output::Indent;
use Test::More 'tests' => 4;

print "Testing: Preserving from constructor.\n";
print "- CHILD1 preserving is off.\n";
my $obj = Tags2::Output::Indent->new(
	'preserved' => [],
);
$obj->put(
	['b', 'CHILD1'],
	['d', 'DATA'],
	['e', 'CHILD1'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<CHILD1>
  DATA
</CHILD1>
END
chomp $right_ret;
is($ret, $right_ret);

$obj = Tags2::Output::Indent->new(
	'preserved' => [],
);
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
$ret = $obj->flush;
$right_ret = <<'END';
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
$obj = Tags2::Output::Indent->new(
	'preserved' => ['CHILD1'],
);
$obj->put(
	['b', 'CHILD1'],
	['d', 'DATA'],
	['e', 'CHILD1'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<CHILD1>
DATA</CHILD1>
END
chomp $right_ret;
is($ret, $right_ret);

$obj = Tags2::Output::Indent->new(
	'preserved' => ['CHILD1'],
);
$obj->put(
	['b', 'MAIN'],
	['b', 'CHILD1'],
	['d', $text],
	['e', 'CHILD1'],
	['e', 'MAIN']
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN>
  <CHILD1>
  text
     text
	text
</CHILD1>
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

# TODO Pridat vnorene testy.
# Bude jich hromada. Viz. ex18.pl az ex24.pl v Tags2::Output::Indent.
