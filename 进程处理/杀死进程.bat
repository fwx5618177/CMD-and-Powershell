@echo off
set /p str=����Ҫ����Ľ���:
tasklist | findstr /i %str%
set /p pid=���̺ţ�
taskkill /f /pid %pid%
pause