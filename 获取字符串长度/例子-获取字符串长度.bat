
 @echo off
 set str1=This is a test string
 set str2=Hello World
 ::设置两个字符串
set str=%str1%
 ::将str1复制到str
 :next1
 ::标签，用于goto跳转
::注意与注释语句的区别，注释用两个冒号开头，标签则为一个冒号
if not "%str%"=="" (
 ::判断str是不是空串，如果不是则执行下边的语句
set /a num+=1
 ::算术运算，使num的值自增1，相当于num++或者++num语句
set "str=%str:~1%"
 ::截取字符串，赋给自身
goto next1
 ::跳转到next1标签
::这里利用goto和标签，构成循环结构
)
 ::当以上循环结构执行完毕时，会执行下边的语句
echo str1=%str1%
 echo str1的长度为：%num%
 ::输出结果
set num=0
 ::将记和用的环境变量num置0，以便开始下一次运算。
set str=%str2%
 ::将str2复制到str
 :next2
 ::定义一个新的标签
::注意不能与已有的标签同名，否则会出错！
if not "%str%"=="" (
 set /a num+=1
 set "str=%str:~1%"
 goto next2
 )
 ::和上一个循环相似，不再介绍
echo str2=%str2%
 echo str2的长度为：%num%
 ::输出结果
echo 输出完毕，按任意键退出&&pause>nul&&exit