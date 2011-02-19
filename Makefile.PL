use warnings;
use strict;

use 5.008009;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'gcap',
    ( $[ >= 5.8 )
    ? ( AUTHOR => 'Toni Gundogdu <legatvs at sign gmail com>',
        'ABSTRACT' => 'Youtube closed caption downloader'
        )
    : (),
    'VERSION_FROM' => 'bin/gcap',
    'EXE_FILES'    => ['bin/gcap'],
    'PREREQ_PM'    => {
# Earlier versions may work. The module has been confirmed to work with:
'Getopt::ArgvFile'  => 1.11, # <http://search.cpan.org/perldoc?Getopt::ArgvFile>
'XML::DOM'          => 1.44, # <http://search.cpan.org/perldoc?XML::DOM>
'version'           => 0.77, # <http://search.cpan.org/perldoc?version>
'HTML::Entities'    => 3.68, # <http://search.cpan.org/perldoc?HTML::Entities>
    },
    'LICENSE' => 'gpl',
    'MAN1PODS' =>
        { 'man1/gcap.1.pod' => '$(INST_MAN1DIR)/gcap.$(MAN1EXT)' },
    dist => {
        PREOP =>
'@if test -f .git/HEAD; then \
	git log --stat --after="Thu Feb 17 00:51:39 2011" >ChangeLog; \
fi',
        POSTOP   =>
'@if test -f .git/HEAD; then \
	git checkout ChangeLog; \
fi',
    },
);
