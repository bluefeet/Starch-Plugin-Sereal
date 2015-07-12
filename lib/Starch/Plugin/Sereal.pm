package Web::Starch::Plugin::Sereal;

use Moo;
use strictures 2;
use namespace::clean;

with qw(
    Web::Starch::Plugin::Bundle
);

sub bundled_plugins {
    return [qw(
        ::Sereal::Manager
        ::Sereal::Session
    )];
}

1;
__END__

=head1 NAME

Web::Starch::Plugin::Sereal - Use Sereal for cloning and diffing Web::Starch data structures.

=head1 SYNOPSIS

    my $starch = Web::Starch->new_with_plugins(
        ['::Sereal'],
    );

=head1 DESCRIPTION

By default L<Web::Starch::Session/clone_data> and L<Web::Starch::Session/is_data_diff>
use L<Storable> to do the heavy lifting.  This module replaces those two methods
with ones that use L<Sereal> which can be leaps and bounds faster than Storable.

In this author's testing C<is_data_diff> will be about 3x faster with Sereal and
C<clone_data> will be about 1.5x faster with Sereal.

=head1 MANAGER ATTRIBUTES

=head2 sereal_encoder

An instance of L<Sereal::Encoder>.

=head2 sereal_decoder

An instance of L<Sereal::Decoder>.

=head2 canonical_sereal_encoder

An instance of L<Sereal::Encoder> with the C<canonical> option set.

=head1 MODIFIED SESSION METHODS

=head2 clone_data

Modified to use L</sereal_encoder> and L</sereal_decoder> to clone
a data structure.

=head2 is_data_diff

Modified to use L</canonical_sereal_encoder> to encode the two data
structures.

=head1 AUTHOR

Aran Clary Deltac <bluefeetE<64>gmail.com>

=head1 ACKNOWLEDGEMENTS

Thanks to L<ZipRecruiter|https://www.ziprecruiter.com/>
for encouraging their employees to contribute back to the open
source ecosystem.  Without their dedication to quality software
development this distribution would not exist.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
