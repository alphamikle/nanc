#!/bin/bash

# Loop over all directories in the current directory (non-recursively)
for dir in */ ; do
    # Change to the directory
    cd "$dir" || exit

    # Check if 'pubspec.yaml' exists
    if [ -f pubspec.yaml ] ; then
        # Check if 'pubspec.yaml' contains 'flutter_gen'
        if grep -q 'flutter_gen' pubspec.yaml ; then
            # If 'build_runner' is found, run the specified command
            echo "Running 'fluttergen' in $dir"
            fluttergen
        fi
    fi

    # Change back to the parent directory
    cd ..
done
