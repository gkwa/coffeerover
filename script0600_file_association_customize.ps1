<#

https://github.com/DanysysTeam/PS-SFTA

Get-Help $script -full

$assoc.GetEnumerator() | ForEach-Object {"$($_.Key) - $($_.Value)"}

powershell loop over keys of hash

$foods | ForEach-Object { $_ }
#>

$url = [System.Uri]'https://raw.githubusercontent.com/DanysysTeam/PS-SFTA/master/SFTA.ps1'
$script = "sfta.ps1"

If(!(Test-Path($script))){ Invoke-WebRequest -UseBasicParsing $url -OutFile $script }
. ./$script

$assoc = @{
    '.py' = 'notepad.exe'
    '.tmp' = 'notepad.exe'
    '.conf' = 'notepad.exe'
    '.log' = 'notepad.exe'
    '.au3' = 'notepad.exe'
    '.ps1' = 'notepad.exe'
    '.vbs' = 'notepad.exe'
    '.ini' = 'notepad.exe'
}

$assoc.GetEnumerator() | ForEach-Object {
    Set-FTA $_.Value $_.Key
    "$($_.Key) - $($_.Value)"
}
