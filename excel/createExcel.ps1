$xl=New-Object -ComObject excel.application
$xl.visible=$true
$wb=$xl.workbooks.add()
$sheet=$wb.sheets.item(1)
$sheet.cells.item(1,1)="����"
$sheet.cells.item(1,2)="����"
$sheet.cells.item(2,1)="��Ϣ��"
$sheet.cells.item(3,1)="��������
$sheet.cells.item(4,1)=�����ʲ���
$sheet.cells.item(2,2)=2
$sheet.cells.item(3,2)=6
$sheet.cells.item(4,2)=5
 
$sheet.cells.item(1,3)="����"
$sheet.cells.item(1,4)="����"
$sheet.cells.item(2,3)="��"
$sheet.cells.item(3,3)="����
$sheet.cells.item(4,3)=������
$sheet.cells.item(2,4)=8
$sheet.cells.item(3,4)=3
$sheet.cells.item(4,4)=4
 
#$sheet.Cells.Item(1,5)=$sheet1.cells.item(4,5).value2
 
$range=$sheet.Range("A1:D4")
$chart=$sheet.ChartObjects()#����һ��excelͼ�����
$chart_t=$chart.Add(100,100,300,200)#����λ�� ��������ƫ��
$chart_t.Chart.SetSourceData($range,2)#��������ԭʼ����Դ
 
$chart_t.Chart.ChartType=58#����ͼ������
$chart_t.Chart._ApplyDataLabels(5)#Ӧ�ñ�ǩֵ
$chart_t.Chart.ChartStyle=2#������ʽ
$chart_t.Chart.ChartTitle.gettype() #��ȡchart����

$wb.SaveAs(��D:\code data\CMD\excel\test.xlsx��)