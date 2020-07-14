$file1=".\a.txt";
$file2=".\b.txt";
$file3=".\c.txt";
$text1=[IO.File]::ReadAllLines($file1,[Text.Encoding]::Default);
$text2=[IO.File]::ReadAllLines($file2,[Text.Encoding]::Default);
$dic=New-Object 'System.Collections.Generic.Dictionary[string,string]';
for($i=0;$i -lt $text1.count;$i++){
    if(-not $dic.ContainsKey($text1[$i])){
        $dic.add($text1[$i],'');
    };
};
[System.Collections.ArrayList]$s=@();
for($i=0;$i -lt $text2.count;$i++){
    if(-not $dic.ContainsKey($text2[$i])){
        [void]$s.add($text2[$i]);
    };
};
[IO.File]::WriteAllLines($file3, $s, [Text.Encoding]::Default);