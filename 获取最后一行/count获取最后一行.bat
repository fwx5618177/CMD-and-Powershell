@echo off && setlocal enabledelayedexpansion

cd ..
set /a line=0
for /f "delims=" %%i in ('dir /o:d /b ^| findstr /n "."') do (
	set /a line+=1
)

set /a count=0
for /f "delims=" %%i in ('dir /o:d /b') do (
	set /a count+=1
	if !count!==!line! echo %%i
)

pause