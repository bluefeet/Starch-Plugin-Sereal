#!/usr/bin/env perl
use strictures 2;

use Test::More;
use Test::Starch;
use Starch;

Test::Starch->new(
    plugins => ['::Sereal'],
)->test();

my $starch = Starch->new(
    plugins => ['::Sereal'],
    store => { class=>'::Memory' },
);

my $state = $starch->state();

my $data = { foo=>32, bar=>[1,2,3] };

is_deeply(
    $state->clone_data( $data ),
    $data,
    'cloned data',
);

ok(
    (!$state->is_data_diff($data, $data)),
    'data is not diff',
);

ok(
    $state->is_data_diff(12, $data),
    'data is diff',
);

done_testing();
