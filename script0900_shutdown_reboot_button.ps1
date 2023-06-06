Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force

$scriptsPath = Join-Path -Path $env:USERPROFILE\Documents -ChildPath "Scripts"

if (-not (Test-Path $scriptsPath)) {
    New-Item -Path $scriptsPath -ItemType Directory | Out-Null
}

Install-ChocolateyShortcut `
  -Arguments '-NoLogo' `
  -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0" `
  -TargetPath "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe" `
  -ShortcutFilePath "$scriptsPath\powershell -NoLogo.lnk" `

Install-ChocolateyShortcut `
  -Arguments '-NoProfile -NoLogo -Command "shutdown -t 30 -s"' `
  -PinToTaskbar `
  -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0" `
  -TargetPath "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe" `
  -IconLocation "$env:USERPROFILE\Documents\Scripts\17902_power_shutdown_icon.ico" `
  -ShortcutFilePath "$scriptsPath\shutdown_now.lnk" `
  -WindowStyle 0

Install-ChocolateyShortcut `
  -Arguments '-NoProfile -NoLogo -Command "shutdown -t 0 -r"' `
  -PinToTaskbar `
  -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0" `
  -TargetPath "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe" `
  -IconLocation "$env:USERPROFILE\Documents\Scripts\Dakirby309-Windows-8-Metro-Other-Power-Restart-Metro.256.ico" `
  -ShortcutFilePath "$scriptsPath\reboot_now.lnk" `
  -WindowStyle 0
