@echo off && setlocal enabledelayedexpansion
:start

set /p "FILE=��������ļ���ַ��"
if "%FILE%"=="" goto start
set /p "RESULT=�����ŵ�ַ��"
if "%RESULT%"=="" goto start
set /p "Pages=������ҳ����(1-5ҳ����д��1..5)"
if "%Pages%"=="" goto start

powershell -file GetAll.ps1 %FILE% %RESULT% %Pages%

echo.
echo ����
pause>nul