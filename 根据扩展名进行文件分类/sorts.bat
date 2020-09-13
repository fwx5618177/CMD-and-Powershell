@echo off && setlocal enabledelayedexpansion

:start
set /p "fix=extension:"

if "%fix%"=="" goto start
if "%fix%"=="q" exit

for /f "delims=\*" %%i in ('dir /b ^| findstr ".%fix%$"') do (
	if not exist %fix% mkdir %fix%
	echo %%i
	move "%%i" ./%fix%/
)

goto start
