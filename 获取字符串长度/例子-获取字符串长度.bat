
 @echo off
 set str1=This is a test string
 set str2=Hello World
 ::���������ַ���
set str=%str1%
 ::��str1���Ƶ�str
 :next1
 ::��ǩ������goto��ת
::ע����ע����������ע��������ð�ſ�ͷ����ǩ��Ϊһ��ð��
if not "%str%"=="" (
 ::�ж�str�ǲ��ǿմ������������ִ���±ߵ����
set /a num+=1
 ::�������㣬ʹnum��ֵ����1���൱��num++����++num���
set "str=%str:~1%"
 ::��ȡ�ַ�������������
goto next1
 ::��ת��next1��ǩ
::��������goto�ͱ�ǩ������ѭ���ṹ
)
 ::������ѭ���ṹִ�����ʱ����ִ���±ߵ����
echo str1=%str1%
 echo str1�ĳ���Ϊ��%num%
 ::������
set num=0
 ::���Ǻ��õĻ�������num��0���Ա㿪ʼ��һ�����㡣
set str=%str2%
 ::��str2���Ƶ�str
 :next2
 ::����һ���µı�ǩ
::ע�ⲻ�������еı�ǩͬ������������
if not "%str%"=="" (
 set /a num+=1
 set "str=%str:~1%"
 goto next2
 )
 ::����һ��ѭ�����ƣ����ٽ���
echo str2=%str2%
 echo str2�ĳ���Ϊ��%num%
 ::������
echo �����ϣ���������˳�&&pause>nul&&exit