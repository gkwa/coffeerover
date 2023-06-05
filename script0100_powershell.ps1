# powershell:
New-Item -Type "directory" -Force -Path ~/Documents/WindowsPowershell | Out-Null

$filePath = "$env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"
$lineToAppend = ". $env:USERPROFILE\Documents\scripts\general.ps1"
if (-not (Select-String -Path $filePath  -SimpleMatch -Pattern $lineToAppend)) {
    Write-Host "The line is not present in the file. Appending..."
    Add-Content -Path $filePath -Value $lineToAppend
}
