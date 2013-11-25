#!perl -Tw

use Test::More tests => 2;

use User::getgrouplist;

my $username = 'root';
my @list = getgrouplist($username);

ok(scalar(@list) > 0, 'Found at least one groop for ' . $username);

ok((grep { $_ == 0 } @list), 'Group 0 in root\'s group list');
