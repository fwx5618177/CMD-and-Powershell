@echo off && setlocal enabledelayedexpansion
:start

set /p "FILE=��������ļ���ַ��"
if "%FILE%"=="" goto start
set /p "RESULT=�����ŵ�ַ��"
if "%RESULT%"=="" goto start
set /p "Pages=������ҳ����(1-6ҳ����д��1..6)"
if "%Pages%"=="" goto start

powershell -file GetSearch.ps1 %FILE% %RESULT%

echo.
echo ����
pause>nul