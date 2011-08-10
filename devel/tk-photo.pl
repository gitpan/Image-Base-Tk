#!/usr/bin/perl -w

# Copyright 2011 Kevin Ryde

# This file is part of Image-Base-Tk.
#
# Image-Base-Tk is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3, or (at your option) any later
# version.
#
# Image-Base-Tk is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License along
# with Image-Base-Tk.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use Tk;

# uncomment this to run the ### lines
use Devel::Comments;

{
  my $mw = MainWindow->new;
  #  require Tk::PNG;
  my $photo = $mw->Photo (-width => 4, -height => 4);
  # $photo->Photo (-width => 4, -height => 4);
  # ### parent: $photo->get_parent

  my @opts = $photo->configure;
  ### @opts

  exit 0;
}

{
  # transparent
  my $mw = MainWindow->new;
  #  require Tk::PNG;
  my $photo = $mw->Photo (-width => 4, -height => 4);
  $photo->put ('white', -to => 1,1,3,3);
  $photo->transparencySet (2,2, 1);
  $photo->put ('green', -to => 0,0,4,4);

  $photo->write('/dev/stdout', -format => 'XPM');
  exit 0;
}

{
  # loading PNG
  my $mw = MainWindow->new;
  #  require Tk::PNG;
  my $photo = $mw->Photo (-file => '/etc/motd');
  #my $photo = $mw->Photo (-file => '/usr/share/emacs/23.3/etc/images/gnus/gnus.png');
  # require Tk::JPEG;
  # require Tk::TIFF;
  # #$photo->data(-format => 'JPEG');
  # $photo->data(-format => 'TIFF');
  # $photo->data(-format => 'PNG');
  exit 0;
}

{
  # saving PNG
  my $mw = MainWindow->new;
  my $photo = $mw->Photo (-width => 1, -height => 1);
  require Tk::PNG;
  require Tk::JPEG;
  require Tk::TIFF;
  #$photo->data(-format => 'JPEG');
  $photo->data(-format => 'TIFF');
  $photo->data(-format => 'PNG');
  exit 0;
}

{
  require Tk::PNG;
  require Image::Base::Tk::Photo;
  my $mw = MainWindow->new;
  my $image = Image::Base::Tk::Photo->new
    (-for_widget => $mw,
     -width => 20,
     -height => 10,
     -file_format => 'xpm');
  $image->set(-file_format => 'xpm');
  ### format: $image->get('-file_format')

  $image->rectangle (1,1, 4,4, 'orange', 0);

  # $image->rectangle (0,0, 19,9, 'white', 1);
  # $image->line (10,0, 0,10, 'green');
   #$image->line (1,1, 1,1, 'green');
  # $image->diamond (0,0, 16,4, 'blue', 1);
#  $image->save ('/tmp/x.xpm');
  $image->save ('/dev/stdout');
  $image->save ('/dev/stdout');
 # system ('xzgv /tmp/x.xpm');
  exit 0;
}

my $mw = MainWindow->new;
$mw->title("Hello World");
$mw->Button(-text => "Done", -command => sub { exit })->pack;




{
  my $p = $mw->Photo; # (-width => 16, -height => 16);
#  $p->put('red', -to => 0, 0, 16, 1);

#  $p->configure(-width => 32);

  ### width: $p->width
  ### height: $p->height
  ### type: $p->type
  { my $cget = $p->cget('-format');
    ### -format: $cget
  }
  { my $cget = $p->cget('-width');
    ### -width: $cget
  }

  # {
  #   # $p->configure(-file => '/tmp/something');
  #   $p->configure(-format => 'gif');
  #   $p->write ('/tmp/something.gif');
  #   my $cget = $p->cget('-file');
  #   ### -file: $cget
  # }

  require Tk::PNG;
  $p->read ('/usr/share/emacs/23.3/etc/images/tree-widget/folder/open.png');
  ### -file read(): scalar($p->cget('-file'))
  ### width: $p->width

  # $p->configure (-file => '/usr/share/emacs/23.3/etc/images/tree-widget/folder/open.png');
  # ### -file configure(): scalar($p->cget('-file'))
  # ### width: $p->width

  my $l = $mw->Label (-image => $p);
  $l->pack;
}
# {
#   my $b = $mw->Bitmap;
#   $b->put('red', -to => 0, 0, 16, 1);
#   ### width: $b->width
#   ### height: $b->height
#   ### type: $b->type
# 
#   my $l = $mw->Label (-image => $b);
#   $l->pack;
# }

{
  my @imagetypes = $mw->imageTypes;
  ### @imagetypes
}
{
  my @imagenames = $mw->imageNames;
  ### @imagenames
}

MainLoop;
