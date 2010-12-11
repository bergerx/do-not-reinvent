# How to develop a stable, pre-forking HTTP daemon in Perl
http://www.petercooper.co.uk/archives/000702.html


installed perl modules
perl -MFile::Find=find -MFile::Spec::Functions -Tlw -e \
'find { wanted => sub { print canonpath $_ if /\.pm\z/ }, no_chdir => 1 }, @INC'

