#!/usr/bin/env perl

use strict;
use warnings;
use FindBin qw($Bin); # core

my $in  = get_fh('<', "$Bin/../init.sh");
my $out_path = "$Bin/init-for-vagrant.sh";
my $out = get_fh('>', $out_path);

my $prefixed = 0;

while(<$in>){

  # first line
  if( !$prefixed++ ){
    # append so that it goes after the shebang
    $_ .= "\n# GENERATED BY VAGRANT\n\nVAGRANT_IS_PROVISIONING=true\n";
  }

  # don't warn and no-op; actually stop them from running
  s{^(update-rc\.d) (\S+) remove}{$1 $2 disable; /etc/init.d/$2 stop};

  # an extra safety measure
  s{^(\s*rm|git .+)}{# $1};

  print $out $_;
}

close $out;
chmod 0755, $out_path;

sub get_fh {
  my ($dir, $path) = @_;
  open my $fh, $dir, $path
    or die "failed to open $dir $path: $!";
  return $fh;
}
