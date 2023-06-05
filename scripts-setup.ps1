$scriptsDir = "$env:USERPROFILE\Documents\Scripts"
New-Item -ItemType Directory -Path $scriptsDir | Out-Null
Copy-Item *.ps1 $scriptsDir
