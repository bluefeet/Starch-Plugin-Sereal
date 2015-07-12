package Starch::Plugin::Sereal::Manager;

use Sereal::Encoder;
use Sereal::Decoder;
use Types::Standard -types;

use Moo::Role;
use strictures 2;
use namespace::clean;

with qw(
    Starch::Plugin::ForManager
);

has sereal_encoder => (
    is  => 'lazy',
    isa => InstanceOf[ 'Sereal::Encoder' ],
);
sub _build_sereal_encoder {
    return Sereal::Encoder->new();
}

has sereal_decoder => (
    is  => 'lazy',
    isa => InstanceOf[ 'Sereal::Decoder' ],
);
sub _build_sereal_decoder {
    return Sereal::Decoder->new();
}

has canonical_sereal_encoder => (
    is  => 'lazy',
    isa => InstanceOf[ 'Sereal::Encoder' ],
);
sub _build_canonical_sereal_encoder {
    return Sereal::Encoder->new({ canonical => 1 });
}

1;
