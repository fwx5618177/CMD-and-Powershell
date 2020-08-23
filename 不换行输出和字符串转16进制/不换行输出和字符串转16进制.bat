@echo off && setlocal EnableDelayedExpansion

for /f "delims=" %%i in ('type test.txt') do (
	set /P "=%%i" < NUL > chr.tmp
)

::创建为空的新文件进行比对，大小为chr.tmp
for %%a in (chr.tmp) do fsutil file createnew zero.tmp %%~Za > NUL

::fc /b 比较文件差异，获取十六进制
set "hex="
fc /B chr.tmp zero.tmp

for /F "skip=1 tokens=2" %%a in ('fc /B chr.tmp zero.tmp') do set "hex=!hex!%%a"

del chr.tmp zero.tmp
echo 十六进制：%hex% && pause>nul