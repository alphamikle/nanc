#!/bin/bash

get_deps() {
  local dir=$1
  # Change to the directory
  cd "$dir" || exit

  # Check if 'pubspec.yaml' exists
  if [ -f pubspec.yaml ]; then
    flutter pub get
  fi

  # Change back to the parent directory
  cd ..
}

# If an argument is provided, use it as the directory, otherwise use the current directory and loop through subdirectories
if [ "$1" ]; then
  get_deps "$1"
else
  DIRS="*/"
  # Loop over the specified directories
  for dir in $DIRS; do
    get_deps "$dir"
  done
fi
