use strict;
use warnings;
use File::HomeDir::Tiny;
use Test::More tests => 4;

{
 local $ENV{HOME} = '/hoom';
 is home, '/hoom', 'home is /hoom';
 {
  local $ENV{HOME} = '/hoose';
  is home, '/hoose', 'home is /hoose';
 }
 is home, '/hoom', 'home is /hoom';
}

eval { File::HomeDir::Tiny->import('foo') }; my $line = __LINE__;
is $@, 
  "File::HomeDir::Tiny does not export foo at ".__FILE__." line $line.\n",
  'correct error message';
