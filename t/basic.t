#!/usr/bin/env perl
use strictures 2;

use Test::More;
use Test::Starch;
use Starch;

Test::Starch->new(
    plugins => ['::Sereal'],
)->test();

done_testing();
