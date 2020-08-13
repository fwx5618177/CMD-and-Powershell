@echo off  & setlocal enabledelayedexpansion

powershell -command "& { ls; write-host "test command" -background red -foregroundcolor white;}"

echo.

powershell -file test.ps1

pause
