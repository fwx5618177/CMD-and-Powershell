@echo off

set /p str= «∑Ò÷ÿ∆Ù£∫

if /I "%str%" == "y"  (
	goto restart
) ELSE (
	goto exit
)

:restart
shutdown /r

:exit
exit