@echo off
set /p str=您想要处理的进程:
tasklist | findstr /i %str%
set /p pid=进程号：
taskkill /f /pid %pid%
pause