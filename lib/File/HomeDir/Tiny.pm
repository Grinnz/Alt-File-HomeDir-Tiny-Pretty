package File::HomeDir::Tiny;

use strict;
use warnings;
use Alt::File::HomeDir::Tiny::Pretty;

our @EXPORT = 'home';

use constant OLDWIN => $^O eq 'Win32' && "$]" < 5.016;

sub home () { OLDWIN ? ($ENV{HOME} || $ENV{USERPROFILE}) : (<~>)[0] }

sub import {
  my $package = shift;
  die "$package does not export $_ at " . join(' line ', (caller)[1,2]) . ".\n"
    for grep { $_ ne 'home' } @_;
  no strict 'refs';
  *{caller() . '::home'} = \&home;
}

1;

=head1 NAME

File::HomeDir::Tiny - Find your home directory (but pretty code)

=head1 DESCRIPTION

See L<File::HomeDir::Tiny>.

=head1 BUGS

Report any issues on the public bugtracker.

=head1 AUTHOR

Dan Book <dbook@cpan.org>

Original code by Father Chrysostomos <sprout [at] cpan [dot] org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 Dan Book, 2017 Father Chrysostomos.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 SEE ALSO

L<File::HomeDir::Tiny>
