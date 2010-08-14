#!/usr/bin/env perl

use warnings;
use strict;

use ExtUtils::MakeMaker;

my $version = find_version();

WriteMakefile(
    'NAME' => 'gcap',
    ( $[ >= 5.8 )
    ? ( AUTHOR => 'Toni Gundogdu <legatvs@gmail.com>',
        'ABSTRACT' => 'Youtube closed caption retriever'
        )
    : (),
    'VERSION'   => $version,
    'EXE_FILES' => ['bin/gcap'],
    'PREREQ_PM' => {
        'Getopt::ArgvFile' => 1.11, # tested, earlier may work
        'XML::DOM' => 1.44, # tested, earlier may work
    },
    'LICENSE' => 'gpl',
    dist => {
        COMPRESS => 'bzip2',
        SUFFIX => '.bz2'
    },
);

sub find_version {
    my $path = 'bin/gcap';
    open my $fh, "<", $path or die "$path: $!";
    foreach (<$fh>) {
        close $fh and return $1
            if $_ =~ /VERSION = "(.*?)"/;
    }
    close $fh;
    die '$path: could not find version string.';
}


