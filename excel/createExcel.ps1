$xl=New-Object -ComObject excel.application
$xl.visible=$true
$wb=$xl.workbooks.add()
$sheet=$wb.sheets.item(1)
$sheet.cells.item(1,1)="部门"
$sheet.cells.item(1,2)="人数"
$sheet.cells.item(2,1)="信息部"
$sheet.cells.item(3,1)="行政部”
$sheet.cells.item(4,1)=“物资部”
$sheet.cells.item(2,2)=2
$sheet.cells.item(3,2)=6
$sheet.cells.item(4,2)=5
 
$sheet.cells.item(1,3)="姓名"
$sheet.cells.item(1,4)="年龄"
$sheet.cells.item(2,3)="王"
$sheet.cells.item(3,3)="景”
$sheet.cells.item(4,3)=“刘”
$sheet.cells.item(2,4)=8
$sheet.cells.item(3,4)=3
$sheet.cells.item(4,4)=4
 
#$sheet.Cells.Item(1,5)=$sheet1.cells.item(4,5).value2
 
$range=$sheet.Range("A1:D4")
$chart=$sheet.ChartObjects()#创建一个excel图标对象
$chart_t=$chart.Add(100,100,300,200)#设置位置 左上右下偏离
$chart_t.Chart.SetSourceData($range,2)#设置它的原始数据源
 
$chart_t.Chart.ChartType=58#设置图标类型
$chart_t.Chart._ApplyDataLabels(5)#应用标签值
$chart_t.Chart.ChartStyle=2#设置样式
$chart_t.Chart.ChartTitle.gettype() #获取chart类型

$wb.SaveAs(”D:\code data\CMD\excel\test.xlsx”)