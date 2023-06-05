import yaml

# Load the YAML content from the file
with open("taskfile.yaml", "r") as file:
    yaml_content = file.read()

data = yaml.safe_load(yaml_content)

# Get the list of all tasks
all_tasks = data["tasks"]

# Initialize a set to store tasks with dependencies
tasks_with_deps = set()

# Iterate over each task and check for dependencies
for task_name, task_data in all_tasks.items():
    if "deps" in task_data:
        for dependency in task_data["deps"]:
            tasks_with_deps.add(dependency)

# Get the tasks that are not listed as dependencies
tasks_without_deps = set(all_tasks.keys()) - tasks_with_deps - {"default"}

# Print the tasks without dependencies
print("Tasks without dependencies:")
for task in tasks_without_deps:
    print(task)
