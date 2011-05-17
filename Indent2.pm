package Tags2::Output::Indent2;

# Pragmas.
use base qw(Tags2::Output::Core);
use strict;
use warnings;

# Modules.
use Error::Pure qw(err);
use Indent;
use Indent::Word;
use Indent::Block;
use Readonly;
use Tags2::Utils::Preserve;

# Constants.
Readonly::Scalar my $EMPTY_STR => q{};
Readonly::Scalar my $LINE_SIZE => 79;
Readonly::Scalar my $SPACE => q{ };

# Version.
our $VERSION = 0.01;

# Resets internal variables.
sub reset {
	my $self = shift;

	# Comment flag.
	$self->{'comment_flag'} = 0;

	# Indent object.
	$self->{'indent'} = Indent->new(
		'next_indent' => $self->{'next_indent'}
	);

	# Indent::Word object.
	$self->{'indent_word'} = Indent::Word->new(
		'line_size' => $self->{'line_size'},
		'next_indent' => $EMPTY_STR,
	);

	# Indent::Block object.
	$self->{'indent_block'} = Indent::Block->new(
		'line_size' => $self->{'line_size'},
		'next_indent' => $self->{'next_indent'},
		'strict' => 0,
	);

	# Flush code.
	$self->{'flush_code'} = $EMPTY_STR;

	# Tmp code.
	$self->{'tmp_code'} = [];
	$self->{'tmp_comment_code'} = [];

	# Printed tags.
	$self->{'printed_tags'} = [];

	# Non indent flag.
	$self->{'non_indent'} = 0;

	# Flag, that means raw tag.
	$self->{'raw_tag'} = 0;

	# Preserved object.
	$self->{'preserve_obj'} = Tags2::Utils::Preserve->new(
		'preserved' => $self->{'preserved'},
	);

	# Process flag.
	$self->{'process'} = 0;

	return;
}

# Check parameters to rigth values.
sub _check_params {
        my $self = shift;

	# Check params from SUPER.
	$self->SUPER::_check_params();

	# Check 'attr_delimeter'.
	if ($self->{'attr_delimeter'} ne q{"}
		&& $self->{'attr_delimeter'} ne q{'}) {

		err "Bad attribute delimeter '$self->{'attr_delimeter'}'.";
	}

	return;
}

# Default parameters.
sub _default_parameters {
	my $self = shift;

	# Default parameters from SUPER.
	$self->SUPER::_default_parameters();

	# Indent params.
	$self->{'next_indent'} = $SPACE x 2;
	$self->{'line_size'} = $LINE_SIZE;
	$self->{'linebreak'} = "\n";

	# No simple tags.
	$self->{'no_simple'} = [];

	# Preserved tags.
	$self->{'preserved'} = [];

	# Attribute delimeter.
	$self->{'attr_delimeter'} = '"';

	# Callback to instruction.
	$self->{'instruction'} = $EMPTY_STR;

	# Indent CDATA section.
	$self->{'cdata_indent'} = 0;

	# XML output.
	$self->{'xml'} = 0;

	return;
}

# Helper for flush data.
sub _flush_code {
	my ($self, $code) = @_;
	if (! $self->{'process'}) {
		$self->{'process'} = 1;
	}
	$self->{'flush_code'} .= $code;
	return;
}

# Attributes.
sub _put_attribute {
	my ($self, $attr, $value) = @_;
	return;
}

# Begin of tag.
sub _put_begin_of_tag {
	my ($self, $tag) = @_;
	return;
}

# CData.
sub _put_cdata {
	my ($self, @cdata) = @_;
	return;
}

# Comment.
sub _put_comment {
	my ($self, @comments) = @_;
	return;
}

# Data.
sub _put_data {
	my ($self, @data) = @_;
	return;
}

# End of tag.
sub _put_end_of_tag {
	my ($self, $tag) = @_;
	return;
}

# Instruction.
sub _put_instruction {
	my ($self, $target, $code) = @_;
	if (ref $self->{'instruction'} eq 'CODE') {
		$self->{'instruction'}->($self, $target, $code);
	} else {
		$self->_newline;
		$self->{'preserve_obj'}->save_previous;
		$self->_flush_code($self->{'indent_block'}
			->indent([
			'<?'.$target, $SPACE, $code, '?>',
			$self->{'indent'}->get,
		]));
	}
	return;
}

# Raw data.
sub _put_raw {
	my ($self, @raw_data) = @_;
	foreach my $data (@raw_data) {
		$self->_flush_code($data);
	}
	$self->{'raw_tag'} = 1;
	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

 Tags2::Output::Indent2 - Indent class for Tags2.

=head1 SYNOPSIS

 use Tags2::Output::Indent2(%params);
 my $tags2 = Tags2::Output::Indent2->new;
 $tags2->put(['b', 'tag']);
 my @open_tags = $tags2->open_tags;
 $tags2->finalize;
 $tags2->flush;
 $tags2->reset;

=head1 METHODS

=over 8

=item C<new(%params)>

 Constructor

=over 8

=item * C<attr_delimeter>

 String, that defines attribute delimeter.
 Default is '"'.
 Possible is '"' or "'".

 Example:
 Prints <tag attr='val' /> instead default <tag attr="val" />

 my $tags2 = Tags2::Output::Indent->new(
         'attr_delimeter' => "'",
 );
 $tags2->put(
         ['b', 'tag'],
         ['a', 'attr', 'val'],
         ['e', 'tag'],
 );
 $tags2->flush;

=item * C<auto_flush>

 Auto flush flag.
 Default is 0.

=item * C<cdata_indent>

 Flag, that means indent CDATA section.
 Default value is no-indent (0).

=item * C<line_size>

 TODO
 Default value is 79.

=item * C<next_indent>

 TODO
 Default value is "  ".

=item * C<no_simple>

 Reference to array of tags, that can't by simple.
 Default is [].

 Example:
 That's normal in html pages, web browsers has problem with <script /> tag.
 Prints <script></script> instead <script />.

 my $tags2 = Tags2::Output::Raw->new(
         'no_simple' => ['script']
 );
 $tags2->put(
         ['b', 'script'],
         ['e', 'script'],
 );
 $tags2->flush;

=item * C<output_handler>

 Handler for print output strings.
 Must be a GLOB.
 Default is undef.

=item * C<output_separator>

 TODO
 Default value is newline (\n).

=item * C<preserved>

 TODO
 Default is reference to blank array.

=item * C<skip_bad_tags>

 TODO
 Default is 0.

=back

=item C<finalize()>

 Finalize Tags output.
 Automaticly puts end of all opened tags.

=item C<flush($reset_flag)>

 Flush tags in object.
 If defined 'output_handler' flush to its.
 Or return code.
 If enabled $reset_flag, then resets internal variables via reset method.

=item C<open_tags()>

 Return array of opened tags.

=item C<put(@data)>

 Put tags code in tags2 format.

=item C<reset()>

 Resets internal variables.

=back

=head1 ERRORS

 'auto_flush' parameter can't use without 'output_handler' parameter.
 Bad attribute delimeter '%s'.
 Bad CDATA section.
 Bad data.
 Bad parameter '%s'.
 Bad tag type 'a'.
 Bad type of data.
 Ending bad tag: '%s' in block of tag '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Tags2::Output::Indent2;

 # Object.
 my $tags = Tags2::Output::Indent2->new;

 # Put data.
 $tags2->put(
         ['b', 'text'],
	 ['d', 'data'],
	 ['e', 'text'],
 );

 # Print.
 print $tags2->flush."\n";

 # Output:
 # <text>data</text>

=head1 DEPENDENCIES

L<Error::Pure(3pm)>,
L<Indent(3pm)>,
L<Indent::Word(3pm)>,
L<Indent::Block(3pm)>,
L<Tags2::Utils::Preserve(3pm)>.

=head1 SEE ALSO

L<Tags2(3pm)>,
L<Tags2::Output::Core(3pm)>,
L<Tags2::Output::ESIS(3pm)>,
L<Tags2::Output::Indent(3pm)>,
L<Tags2::Output::LibXML(3pm)>,
L<Tags2::Output::PYX(3pm)>,
L<Tags2::Output::Raw(3pm)>,
L<Tags2::Output::SESIS(3pm)>,
L<Tags2::Utils(3pm)>.

=head1 AUTHOR

Michal Špaček L<skim@cpan.org>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
