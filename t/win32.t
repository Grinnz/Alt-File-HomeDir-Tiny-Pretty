use strict;
use warnings;

BEGIN {
 # On Perl 5.14-, our own home() implementation is based on $^O (which we
 # can fake here), but on Perl 5.16+, the module uses the built-in <~>
 # exclusively, the behaviour of which is determined at perl's com-
 # pile time.
 use if "$]" >= 5.016, 'Test::More' => skip_all => 'This is a Win32-only test on Perl 5.16+'
}

BEGIN { $^O = 'Win32' }
use File::HomeDir::Tiny;
use Test::More tests => 5;

local @ENV{'HOME','USERPROFILE'} = qw(/hoose /proofile);
is home, '/hoose', 'home is /hoose';
{
 local $ENV{HOME};
 is home, '/proofile', 'home is /proofile';
 {
  local $ENV{HOME} = 'C:\Documents and Settings\Tedret';
  is home, 'C:\Documents and Settings\Tedret', 'home is C:\Documents and Settings\Tedret';
 }
 is home, '/proofile', 'home is /proofile';
}
is home, '/hoose', 'home is /hoose';
