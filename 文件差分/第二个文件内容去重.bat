<# :
cls
@echo off
rem 根据一个txt文本文件内给出的行内容，将另一个txt文本文件内与其相同/重复的行内容删除
set #=Any question&set @=WX&set $=Q&set/az=0x53b7e0b4
title %#% +%$%%$%/%@% %z%
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy bypass "Invoke-Command -ScriptBlock ([ScriptBlock]::Create([IO.File]::ReadAllText('%~f0',[Text.Encoding]::Default))) -Args '%~dp0'"
echo;%#% +%$%%$%/%@% %z%
pause
exit
#>
$path=$args[0];
$txtfile1=$path+'1.txt';
$txtfile2=$path+'2.txt';
$txtfile3=$path+'c.txt';
if(-not (test-path -liter $txtfile1)){Write-host ('"'+$txtfile1+'" not found');exit;};
if(-not (test-path -liter $txtfile2)){Write-host ('"'+$txtfile2+'" not found');exit;};
$text1=[IO.File]::ReadAllLines($txtfile1, [Text.Encoding]::Default);
$text2=[IO.File]::ReadAllLines($txtfile2, [Text.Encoding]::Default);
$dic=New-Object 'System.Collections.Generic.Dictionary[string,int]';
[System.Collections.ArrayList]$s=@();
for($i=0;$i -lt $text1.count;$i++){
if(-not $dic.ContainsKey($text1[$i])){$dic.Add($text1[$i], 1)};
};
for($i=0;$i -lt $text2.count;$i++){
if(-not $dic.ContainsKey($text2[$i])){[void]$s.add($text2[$i])};
};
[IO.File]::WriteAllLines($txtfile3, $s, [Text.Encoding]::Default);