@echo off && setlocal enabledelayedexpansion
chcp 65001

set "init=index.html"

if exist %init% del %init%

powershell -file getContent.ps1

type  index.html | findstr /i "<title>"

for /f  %%i in ('type  index.html ^| findstr /i "<title>"') do (
	echo %%i>> tmp.txt
	set str=%%i 
)

for /f "tokens=2 delims=title" %%i in (tmp.txt) do (
	set str=%%i
)

set str=!str:~1!
set str=!str:~,-2!

del tmp.txt

if exist !str!.html del !str!.html

echo %init%

echo !str!.html

rename %init% !str!.html

