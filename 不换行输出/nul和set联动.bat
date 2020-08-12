@echo off
 set /p="hello "<nul
 set /p="world "<nul
 echo again
 echo new line
 
 pause
 
 
 echo off
 set csvpath=测试数据
set sqluldr=D:\sqluldr\sqluldr2sdk\sqluldr2
 set sqlpath=导出模板
rem set filename=产品行情
rem sqluldr2 gtcustomer/passwd file=%csvpath%\%filename%.csv text=csv field=, sql=exp%filename%.sql log=%csvpath%\%filename%.log
 rem 
 rem set filename=产品行情更新
rem sqluldr2 gtcustomer/passwd file=%csvpath%\%filename%.csv text=csv field=, sql=exp%filename%.sql log=%csvpath%\%filename%.log

set expfpath=百万级
echo 导出%expfpath%数据：
for %%i in (%sqlpath%\%expfpath%\exp*.sql) do (
 set /p="导出数据: %%~ni"<nul
 %sqluldr% gtcustomer/passwd file=%csvpath%\%expfpath%\%%~ni.csv text=csv field=, sql=%%i log=%csvpath%\%expfpath%\%%~ni.log
 echo ............ok.
 )
 set expfpath=千万级
echo 导出%expfpath%数据：
for %%i in (%sqlpath%\%expfpath%\exp*.sql) do (
 set /p="导出数据: %%~ni"<nul
 %sqluldr% gtcustomer/passwd file=%csvpath%\%expfpath%\%%~ni.csv text=csv field=, sql=%%i log=%csvpath%\%expfpath%\%%~ni.log
 echo ............ok.
 )
 pause