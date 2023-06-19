#!/bin/bash

# Default path to the folder with scripts
SCRIPT_DIR="./\$scripts"

# Parse named arguments
while getopts d: flag
do
    # shellcheck disable=SC2220
    case "${flag}" in
        d) SCRIPT_DIR=${OPTARG};;
    esac
done

# Shift past the named parameters to the remaining arguments
shift $((OPTIND -1))

# Substring to search in file names
SUBSTRING=$1

# Remaining arguments to pass to the script
shift

# Flag indicating whether the file was found
FILE_FOUND=false

# We're going through all the files in the script folder
for SCRIPT in "$SCRIPT_DIR"/*.sh
do
  # If the filename contains a substring
  if [[ $(basename "$SCRIPT") == *"$SUBSTRING"* ]]; then
    # Run the script with all remaining arguments
    echo "Running 'bash $SCRIPT'" "$@"
    bash "$SCRIPT" "$@"
    # We set the flag to true, indicating that the file was found
    FILE_FOUND=true
    # We exit the loop after finding and running the first script
    break
  fi
done

# If the file was not found, display an error message
if [ "$FILE_FOUND" = false ]; then
  echo "No script found containing substring: $SUBSTRING"
fi
