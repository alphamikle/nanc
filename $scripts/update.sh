#!/bin/bash

# Get the project name from the first argument (if any)
project_name="$1"

# Function to update a single project
update_project() {
  local project_path="$1"
  echo "Updating project: $project_path"
  cd "$project_path" || return 1
  
  echo "Running 'flutter pub upgrade'..."
  flutter pub upgrade
  
  echo "Running 'flutter pub upgrade --major-versions'..."
  flutter pub upgrade --major-versions
  
  echo "Running 'flutter pub get'..."
  flutter pub get
  
  echo "Update completed for: $project_path"
  echo "----------------------------------------"
}

# Find all pubspec.yaml files in the nanc directory and its subdirectories
if [ -z "$project_name" ]; then
  # If no project name provided, update all projects
  echo "No project specified. Updating all projects in nanc directory..."
  find ./nanc -name "pubspec.yaml" -type f | while read -r pubspec; do
    project_dir=$(dirname "$pubspec")
    update_project "$project_dir"
  done
else
  # If project name provided, find the first matching project
  echo "Searching for project containing: $project_name"
  matching_project=$(find ./nanc -name "pubspec.yaml" -type f -path "*$project_name*" | head -n 1)
  
  if [ -z "$matching_project" ]; then
    echo "Error: No project found containing '$project_name'"
    exit 1
  fi
  
  project_dir=$(dirname "$matching_project")
  echo "Found matching project: $project_dir"
  update_project "$project_dir"
fi