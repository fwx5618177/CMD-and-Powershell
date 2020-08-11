@echo off

:start
choice /C dme /d d /M "1,2,3" /t 10

if %ERRORLEVEL%==1 goto end
goto start

:end
echo 'end'
pause
exit

:m
echo 'm'
goto start