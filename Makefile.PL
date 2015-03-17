# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Indented output for Tags.';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'Tags-Output-Indent';
readme_from 'Indent.pm';
requires 'Error::Pure' => 0.05;
requires 'Indent' => 0.01;
requires 'Indent::Word' => 0.01;
requires 'Indent::Block' => 0.01;
requires 'List::MoreUtils' => 0;
requires 'Readonly' => 0;
requires 'Tags::Output' => 0.01;
requires 'Tags::Utils' => 0.01;
requires 'Tags::Utils::Preserve' => 0.01;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Tags-Output-Indent';
resources 'homepage' => 'https://github.com/tupinek/Tags-Output-Indent';
resources 'repository' => 'git://github.com/tupinek/Tags-Output-Indent';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.02';

# Run.
WriteAll();
