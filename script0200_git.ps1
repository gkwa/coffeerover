Invoke-WebRequest -OutFile $env:USERPROFILE/.gitconfig -Uri https://raw.githubusercontent.com/TaylorMonacelli/dotfiles/master/.gitconfig
. $profile

$filePath = "$env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"
$lineToAppend = ". $env:USERPROFILE\Documents\scripts\script0250_git.ps1"
if (-not (Select-String -Path $filePath  -SimpleMatch -Pattern $lineToAppend)) {
    Write-Host "The line is not present in the file. Appending..."
    Add-Content -Path $filePath -Value $lineToAppend
}
else {
    # Line found in the file
    Write-Host "The line is already present in the file."
}