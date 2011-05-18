# Modules.
use Tags::Output::Indent2;
#use Test::More 'tests' => 1;
use Test::More 'skip_all' => 'Everything bad.';

print "Testing: Instruction.\n";
my $obj = Tags::Output::Indent2->new;
$obj->put(
	['i', 'perl', 'print "1\n";'],
);
my $ret = $obj->flush;
my $right_ret = <<'END';
<?perl print "1\n";?>
END
chomp $right_ret;
is($ret, $right_ret);
