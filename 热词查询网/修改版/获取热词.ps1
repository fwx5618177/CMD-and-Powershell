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
            $RandomNum = Get-Random -Minimum 0 -Maximum $Lth
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

function GetData() {
    param(
    [Parameter(Mandatory)]
    [string]
    $Path,
    [Parameter(Mandatory)]
    [string]
    $Result,
    [Parameter(ValueFromPipeline=$true)]
    [int]
    $Pages,
    [Parameter(Mandatory)]
    [string]
    $keys
    )

    process {
            #$_
            #url: https://data.chinaz.com/
            #search: /keyword/analysis/
            # https://data.chinaz.com/keyword/analysis/%E6%96%97%E9%B1%BC
            # https://data.chinaz.com/keyword/allindex/%E6%96%97%E9%B1%BC/1

            $url = "https://data.chinaz.com/keyword/allindex/$keys/$Pages"
            $web = Invoke-WebRequest -Uri $url -Method Get     
            
            $context = ([regex]"(?s)pagedivid.+?<div>").Matches($web.content)                         
            ([regex]"col-220.+?li>").Matches($context) | ForEach-Object {
                $global:keywords += ([regex]"href.+?>(.+?)</a>").Matches($_)[0].Groups[1].value
                echo $keywords
            }
        }

}

$Path = $args[0]
$Result = $args[1]
$Pages = Invoke-Expression $args[2]
#$Path = "D:\codedata\CMD\热词查询网\修改版\search.txt"
#$Result = "D:\codedata\CMD\热词查询网\修改版\result.txt"
#$Pages = 1..5


Get-Content $Path | ForEach-Object {
    $global:keywords = @()
    $global:RandomNum = @()
    $_
    $Pages | GetData -Path $Path -Result $Result -keys $_

    Write-Host $global:keywords.Length -BackgroundColor Red
    #Write-Host $global:keywords -BackgroundColor Red

    $global:RandomNum = RandomNum -Lth $global:keywords.Length -Num 3

    $String = $global:keywords[$global:RandomNum[0]] +"_"+ $global:keywords[$global:RandomNum[1]] +"_"+ $global:keywords[$global:RandomNum[2]]

    Write-Host $String -BackgroundColor Red -ForegroundColor Cyan
    Write-Output $String | Out-File -Append $Result
}