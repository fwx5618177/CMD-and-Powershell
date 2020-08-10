@echo off
set /p str=寻找的文件类型（例子：*.bat）:

dir %str% /b | findstr /v /c:"文件列表.txt" > 文件列表.txt