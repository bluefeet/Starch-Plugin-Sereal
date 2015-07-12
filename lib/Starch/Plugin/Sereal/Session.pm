package Starch::Plugin::Sereal::Session;

use Sereal::Encoder;
use Sereal::Decoder;

use Moo::Role;
use strictures 2;
use namespace::clean;

with qw(
    Starch::Plugin::ForSession
);

sub clone_data {
    my ($self, $data) = @_;

    my $manager = $self->manager();

    return $manager->sereal_decoder->decode(
        $manager->sereal_encoder->encode( $data ),
    );
}

sub is_data_diff {
    my ($self, $old, $new) = @_;

    my $encoder = $self->manager->canonical_sereal_encoder();

    $old = $encoder->encode( $old );
    $new = $encoder->encode( $new );

    return 0 if $new eq $old;
    return 1;
}

1;
