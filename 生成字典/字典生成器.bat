@echo off && setlocal enabledelayedexpansion

for /f "delims=" %%i in ('type �ֵ���ŷ�Χ.txt ^| findstr "a"') do (
	set "str=%%i"
)
echo %str%

echo ֻ֧��5λ

for %%a in (%str%) do (
for %%b in (%str%) do (
for %%c in (%str%) do (
for %%d in (%str%) do (
for %%e in (%str%) do (
	echo %%a%%b%%c%%d%%e
	echo %%a%%b%%c%%d%%e>>dict.txt
)))))
