# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Indented output for Tags.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Tags-Output-Indent';
requires 'Error::Pure' => 0.05;
requires 'Indent' => 0.01;
requires 'Indent::Word' => 0.01;
requires 'Indent::Block' => 0.01;
requires 'List::MoreUtils' => 0;
requires 'Readonly' => 0;
requires 'Tags::Utils' => 0.01;
requires 'Tags::Utils::Preserve' => 0.01;
resources 'repository' => {
	'url' => 'git://github.com/tupinek/Tags-Output-Indent',
	'web' => 'https://github.com/tupinek/Tags-Output-Indent',
	'type' => 'git',
};
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
