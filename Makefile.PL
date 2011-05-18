# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'NAME' => 'Tags::Output::Indent',
	'PREREQ_PM' => {
		'Class::Utils' => 0.01,
		'Error::Pure' => 0.01,
		'File::Object' => 0,
		'Indent' => 0,
		'List::MoreUtils' => 0,
		'Readonly' => 0,
		'Tags' => 0.01,
	},
	'VERSION' => 0.01,
	'test' => {
		'TESTS' => 't/Tags::Output::Indent/*.t '.
			't/Tags::Output::Indent2/*.t',
	},
);
