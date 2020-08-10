@echo off

set /p TimeStr=多久后自动关机：
shutdown /s /t %TimeStr%