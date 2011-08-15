# Modules.
use Tags::Output::Indent;
use Test::More 'tests' => 1;

my $obj = Tags::Output::Indent->new;
$obj->put(
	['i', 'perl', 'print "1\n";'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<?perl print "1\n";?>
END
chomp $right_ret;
is($ret, $right_ret);
