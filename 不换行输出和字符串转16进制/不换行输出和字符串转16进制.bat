@echo off && setlocal EnableDelayedExpansion

for /f "delims=" %%i in ('type test.txt') do (
	set /P "=%%i" < NUL > chr.tmp
)

::����Ϊ�յ����ļ����бȶԣ���СΪchr.tmp
for %%a in (chr.tmp) do fsutil file createnew zero.tmp %%~Za > NUL

::fc /b �Ƚ��ļ����죬��ȡʮ������
set "hex="
fc /B chr.tmp zero.tmp

for /F "skip=1 tokens=2" %%a in ('fc /B chr.tmp zero.tmp') do set "hex=!hex!%%a"

del chr.tmp zero.tmp
echo ʮ�����ƣ�%hex% && pause>nul