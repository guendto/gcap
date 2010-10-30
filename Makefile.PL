#!/usr/bin/env perl

use warnings;
use strict;

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'gcap',
    ( $[ >= 5.8 )
    ? ( AUTHOR => 'Toni Gundogdu <legatvs at sign gmail com>',
        'ABSTRACT' => 'Youtube closed caption retriever'
        )
    : (),
    'VERSION_FROM' => 'bin/gcap',
    'EXE_FILES'    => ['bin/gcap'],
    'PREREQ_PM'    => {
# Earlier versions may work. The module has been confirmed to work with:
'Getopt::ArgvFile'  => 1.11, # <http://search.cpan.org/perldoc?Getopt::ArgvFile>
'XML::DOM'          => 1.44, # <http://search.cpan.org/perldoc?XML::DOM>
'version'           => 0.77, # <http://search.cpan.org/perldoc?version>
    },
    'LICENSE' => 'gpl'
);
