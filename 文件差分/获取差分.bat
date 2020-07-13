@echo off

findstr /belig:"1.txt" "2.txt">same.txt

findstr /bevlig:"1.txt" "2.txt">diff-a-b.txt
findstr /belivg:"2.txt" "1.txt">diff-b-a.txt