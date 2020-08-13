@echo off && setlocal enabledelayedexpansion
@echo off
set /p"=  %username%"<nul>"                提示：您的当前系统用户是"
color 0c
echo.
findstr /a:fc .* "                提示：您的当前系统用户是?"
echo.
pause>nul