function GetData() {
    param(
    [Parameter(Mandatory)]
    [string]
    $Path,
    [Parameter(Mandatory)]
    [string]
    $Result
    )


    process{
      Get-Content $Path | ForEach-Object {
            $_
            $keywords = @()
            $RandomNum = @()
            #url: https://data.chinaz.com/
            #search: /keyword/analysis/
            # https://data.chinaz.com/keyword/analysis/%E6%96%97%E9%B1%BC
            # https://data.chinaz.com/keyword/allindex/%E6%96%97%E9%B1%BC/1

            $url = "https://data.chinaz.com/keyword/analysis/$_"

            $web = Invoke-WebRequest -Uri $url -Method Get
            #Invoke-WebRequest -Uri $url -Method Get -OutFile tmp.txt
            #$web = Get-Content tmp.txt           
            
            #获取内容
            ([regex]"col-225.+?li>").Matches($web.content) | ForEach-Object {
                if([string]::IsNullOrEmpty($_)){
                    return
                }else {
                    $keywords += ((([regex]"<a.+?>(.+?)</a>").Matches($_)) -replace "<.+?>","") -split "\s"
                }               
            }
            $RandomNum = RandomNum -Lth $keywords.Length -Num 3

            $String = $keywords[$RandomNum[0]] +"_"+ $keywords[$RandomNum[1]] +"_"+ $keywords[$RandomNum[2]]

            Write-Host $String -BackgroundColor Red -ForegroundColor Cyan
            Write-Output $String | Out-File -Append $Result
        }
        


    }
}

function RandomNum(){
    param(
        [Parameter(Mandatory)]
        [int]
        $Num,
        [Parameter(Mandatory)]
        [int]
        $Lth
    )
    begin {
        $arr= @()
    }
    process {

        for($i=0; $i -le 10; $i++){
            $RandomNum = Get-Random -Minimum 1 -Maximum $Lth
            if($arr.Contains($RandomNum)){
                continue
            }else {
                $arr+=$RandomNum
            }

            if($arr.length -eq $Num){
                break;
            }

        }

        return $arr
    }

}

$Path = $args[0]
$Result = $args[1]
#$Path = "D:\codedata\CMD\热词查询网\search.txt"
#$Result = "D:\codedata\CMD\热词查询网\Result.txt"

GetData -Path $Path -Result $Result