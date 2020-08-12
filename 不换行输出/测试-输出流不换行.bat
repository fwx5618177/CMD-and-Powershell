
 @echo off
 del b.txt
 del c.txt
 del d.txt
 if exist "%cd%\zhI386" rd /s /q "%cd%\zhI386"
 md zhI386
 ::for /r "%cd%\eni386\" %%i in (*) do (echo %%i>>b.txt)
 for /f %%i in ('dir /b %cd%\eni386\') do (
 echo %%i>>c.txt
 if exist "%cd%\zhall\i386\%%i" (copy "%cd%\zhall\i386\%%i" "%cd%\zhI386\"
 ) else (>>d.txt set /p="zhall\i386\%%i"<nul&echo ----Not exist>>d.txt)
 )