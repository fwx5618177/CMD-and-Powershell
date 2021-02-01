REM 文件统计
REM 返回文件位置和文件名字，并且统计数目
@echo off && setlocal enabledelayedexpansion

echo 全部文件列表:>> 文件列表.txt
dir /s /b | findstr /v /n "git readme bat 文件列表">> 文件列表.txt
echo.>> 文件列表.txt
echo.>> 文件列表.txt
echo 筛选后可统计文件:>> 文件列表.txt
dir /s /b | findstr /v "git readme bat 文件列表" | findstr /n .>> 文件列表.txt