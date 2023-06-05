$filePath = "$env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"
$lineToAppend = ". $env:USERPROFILE\Documents\scripts\general.ps1"

# Check if the file path exists
if (-not (Test-Path -Path $filePath)) {
    # Create the directory if it doesn't exist
    $directory = Split-Path -Path $filePath
    if (-not (Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory | Out-Null
    }

    # Create the file
    New-Item -ItemType File -Path $filePath | Out-Null
}

# Check if the line is present in the file
if (-not (Select-String -Path $filePath -SimpleMatch -Pattern $lineToAppend)) {
    Write-Host "The line is not present in the file. Appending..."
    Add-Content -Path $filePath -Value $lineToAppend
}
