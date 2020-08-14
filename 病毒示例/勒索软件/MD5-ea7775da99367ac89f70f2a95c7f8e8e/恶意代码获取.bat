@echo off && setlocal enabledelayedexpansion
chcp 65001
if exist index.html del index.html
if exist Powershell恶意代码的N种姿势.html del Powershell恶意代码的N种姿势.html
powershell -file getContent.ps1


type  index.html | findstr /i "<title>"

for /f  %%i in ('type  index.html ^| findstr /i "<title>"') do (
	echo %%i
	set str=%%i
)

rename index.html !str:~7!.html
