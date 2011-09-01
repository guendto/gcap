use warnings;
use strict;

use 5.010001;
use ExtUtils::MakeMaker;

WriteMakefile(
  'NAME'       => 'gcap',
  DISTNAME     => 'gcap',
  VERSION_FROM => 'bin/gcap',
  PREREQ_PM    => {
                'Getopt::ArgvFile' => 1.11,
                'LWP::UserAgent'   => 5.835,
                'XML::DOM'         => 1.44,
                'HTML::Entities'   => 3.68,
               },
  BUILD_REQUIRES     => {'ExtUtils::MakeMaker' => 0,},
  CONFIGURE_REQUIRES => {'ExtUtils::MakeMaker' => 0,},
  MIN_PERL_VERSION   => 5.010001,
  (
   $] >= 5.005
   ? (
      ABSTRACT_FROM => 'doc/man1/gcap.1.pod',
      AUTHOR        => 'Toni Gundogdu <legatvs@cpan.org>'
     )
   : ()
  ),
  'LICENSE'   => 'gpl',
  'EXE_FILES' => ['bin/gcap'],
  'MAN1PODS' =>
    {'doc/man1/gcap.1.pod' => '$(INST_MAN1DIR)/gcap.$(MAN1EXT)'},
  dist => {
    PREOP => '@if test -f .git/HEAD; then \
	git log --stat --name-only --date=short --abbrev-commit \
		--after="Thu Feb 17 00:51:39 2011" >ChangeLog; \
fi',
    POSTOP => '@if test -f .git/HEAD; then \
	git checkout ChangeLog; \
fi',
  },
);
