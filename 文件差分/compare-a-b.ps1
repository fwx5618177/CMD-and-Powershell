$a = Get-Content 1.txt
$b = Get-Content 2.txt
Compare-Object $a $b > compare.txt