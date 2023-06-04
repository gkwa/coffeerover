<#

https://github.com/DanysysTeam/PS-SFTA

Get-Help $script -full

$assoc.GetEnumerator() | ForEach-Object {"$($_.Key) - $($_.Value)"}

powershell loop over keys of hash

$foods | ForEach-Object { $_ }
#>

$url = [System.Uri]'https://raw.githubusercontent.com/DanysysTeam/PS-SFTA/master/SFTA.ps1'
$packageName = Split-Path -Leaf -Path $url.AbsolutePath

If(!(Test-Path($script))){ Invoke-WebRequest -UseBasicParsing $url -OutFile $script }
. $script

$assoc = @{
    '.py' = 'VSCode.py'
    '.conf' = 'VSCode.py'
    '.log' = 'VSCode.py'
    '.au3' = 'VSCode.py'
    '.ps1' = 'VSCode.py'
    '.vbs' = 'VSCode.py'
    '.ini' = 'VSCode.py'
}

$assoc.GetEnumerator() | ForEach-Object {
    Set-FTA $_.Value $_.Key
    "$($_.Key) - $($_.Value)"
}
