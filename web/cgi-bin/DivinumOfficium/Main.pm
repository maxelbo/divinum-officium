package DivinumOfficium::Main;
use utf8;
use strict;
use warnings;
use Carp;
use DivinumOfficium::FileIO qw(do_read);

BEGIN {
  require Exporter;
  our $VERSION = 1.00;
  our @ISA = qw(Exporter);
  our @EXPORT_OK = qw(vernaculars liturgical_color);
}

#*** vernaculars($basedir)
# Returns a list of available vernacular languages for the datafiles rooted at
# $basedir.
sub vernaculars {
  my $basedir = shift;
  my @lines = do_read("$basedir/Linguae.txt") or croak q(Couldn't load language list.);
  return @lines;
}

sub liturgical_color {
  $_ = shift;
  my($commune) = @_;
  return '#00639b' if ($commune && $commune =~ /(C1[0-9])/); # blue
  return '#d94b58' if (/(Vigilia Pentecostes|Quattuor Temporum Pentecostes|Martyr)/i); # red
  return '#8281a0' if (/(Defunctorum|Parasceve|Morte)/i); # grey
  return '#333333' if (/^In Vigilia Ascensionis/); # black
  return '#9a77cf' if (/(Vigilia|Quattuor|Rogatio|Passion|Palmis|gesim|(?:Majoris )?Hebdomadæ(?: Sanctæ)?|Sabbato Sancto|Dolorum|Ciner|Adventus)/i); # purple
  return '#333333' if (/(Conversione|Dedicatione|Cathedra|oann|Pasch|Confessor|Ascensio|Cena)/i); # black
  return '#009192' if (/(Pentecosten|Epiphaniam|post octavam)/i); # green
  return '#d94b58' if (/(Pentecostes|Evangel|Innocentium|Sanguinis|Cruc|Apostol)/i); # red
  return '#333333' # black
}
1;
