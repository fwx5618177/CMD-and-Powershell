chcp 65001
@echo off

:fileRM

set /P fileRD=是否删除文件(y/Y):


IF "%flag%"=="y" goto delFile

IF "%flag%"=="Y" goto delFile

goto loop

:delFile

set /P fileRDName=文件名:
del %fileRDName%

goto loop

:loop
set /P file1=作比较的文件1:

set /P file2=作比较的文件2:
fc %file1% %file2%

set /P flag=是否保存不同(y/Y):

IF "%flag%"=="y" goto fc
IF "%flag%"=="Y" goto fc

goto loop

:fc
set /P filename=保存的文件名:
fc %file1% %file2% > %filename%
goto fileRM


if errorlevel==1 pause
goto loop