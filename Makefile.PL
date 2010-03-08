use 5.006001;
use ExtUtils::MakeMaker;
use ExtUtils::Liblist;

WriteMakefile(
    NAME                => 'User::getgrouplist',
    AUTHOR              => 'Bastian Friedrich <bastian.friedrich@collax.com>',
    VERSION_FROM        => 'lib/User/getgrouplist.pm',
    ABSTRACT_FROM       => 'lib/User/getgrouplist.pm',
    PREREQ_PM           => {
        'Exporter'      => 0,
        'Test::More'    => 0,
        'Test::Builder' => 0,
    },

    NEEDS_LINKING       => 1,
    INC                 => '-I.',

    EXE_FILES           => [],
    dist => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'User-getgrouplist-*.tar.*' },
);
