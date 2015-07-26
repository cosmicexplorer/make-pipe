#!/bin/perl

use strict;
use warnings;
use Data::Dumper;
use IPC::Open2;

sub splitListByPipeString {
  my @result = ();
  my @curSublist = ();
  foreach my $el (@_) {
    if ($el eq '|') {
      push @result, [@curSublist];
      @curSublist = ();
    } else {
      push @curSublist, $el;
    }
  }
  push @result, [@curSublist];
  return @result;
}

# foreach my $procAndArgs (splitListByPipeString @ARGV) {
#   print Dumper $procAndArgs;
# }

my @pids;
for (my $child = 0; $child <= 3; ++$child) {
  if (@pids[$child] = fork()) {

  } else {
    exec 'cat';
  }
}
