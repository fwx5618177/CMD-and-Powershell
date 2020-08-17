@echo off && setlocal enabledelayedexpansion

for /f "delims=" %%i in ('type 字典符号范围.txt ^| findstr "a"') do (
	set "str=%%i"
)
echo %str%

echo 只支持5位

for %%a in (%str%) do (
for %%b in (%str%) do (
for %%c in (%str%) do (
for %%d in (%str%) do (
for %%e in (%str%) do (
	echo %%a%%b%%c%%d%%e
	echo %%a%%b%%c%%d%%e>>dict.txt
)))))
