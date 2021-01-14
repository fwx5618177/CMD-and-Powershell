@echo off && setlocal enabledelayedexpansion

powershell -command "& { Get-Clipboard > data.txt; }"

for /f "tokens=2 delims=X" %%i in ('type data.txt') do (
	@echo X%%i>>new.txt
)