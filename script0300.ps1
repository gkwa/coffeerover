$ParentDirectory = "$HOME\Documents\links"
$TargetDirectory = "C:\ProgramData\Amazon\EC2Launch\log"

# Create parent directory if it doesn't exist
if (!(Test-Path -Path $ParentDirectory)) {
    New-Item -ItemType Directory -Path $ParentDirectory -Force
}

# Create the symbolic link
New-Item -ItemType SymbolicLink -Path "$ParentDirectory\ec2launch" -Target $TargetDirectory
