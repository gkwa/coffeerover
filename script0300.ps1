$ParentDirectory = "$HOME\Documents\links"
$SymlinkObjects = @(
    @{
        TargetDirectory = "C:\ProgramData\Amazon\EC2Launch\log"
        SymlinkPath = "$ParentDirectory\ec2launch"
    },
    @{
        TargetDirectory = "C:\Windows\Temp"
        SymlinkPath = "$ParentDirectory\temp"
    },
    @{
        TargetDirectory = "C:\Program Files"
        SymlinkPath = "$ParentDirectory\Program Files"
    },
    @{
        TargetDirectory = "C:"
        SymlinkPath = "$ParentDirectory\C"
    },
    @{
        TargetDirectory = "C:\Program Files (x86)"
        SymlinkPath = "$ParentDirectory\Program Files (x86)"
    },
    @{
        TargetDirectory = $env:USERPROFILE
        SymlinkPath = "$ParentDirectory\USERPROFILE"
    },
    @{
        TargetDirectory = $env:APPDATA
        SymlinkPath = "$ParentDirectory\appdata"
    },
    @{
        TargetDirectory = "C:\ProgramData"
        SymlinkPath = "$ParentDirectory\ProgramData"
    },

    
    @{
        TargetDirectory = "C:\Windows\system32\config\systemprofile\AppData\Local\Temp"
        SymlinkPath = "$ParentDirectory\SystemProfileTemp"
    },

    @{
        TargetDirectory = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu"
        SymlinkPath = "$ParentDirectory\Start Menu"
    }
)

# Create parent directory if it doesn't exist
if (!(Test-Path -Path $ParentDirectory)) {
    New-Item -ItemType Directory -Path $ParentDirectory -Force
}

foreach ($object in $SymlinkObjects) {
    $TargetDirectory = $object.TargetDirectory
    $SymlinkPath = $object.SymlinkPath

    # Check if symlink already exists
    if (!(Test-Path -Path $SymlinkPath)) {
        # Create the symbolic link
        New-Item -ItemType SymbolicLink -Path $SymlinkPath -Target $TargetDirectory
    }
}