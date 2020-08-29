@echo off && setlocal enabledelayedexpansion


powershell -command "& {$FILE = get-content 你的文件名字; ([regex]"(?sOCR_RVCT9.+?ize>(.+?)</Siz.+?<OCR_RVCT9").matches($FILE)[0].groups[1].value}" 

pause