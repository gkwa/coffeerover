# powershell:
New-Item -Type "directory" -Force -Path ~/Documents/WindowsPowershell | Out-Null
@"
Set-Location ~
"@ | Out-File -Append -Encoding ASCII $profile
. $profile


New-Item -Type "directory" -Force -Path ~/Documents/PowerShell | Out-Null

# powershell:
New-Item -Type "directory" -Force -Path ~/Documents/WindowsPowershell | Out-Null
@"
Set-Location ~
"@ | Out-File -Append -Encoding ASCII $profile
. $profile
