Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force

Install-ChocolateyShortcut `
  -Arguments '-NoProfile -NoLogo -Command "shutdown -t 30 -s"' `
  -PinToTaskbar `
  -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0" `
  -TargetPath "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe" `
  -IconLocation "$env:USERPROFILE\Documents\Scripts\17902_power_shutdown_icon.ico" `
  -ShortcutFilePath "$env:USERPROFILE\\Documents\Scripts\shutdown_now.lnk" `
  -WindowStyle 0

Install-ChocolateyShortcut `
  -Arguments '-NoProfile -NoLogo -Command "shutdown -t 0 -r"' `
  -PinToTaskbar `
  -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0" `
  -TargetPath "C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe" `
  -IconLocation "$env:USERPROFILE\Documents\Scripts\Dakirby309-Windows-8-Metro-Other-Power-Restart-Metro.256.ico" `
  -ShortcutFilePath "$env:USERPROFILE\Documents\Scripts\reboot_now.lnk" `
  -WindowStyle 0
