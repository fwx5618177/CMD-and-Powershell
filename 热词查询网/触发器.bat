@echo off && setlocal enabledelayedexpansion
:start

set /p "FILE=输入你的文件地址："
if "%FILE%"=="" goto start
set /p "RESULT=结果存放地址："
if "%RESULT%"=="" goto start
set /p "Pages=搜索的页数：(1-6页可以写成1..6)"
if "%Pages%"=="" goto start

powershell -file GetSearch.ps1 %FILE% %RESULT%

echo.
echo 结束
pause>nul