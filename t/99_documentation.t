#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use Data::Dumper;

# use Data::Transactional;
use Tie::Hash::Transactional nowarn => 1;
use Pod::Coverage 0.15;
use Test::More tests => 3;

foreach my $mod (
    { mod => 'Tie::Hash::Transactional' },
    { mod => 'Data::Transactional' },
    { mod => 'Data::Compare::Plugins::Data::Transactional',
      private => [qr/^(register|underlying|dt_.*compare)$/] }
) {
    my $podcoverage = Pod::Coverage->new(
        package => $mod->{mod},
        also_private => $mod->{private},
        trustme => $mod->{trustme}
    );
    my $coverage = $podcoverage->coverage();
    ok(!defined($coverage) || $coverage == 1, "$mod->{mod} is adequately documented");
    unless(!defined($coverage) || $coverage == 1) {
        print '# '.join(', ', $podcoverage->naked())."\n"
    }
}
