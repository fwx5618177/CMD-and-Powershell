@echo off && setlocal enabledelayedexpansion

:start
set /p "FILEPATH=��������ļ���ַ��"
if "%FILEPATH%"=="" goto start
set /p "RESULTFILE=�����ŵ�ַ��"
if "%RESULTFILE%"=="" goto start

powershell -file GetSearch.ps1 %FILEPATH% %RESULTFILE%

echo.
echo ����
pause>nul