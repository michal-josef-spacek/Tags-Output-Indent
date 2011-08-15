# Modules.
use Tags::Output::Indent2;
#use Test::More 'tests' => 5;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Normal tag without parameters.\n";
my $obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['d', 'data'],
	['e', 'MAIN'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<MAIN>data</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Normal tag with parameters.\n";
$obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['a', 'id', 'id_value'],
	['d', 'data'],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN id="id_value">data</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Normal tag after normal tag.\n";
$obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['a', 'id', 'id_value'],
	['d', 'data'],
	['e', 'MAIN'],
	['b', 'MAIN'],
	['a', 'id', 'id_value2'],
	['d', 'data'],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<'END';
<MAIN id="id_value">data</MAIN>
<MAIN id="id_value2">data</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

print "Testing: Normal tag with long data.\n";
my $long_data = 'a' x 1000;
$obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['d', $long_data],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<"END";
<MAIN>
  $long_data
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);

$long_data = 'aaaa ' x 1000;
$obj = Tags::Output::Indent2->new;
$obj->put(
	['b', 'MAIN'],
	['d', $long_data],
	['e', 'MAIN'],
);
$ret = $obj->flush;
$right_ret = <<"END";
<MAIN>
  $long_data
</MAIN>
END
chomp $right_ret;
is($ret, $right_ret);
