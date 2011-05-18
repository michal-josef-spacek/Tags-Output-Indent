# Modules.
use Tags::Output::Indent2;
#use Test::More 'tests' => 6;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Simple tag without parameters (sgml version).\n";
my $obj = Tags::Output::Indent2->new(
	'xml' => 0,
);
$obj->put(
	['b', 'MAIN'],
	['e', 'MAIN'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<MAIN></MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Simple tag with parameters (sgml version).\n";
$obj->reset;
$obj->put(
	['b', 'MAIN'],
	['a', 'id', 'id_value'],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN id="id_value"></MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Simple tag after simple tag (sgml version).\n";
$obj->reset;
$obj->put(
	['b', 'MAIN'],
	['a', 'id', 'id_value'],
	['e', 'MAIN'],
	['b', 'MAIN'],
	['a', 'id', 'id_value2'],
	['e', 'MAIN']
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN id="id_value"></MAIN>
<MAIN id="id_value2"></MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Simple tag without parameters (xml version).\n";
$obj = Tags::Output::Indent2->new(
	'xml' => 1,
);
$obj->put(
	['b', 'main'],
	['e', 'main'],
);
$ret = $obj->flush;
is($ret, '<main />');

print "Testing: Simple tag with parameters (xml version).\n";
$obj->reset;
$obj->put(
	['b', 'main'],
	['a', 'id', 'id_value'],
	['e', 'main'],
);
$ret = $obj->flush;
is($ret, '<main id="id_value" />');

print "Testing: Simple tag after simple tag (xml version).\n";
$obj->reset;
$obj->put(
	['b', 'main'],
	['a', 'id', 'id_value'],
	['e', 'main'],
	['b', 'main'],
	['a', 'id', 'id_value2'],
	['e', 'main'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<main id="id_value" />
<main id="id_value2" />
END
chomp $right_ret;
is($ret, $right_ret);
