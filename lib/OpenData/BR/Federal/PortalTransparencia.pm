
package OpenData::BR::Federal::PortalTransparencia;

use Moose;

use OpenData::Array;

with 'OpenData::Provider';

has '+id'   => ( default => 'PortalTransparencia', );
has '+name' => ( default => 'PortalTransparencia', );

has '+description' => ( default => 'Portal da Transparência: '
      . 'http://www.portaltransparencia.gov.br', );

use OpenData::BR::Federal::PortalTransparencia::CEIS;

sub add_collection_ceis {
    my $c = OpenData::BR::Federal::PortalTransparencia::CEIS->new;
    shift->add_collection($c);
}

use OpenData::BR::Federal::PortalTransparencia::Convenios;

sub add_collection_convenios {
    my $c = OpenData::BR::Federal::PortalTransparencia::Convenios->new;
    shift->add_collection($c);
}

#use OpenData::BR::Federal::PortalTransparencia::Servidores;

has items => (
    is      => 'ro',
    isa     => 'Object',
    lazy    => 1,
    default => sub {
        return OpenData::Array->new_with_traits(
            traits => 'Dumper',

            #host   => 'localhost',
        );
    }
);

has '+loader' => (
    lazy    => 1,
    default => sub { shift->items },
);

sub BUILD {
    my $self = shift;

    #    $self->set_browser('Mechanize');
}

1;

