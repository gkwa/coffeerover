$global:ProgressPreference = "SilentlyContinue"
$prop = Get-Service wuauserv | Select -Property StartType
Set-Service -Name wuauserv -StartupType Manual
Install-WindowsFeature -Name NET-Framework-Features
Set-Service -Name wuauserv -StartupType $prop.StartType
choco install wixtoolset
$wix_dir = (Get-ChildItem -Recurse C:\Program*\Wix*Toolset*\bin -Filter "heat.exe" | Select-Object -First 1).Directory.FullName
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force
Install-ChocolateyPath -PathToInstall $wix_dir
