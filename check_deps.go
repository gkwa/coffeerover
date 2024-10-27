package main

import (
	"fmt"
	"log"
	"os"
	"io"
	"gopkg.in/yaml.v3"
)

type Taskfile struct {
	Version string            `yaml:"version"`
	Tasks   map[string]Task   `yaml:"tasks"`
}

type Task struct {
	Deps   []string `yaml:"deps"`
	Cmds   []string `yaml:"cmds"`
	Status []string `yaml:"status"`
}

func main() {
	// Open the YAML file
	file, err := os.Open("taskfile.yaml")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Read the YAML content
	yamlContent, err := io.ReadAll(file)
	if err != nil {
		log.Fatal(err)
	}

	// Parse the YAML
	var taskfile Taskfile
	err = yaml.Unmarshal(yamlContent, &taskfile)
	if err != nil {
		log.Fatal(err)
	}

	// Get the list of all tasks
	allTasks := taskfile.Tasks

	// Initialize a set to store tasks with dependencies
	tasksWithDeps := make(map[string]bool)

	// Iterate over each task and check for dependencies
	for _, task := range allTasks {
		for _, dependency := range task.Deps {
			tasksWithDeps[dependency] = true
		}
	}

	// Get the tasks that are not listed as dependencies
	tasksWithoutDeps := make([]string, 0)
	for task := range allTasks {
		if !tasksWithDeps[task] && task != "default" {
			tasksWithoutDeps = append(tasksWithoutDeps, task)
		}
	}

	// Print the tasks without dependencies
	fmt.Println("Tasks without dependencies:")
	for _, task := range tasksWithoutDeps {
		fmt.Println(task)
	}
}
