use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Data::Transactional',
    VERSION_FROM => 'lib/Data/Transactional.pm',
    PREREQ_PM    => {
        Storable           => 2.07,  # we use dclone()
        'Data::Compare'    => 0.11,  # used for testing,
                                     # and by D:C:Plugins:D:T
        }
);
