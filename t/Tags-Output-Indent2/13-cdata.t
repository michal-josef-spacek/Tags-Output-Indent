# Modules.
use English qw(-no_match_vars);
use Tags::Output::Indent2;
#use Test::More 'tests' => 4;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: CDATA.\n";
my $obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'tag'],
	['cd', 'aaaaa<dddd>dddd'],
	['e', 'tag'],
);
my $ret = $obj->flush;
my $right_ret = "<tag>\n  <![CDATA[aaaaa<dddd>dddd]]>\n</tag>";
is($ret, $right_ret);

$obj = Tags::Output::Indent2->new(
	'cdata_indent' => 1,
);
$obj->put(
	['b', 'tag'],
	['cd', (('aaaaa<dddd>dddd') x 10)],
	['e', 'tag'], 
);
$ret = $obj->flush;
$right_ret = <<'END';
<tag>
  <![CDATA[aaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>dddd
    aaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>dddd
    aaaaa<dddd>dddd]]>
</tag>
END
chomp $right_ret;
is($ret, $right_ret);

$obj = Tags::Output::Indent2->new(
	'cdata_indent' => 0,
);
$obj->put(
	['b', 'tag'],
	['cd', (('aaaaa<dddd>dddd') x 10)],
	['e', 'tag'], 
);
$ret = $obj->flush;
$right_ret = <<'END';
<tag>
  <![CDATA[aaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>ddddaaaaa<dddd>dddd]]>
</tag>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: CDATA errors.\n";
$obj = Tags::Output::Indent2->new;
eval {
	$obj->put(
		['b', 'tag'],
		['cd', 'aaaaa<dddd>dddd', ']]>'],
		['e', 'tag'],
	);
};
is($EVAL_ERROR, "Bad CDATA section.\n");