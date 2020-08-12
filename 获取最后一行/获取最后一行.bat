@echo off
cd ..
for /f "delims=" %%i in ('dir /O:d /b') do (
set "foo=%%i"
)
echo %foo%

pause > nul
exit