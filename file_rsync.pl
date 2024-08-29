#! /usr/bin/perl
use Devel::NYTProf;
use Benchmark;
use File::Copy::Recursive qw(dircopy fcopy);
my $adir="D:\\perltest\\get\\filea";
my $bdir="D:\\perltest\\get\\fileb";
my @D_adir;
my @D_bdir;

my $initial_name;
my $add="\\";
my $a_with;
my $b_with;
my $a_with_b;

#文件句柄
opendir (DIR,$adir);
@D_adir=readdir DIR;
close DIR;

opendir (AIR,$bdir);
@D_bdir=readdir AIR;
close AIR;
#去除多余部分
shift @D_adir;
shift @D_adir;
shift @D_bdir;
shift @D_bdir;
#获取不同部分
my (@union, @intersection, @difference);
my %count = ();
foreach my $element (@D_adir, @D_bdir) {
    $count{$element}++;
}
foreach my $element (keys %count) {
    push @union, $element;
    push @{$count{$element} > 1 ? \@intersection : \@difference }, $element;
}




#判断左边右边的哪个多
if (($#D_adir<=>$#D_bdir)!=1){
    ($adir,$bdir)=($bdir,$adir)
    }
#$a_with_b="$adir $bdir /e";
#print "$a_with_b\n";
#system "xcopy","$adir","$bdir","/e","/y";


foreach(@difference){
    print "$_\n";
    if (-d){
        $a_with=$adir.$add.$_;
        $b_with=$bdir.$add.$_;
        print "$a_with $b_with\n";
         dircopy($a_with,$b_with);
    }
    
    dircopy($a_with,$b_with);
    
    $a_with=$adir.$add.$_;
    fcopy($a_with,$bdir);
    
   
}


=pop
my $with;
my $add="\\";
foreach(@difference){
    $with=$bdir.$add.$_;
    print "$with\n";
}
print "ok\n"
if -f $with;
=cut
