#!/usr/bin/env perl
use strictures 2;

use Test::More;

use Web::Starch;

my $starch = Web::Starch->new_with_plugins(
    ['::Sereal'],
    store => { class=>'::Memory' },
);

my $session = $starch->session();

my $data = { foo=>32, bar=>[1,2,3] };

is_deeply(
    $session->clone_data( $data ),
    $data,
    'cloned data',
);

ok(
    (!$session->is_data_diff($data, $data)),
    'data is not diff',
);

ok(
    $session->is_data_diff(12, $data),
    'data is diff',
);

done_testing();
