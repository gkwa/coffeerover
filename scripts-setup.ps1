$scriptsDir = "$env:USERPROFILE\Documents\Scripts"

if (!(Test-Path($scriptsDir))) {
    New-Item -ItemType Directory -Path $scriptsDir | Out-Null
}

Copy-Item *.ps1 $scriptsDir
