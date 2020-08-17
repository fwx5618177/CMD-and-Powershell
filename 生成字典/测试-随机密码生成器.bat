@echo off
setlocal enabledelayedexpansion
set s=abcdefghijklmnopqrstuvwxyz0123456789
set m=100
set l=9
(for /l %%j in (1,1,%m%) do (
	set p=
	for /l %%i in (1,1,%l%) do (
		set /a n=!random! %% 36
		call set p=!p!%%s:~!n!,1%%
	)
	echo !p!
)
)>pass.txt