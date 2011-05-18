# Modules.
use Tags::Output::Indent2;
use Test::More 'tests' => 1;

print "Testing: Raw.\n";
my $obj = Tags::Output::Indent2->new;
$obj->put(
	['r', '<?xml version="1.1">'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<?xml version="1.1">
END
chomp $right_ret;
is($ret, $right_ret);

$obj->reset;
$obj->put(
	['b', 'tag'],
	['r', '<![CDATA['],
	['d', 'bla'],
	['r', ']]>'],
	['e', 'tag'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<tag>
  <![CDATA[bla]]>
</tag>
END
chomp $right_ret;
# XXX SKIP
#is($ret, $right_ret);

$obj->reset;
$obj->put(
	['b', 'tag'],
	['a', 'key', 'val'],
	['r', '<![CDATA['],
	['d', 'bla'],
	['r', ']]>'],
	['e', 'tag'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<tag key="val">
  <![CDATA[bla]]>
</tag>
END
chomp $right_ret;
# XXX SKIP
#is($ret, $right_ret);

$obj->reset;
$obj->put(
	['b', 'tag'],
	['a', 'key', 'val'],
	['r', '<![CDATA['],
	['b', 'other'],
	['d', 'bla'],
	['e', 'other'],
	['r', ']]>'],
	['e', 'tag'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<tag key="val">
  <![CDATA[<other>bla</other>]]>
</tag>
END
chomp $right_ret;
# XXX SKIP
#is($ret, $right_ret);
