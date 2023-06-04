<#

https://github.com/DanysysTeam/PS-SFTA

Get-Help $script -full

$assoc.GetEnumerator() | ForEach-Object {"$($_.Key) - $($_.Value)"}

powershell loop over keys of hash

$foods | ForEach-Object { $_ }
#>


$base = (Get-Item $MyInvocation.MyCommand.Path).Basename
$dir = Split-Path -Parent -Path $MyInvocation.MyCommand.Path
$log_path = Join-Path $dir "logs_$($env:USERNAME)" | Join-Path -ChildPath "$($base).log"
New-Item -Force -Type "directory" (Split-Path -Parent -Path $log_path) | Out-Null
Start-Transcript -Path $log_path

# Set-PSdebug -Trace 1

$url = [System.Uri]'https://raw.githubusercontent.com/DanysysTeam/PS-SFTA/master/SFTA.ps1'
$packageName = Split-Path -Leaf -Path $url.AbsolutePath

$basedir = Split-Path -Parent $PROFILE
New-Item -Force -type "directory" $basedir | Out-Null

$script = Join-Path $basedir $packageName

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
