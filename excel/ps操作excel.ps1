# 如何创建一个Excel 应用程序对象?
$xl = new-object -comobject excel.application


# 默认创建的Excel 应用程序对象是在后台的，它默认不显示程序的主窗口出来，如何让它显示出来?
$xl.Visible = $true


#创建一个Excel 文件，也就是我们的Excel 文档(题外话:Excel 应用程序可以打开多个workbook,workbook 包含多个sheet,sheel包含多个cell

$wb = $xl.Workbooks.Add()


#添加一个工作薄worksheet?
$xl = new-object -comobject excel.application

$xl.Visible = $true

#打开ado_object_models.xls Excel 文档 
$wb = $xl.Workbooks.Open("C:\Scripts\ado_object_model.xls")

#添加一个工作薄
$ws = $xl.Sheets.Add()

#如何激活一个工作薄? 也就是如何选中某个工作簿让其处于我们可以操作的状态。
# 创建Excel 应用程序对象
$xl = new-object -comobject Excel.Application
# 显示Excel 软件的主界面窗口
$xl.visible = $true
# 打开一个Excel文档
$wb = $xl.workbooks.open("C:\Scripts\PowerShell\test.xls")

# 获取Excel 文档的工作薄 
$ws1 = $wb.worksheets | where {$_.name -eq "sheet1"} #<——- Selects sheet 1
$ws2 = $wb.worksheets | where {$_.name -eq "sheet2"} #<——- Selects sheet 2
$ws3 = $wb.worksheets | where {$_.name -eq "sheet3"} #<——- Selects sheet 3

# 激活sheet1
$ws1.activate()

Start-Sleep 1

# 激活 sheet 2
$ws2.activate()

Start-Sleep 1

# 激活 sheet 3

$ws3.activate()

#如何更改活动单元格的值？(活动单元格，也就是当前处于选中状态，我们可以对其进行操作的单元格)
$xl.ActiveCell.Value2 = "x"


#如何更改某个具体单元格的值?
$xl.activesheet.cells.item(2,1).value2=”y”

$xl.cells.item(2,1).value2=”y”

$xl.ActiveSheet.Range("B1").Value2 = "y"

#如何获得excel文档的名称?
$wb.Name
$xl.activeWorkBook.name

#如何通过行号，列号来枚举相应的所有单元格的值?
$xl = new-object -comobject excel.application
$xl.Visible = $true
$wb = $xl.Workbooks.Add()
$ws = $wb.Worksheets.Item(1)

#设置前11行，每行第一个单元格的值为1–〉11
for ($row = 1; $row -lt 11; $row++)
{
    $ws.Cells.Item($row,1) = $row

}

#如何列举某个文件夹下的所有文件，然后把列表导入Excel?
$xl = new-object -comobject excel.application
$xl.Visible = $true
$wb = $xl.Workbooks.Add()
$ws = $wb.Worksheets.Item(1)

$row = 1
#获取当前文件夹下的所有文件以及文件夹对象
$s = dir

$s | foreach -process `
{ `
    #输出每个文件或者文件夹的名称到Excel
    $ws.Cells.Item($row,1) = $_; `
    $row++ `

}

#获取当前的系统进程列表然后输出到Excel?
# 下面函数用来释放Excel的应用程序的对象，否则你使用Excel对象的quit()方法
# 之后，虽然关闭了Excel的界面窗口，但是 相应的Excel进程还在进程列表里
# 面，而且没有释放其占有的内存和资源，使用下面函数将释放Com对象，并
# 且调用.net的垃圾收集器进行资源回收。以 后的office Powershell中会经常使
# 用该函数用来释放office的application 对象。

function Release-Ref ($ref) {
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($ref)
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

}

# —————————————————–

$xl = New-Object -comobject Excel.Application

$xl.Visible = $True

$wb = $xl.Workbooks.Add()
$ws = $wb.Worksheets.Item(1)
$range = $ws.Cells.Item(1,1)

$row = 1
# 获取进程列表，并且获取进程名称
$s = Get-Process | Select-Object name
$s | foreach -process {
    $range = $ws.Cells.Item($row,1);
    $range.value2 = $_.Name;
    $row++ }

# 下面这句用来关闭office中的一些提示确认框，否则会弹出一些对话框让你确认
$xl.DisplayAlerts = $False
#使用excel应用程序的Saveas来保存更改后的文档
$wb.SaveAs("C:\Scripts\Get_Process.xls")

# 注销释放$range对象
Release-Ref $range
# powershell的官方blog上多加了一步操作，也就是remove-variable $range,以
# 前以为没有什么作用，后面发现如果不执行该项操作，该变量名称会停留
# 在variable:\下面，如果执行dir variable:\ 会报错误

remove-variable $range
Release-Ref $ws
remove-variable $ws
Release-Ref $wb
remove-variable $wb
$xl.Quit()
Release-Ref $xl
remove-variable $xl


#***如果是针对远程计算机操作，尝试下面的，当然首先你需要配置Wsman
$strComputer = (remote machine name)
$P = gwmi win32_process -comp $strComputer

#如何打开一个Excel 文件?
#an existing Workbook
$xl.Workbooks.Open("C:\Scripts\ado_object_model.xls")


#如何创建一个新的Excel文件 workbook?
$xl = new-object -comobject excel.application
$xl.Visible = $true
$wb = $xl.Workbooks.Add()
$xl.ActiveCell.Value2 = "x"
$xl.ActiveSheet.Range("B1").Value2 = "y"

#如何到处Powershell的命令输入历史到 Excel?
function Release-Ref ($ref) {

([System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComOb­ject]
$ref) -gt 0)
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

}

# —————————————————–

$xl = New-Object -comobject Excel.Application

$xl.Visible = $True

$wb = $excel.Workbooks.Add()
$ws = $workbook.Worksheets.Item(1)
$range = $worksheet.Cells.Item(1,1)

$row = 1
$s = Get-History | foreach -process { `
$range = $worksheet.Cells.Item($row,1); `
#下面的Value2可以输入字符串，否则你用value属性会报错。
$range.value2 = $_.CommandLine; `
$row++ }

$xl.DisplayAlerts = $False
$wb.SaveAs("C:\Scripts\Get_CommandLine.xls")

Release-Ref $range

Release-Ref $ws

Release-Ref $wb

$xl.Quit()

Release-Ref $xl

#如何转换"~" 分隔的文本文件到Microsoft Excel

# Script name: ConvertTilde.ps1
# Created on: 2007-01-06
# Author: Kent Finkle
# Purpose: How Can I Convert a Tilde-Delimited File to Microsoft Excel
Format?

$s = gc C:\Scripts\Test.txt
# 先把~替换成Tab制表符，然后使用Excel打开它，其实我觉得这里使
# 用import-csv 然后加上一个分隔符的参数然后导出CSV 再用excel打开也可以
$s = $s -replace("~","`t")
$s | sc C:\Scripts\Test.txt
$xl = new-object -comobject excel.application
$xl.Visible = $true
$wb = $xl.Workbooks.Open("C:\Scripts\Test.txt")

#如何为Excel 工作薄设置数据有效性验证
$comments = @’
Script name: Add-Validation.ps1
Created on: Wednesday, September 19, 2007
Author: Kent Finkle
Purpose: How can I use Windows Powershell to Add Validation to an
Excel Worksheet?
‘@

#—————————————————–
function Release-Ref ($ref) {
([System.Runtime.InteropServices.Marshal]::ReleaseComObject(
[System.__ComObject]$ref) -gt 0)
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

}

#—————————————————–

$xlValidateWholeNumber = 1
$xlValidAlertStop = 1
$xlBetween = 1

$xl = new-object -comobject excel.application
$xl.Visible = $True

$wb = $xl.Workbooks.Add()
$ws = $wb.Worksheets.Item(1)
$r = $ws.Range("e5")
$r.Validation.Add($xlValidateWholeNumber, ` $xlValidAlertStop,
$xlBetween, "5", "10") $r.Validation.InputTitle = "Integers"
$r.Validation.ErrorTitle = "Integers"
$r.Validation.InputMessage = "Enter an integer from five to ten"
$r.Validation.ErrorMessage = "You must enter a number from five to
ten"

$a = Release-Ref $r
$a = Release-Ref $ws
$a = Release-Ref $wb
$a = Release-Ref $xl

#添加图表到 Excel 工作薄
$xrow = 1
$yrow = 8
$xl = New-Object -c excel.application
$xl.visible = $true
$wb = $xl.workbooks.add()
$sh = $wb.sheets.item(1)
1..8 | % { $sh.Cells.Item(1,$_) = $_ }
1..8 | % { $sh.Cells.Item(2,$_) = 9-$_ }
$range = $sh.range("a${xrow}:h$yrow")
$range.activate
# create and assign the chart to a variable
$ch = $xl.charts.add()
$ch.chartType = 58
$ch.setSourceData($range)
$ch.export("C:\test.jpg")
$xl.quit()

# excel has 48 chart styles, you can cycle through all
1..48 | % {$ch.chartStyle = $_; $xl.speech.speak("Style $_"); sleep 1}
$ch.chartStyle = 27      

#对Excel 工作薄的某一列进行排序
$xlSummaryAbove = 0
$xlSortValues = $xlPinYin = 1
$xlAscending = 1
$xlDescending = 2

# one-column sort –> works
[void]$range1.sort($range2, $xlAscending)
[void]$range1.sort($range3, $xlAscending)
# two-column sort –> doesn’t sort both columns
# the 4th arg [xlSortType] gives problems so pass $null or ”,
# it may be for PivotTables only
[void]$range1.sort($range2, $xlAscending, $range3, ”, $xlAscending)

#对Excel的某一列进行汇总
	$xlSum = -4157
	
	$range = $xl.range("A1:D6")
	$range.Subtotal(1,-4157,(2,3,4),$true,$false,$true)
	#     Selection.Subtotal GroupBy:=1, Function:=xlSum, TotalList:=Array(4), _
	#     Replace:=True, PageBreaks:=False, SummaryBelowData:=True


#怎样使用 xlConstants
$xlAutomatic=-4105
$xlBottom = -4107
$xlCenter = -4108
$xlContext = -5002
$xlContinuous=1
$xlDiagonalDown=5
$xlDiagonalUp=6
$xlEdgeBottom=9
$xlEdgeLeft=7
$xlEdgeRight=10
$xlEdgeTop=8
$xlInsideHorizontal=12
$xlInsideVertical=11
$xlNone=-4142
$xlThin=2

$xl = new-object -com excel.application
$xl.visible=$true
$wb = $xl.workbooks.open("d:\book1.xls")
$ws = $wb.worksheets | where {$_.name -eq "sheet1"}
$selection = $ws.range("A1:D1")
$selection.select()

$selection.HorizontalAlignment = $xlCenter
$selection.VerticalAlignment = $xlBottom
$selection.WrapText = $false
$selection.Orientation = 0
$selection.AddIndent = $false
$selection.IndentLevel = 0
$selection.ShrinkToFit = $false
$selection.ReadingOrder = $xlContext
$selection.MergeCells = $false
$selection.Borders.Item($xlInsideHorizontal).Weight = $xlThin

#excel 的自动填充功能在powershell中的使用
$xlFillWeekdays = 6

$xl = new-object -com excel.application
$xl.visible=$true
$wb = $xl.workbooks.add()
$ws = $wb.worksheets | where {$_.name -eq "sheet1"}
$range1= $ws.range("A1")
$range1.value() = (get-date).toString("d")
$range2 = $ws.range("A1:A25")
$range1.AutoFill($range2,$xlFillWeekdays)
$range1.entireColumn.Autofit()
# $wb.close()
# $xl.quit()


#获得Excel的某个选取范围
# get-excelrange.ps1
# opens an existing workbook in Excel 2007, using PowerShell
# and turns a range bold # Thomas Lee – t…@psp.co.uk
# Create base object
$xl = new-object -comobject Excel.Application

# make Excel visible
$xl.visible = $true

# open a workbook
$wb = $xl.workbooks.open("C:\Scripts\test.xls")

# Get sheet1
$ws = $wb.worksheets | where {$_.name -eq "sheet1"}

# Make A1-B1 bold
$range = $ws.range("A1:B1")
$range.font.bold = "true"

# Make A2-B2 italic
$range2 = $ws.range("A2:B2")
$range2.font.italic = "true"

# Set range to a value
$range3=$ws.range("A2:B2")
$Range3.font.size=24

# now format an entire row
$range4=$ws.range("3:3")
$range4.cells="Row 3"
$range4.font.italic="$true"
$range4.font.bold=$True
$range4.font.size=10
$range4.font.name="comic Sans MS"

# now format a Range of cells

$ws.Range("D1:F5").NumberFormat = "#,##0.00"

#向Excel 单元格添加注释(Comment)
$xll = New-Object -com Excel.Application
$xl.visible = $True
$wb = $xl.Workbooks.Add()
$ws = $wb.Worksheets.Item(1)
$ws.Cells.Item(1,1) = “A value in cell A1.”
[void]$ws.Range("A1").AddComment()
[void]$ws.Range("A1").comment.Visible = $False
[void]$ws.Range("A1").Comment.text("OldDog: `r this is a comment")
[void]$ws.Range("A2").Select


#如何进行选择性复制和粘贴？
$xlPasteValues = -4163 
$xlCellTypeLastCell = 11 

$used = $ws.usedRange
$lastCell = $used.SpecialCells($xlCellTypeLastCell)
$row = $lastCell.row

$range = $ws.UsedRange
[void]$ws.Range("A8:F$row").Copy()
[void]$ws.Range("A8").PasteSpecial(-4163)




