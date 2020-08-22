@echo off && setlocal enabledelayedexpansion

:start
set /p "FILEPATH=输入你的文件地址："
if "%FILEPATH%"=="" goto start
set /p "RESULTFILE=结果存放地址："
if "%RESULTFILE%"=="" goto start

powershell -file GetSearch.ps1 %FILEPATH% %RESULTFILE%

echo.
echo 结束
pause>nul