@echo off
set /p str=Ѱ�ҵ��ļ����ͣ����ӣ�*.bat��:

dir %str% /b | findstr /v /c:"�ļ��б�.txt" > �ļ��б�.txt