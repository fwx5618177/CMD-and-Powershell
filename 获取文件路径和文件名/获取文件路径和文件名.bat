@echo off

dir /s /b | findstr /n /v ".git"

pause