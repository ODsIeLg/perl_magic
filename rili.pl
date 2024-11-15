#! /usr/bin/perl
use Excel::Writer::XLSX;
use utf8;
use Calendar::Any::Util::Calendar qw(calendar);
use Data::Dump qw(dump);
my $workbook = Excel::Writer::XLSX->new( 'newwork.xlsx' );#新建一个xlsx文件
my $format = $workbook->add_format();
$format->set_center_across();
for($i=1;$i<=12;$i++){
    my $add=$word.$i;
    $add = $workbook->add_worksheet("$i");#创建工作簿，共12个
    my $calen=calendar($i, 2024);#获取月历
    my @get=split /\r?\n/,$calen;#将月历转化成数组
    for($x=2;$x<=7;$x++) {
      my @array;
      my $date=$get[$x];
      my @good=split / /,$date;
      if($#good>6){
      @good=grep /\d+/,@good;
      }
        if($x<7){
      for($g=@good;$g<7;$g++){
       
        unshift (@good,"");
      }
        }
      my $b=$x-1;
      my $a='A'.$b;
      $add->write("$a",\@good,$format);
      
}
}
