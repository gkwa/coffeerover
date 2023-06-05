$filePath = "$env:USERPROFILE\.gitconfig"
$maxAge = (Get-Date).AddDays(-1)

$file = Get-Item -Path $filePath -ErrorAction SilentlyContinue

if ($file -eq $null -or $file.LastWriteTime -lt $maxAge) {
    Invoke-WebRequest -OutFile $filePath -Uri "https://raw.githubusercontent.com/TaylorMonacelli/dotfiles/master/.gitconfig"
}

$parts = @(
       "Powershell"
       "WindowsPowershell"
)

foreach ($part in $parts) {
    $filePath = "$env:USERPROFILE\Documents\$part\Microsoft.PowerShell_profile.ps1"
    $lineToAppend = ". $env:USERPROFILE\Documents\scripts\script0250_git.ps1"
    if (-not (Select-String -Path $filePath -SimpleMatch -Pattern $lineToAppend)) {
        Add-Content -Path $filePath -Value $lineToAppend
    }
}
