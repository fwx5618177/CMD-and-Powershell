@echo off && setlocal enabledelayedexpansion

if exist tmplist.txt del tmplist.txt

for /l %%i in (1,1,10) do (
	set /p="%%i,"<nul>>tmplist.txt
)

for /f %%i in (tmplist.txt) do (
	set str=%%i
)
del tmplist.txt

echo !str:~,-1!


pause>nul