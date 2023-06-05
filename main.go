package main

import (
	"embed"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"sort"
	"strings"
)

//go:embed *.ps1 taskfile.yaml
var scriptFiles embed.FS

func main() {
	// Get the value of the USERPROFILE environment variable
	userProfile := os.Getenv("USERPROFILE")

	// Append the Documents/Scripts path
	scriptsPath := filepath.Join(userProfile, "Documents", "Scripts")

	// Create an absolute path
	absolutePath, err := filepath.Abs(scriptsPath)
	if err != nil {
		fmt.Printf("Error creating absolute path: %s\n", err.Error())
		return
	}

	fmt.Println("Absolute path:", absolutePath)

	os.MkdirAll(absolutePath, os.ModePerm)

	// Deploy all script files matching the pattern to the destination folder
	err = deployScripts("*.ps1", scriptsPath)
	if err != nil {
		panic(err)
	}

	// Run PowerShell with the deployed scripts
	err = runDeployedScripts(scriptsPath)
	if err != nil {
		panic(err)
	}
}

func deployScripts(pattern, destDir string) error {
	matches, err := fs.Glob(scriptFiles, pattern)
	if err != nil {
		return err
	}

	for _, match := range matches {
		scriptContent, err := fs.ReadFile(scriptFiles, match)
		if err != nil {
			return err
		}

		scriptName := filepath.Base(match)
		destPath := filepath.Join(destDir, scriptName)

		err = writeFile(destPath, scriptContent)
		if err != nil {
			return err
		}
	}

	return nil
}

func runDeployedScripts(destDir string) error {
	files, err := os.ReadDir(destDir)
	if err != nil {
		return err
	}

	// Sort files by name
	sort.Slice(files, func(i, j int) bool {
		return files[i].Name() < files[j].Name()
	})

	for _, file := range files {
		if isRegularFile(file) && strings.HasSuffix(file.Name(), ".ps1") {
			scriptPath := filepath.Join(destDir, file.Name())
			if runtime.GOOS == "windows" {
				err := runPowerShellScript(scriptPath)
				if err != nil {
					// handle the error
				}
			}
		}
	}

	return nil
}

func isRegularFile(file os.DirEntry) bool {
	info, err := file.Info()
	if err != nil {
		return false
	}
	return info.Mode().IsRegular()
}

func runPowerShellScript(scriptPath string) error {
	// Run PowerShell with the specified script
	cmd := exec.Command("powershell", "-ExecutionPolicy", "Bypass", "-File", scriptPath)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		return err
	}

	return nil
}

func writeFile(filePath string, content []byte) error {
	file, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer file.Close()

	_, err = file.Write(content)
	if err != nil {
		return err
	}

	return nil
}
