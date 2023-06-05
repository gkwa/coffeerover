$filePath = "$env:USERPROFILE\.gitconfig"
$maxAge = (Get-Date).AddDays(-1)

$file = Get-Item -Path $filePath -ErrorAction SilentlyContinue

if ($file -eq $null -or $file.LastWriteTime -lt $maxAge) {
    Invoke-WebRequest -OutFile $filePath -Uri "https://raw.githubusercontent.com/TaylorMonacelli/dotfiles/master/.gitconfig"
}

$filePath = "$env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"
$lineToAppend = ". $env:USERPROFILE\Documents\scripts\script0250_git.ps1"
if (-not (Select-String -Path $filePath  -SimpleMatch -Pattern $lineToAppend)) {
    Write-Host "The line is not present in the file. Appending..."
    Add-Content -Path $filePath -Value $lineToAppend
}
