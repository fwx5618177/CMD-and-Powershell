:: CompDir.cmd - Compare files in two directories.
:: Will Sort - 19:40 2005-12-23 - CMD@WinXP
@echo off & setlocal EnableDelayedExpansion
if not "%2"=="" goto Start
:Help
echo CompDir.cmd - Compare files in two directories.
echo Usage: %0 [/f] dir1 dir2 [FileSpec]
echo
/f
Compare time/size/attrib of file
echo
filespec Specific files by wildcard of filename
goto :EOF
:Start
if /i "%1"=="/f" shift && set _CompFile=on
if "%3"=="" (set filespec=*.*) else set filespec=%3
for /r %~f1 %%f in (%filespec%) do (
set file=%%~ff
set file=!file:%~f1\\=!
if not exist "%~f2\\!file!" echo.Only in 1: !file!
)
for /r %~f2 %%f in (%filespec%) do (
set file=%%~ff
set file=!file:%~f2\\=!
if not exist "%~f1\\!file!" echo Only in 2: !file!
)
if not "%_CompFile%"=="on" goto :EOF
echo Compare Time/siZe/Attrib of file...
echo Press Ctrl+C to Quit
for /r %~f1 %%f in (%filespec%) do (
set file=%%~ff
set file=!file:%~f1\\=!
if exist "%~f2\\!file!" for %%g in ("%~f2\\!file!") do (
if "%%~tf" NEQ "%%~tg" echo !file! Time 1"%%~zf" NEQ 2"%%~zg">>"%temp%\\_CompFile.tmp"
if "%%~zf" NEQ "%%~zg" echo !file! Size 1"%%~zf" NEQ 2"%%~zg">>"%temp%\\_CompFile.tmp"
if "%%~af" NEQ "%%~ag" echo !file! Attrib 1"%%~zf" NEQ 2"%%~zg">>"%temp%\\_CompFile.tmp"
)
)
if exist "%temp%\\_CompFile.tmp" del "%temp%\\_CompFile.tmp"