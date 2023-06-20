#!/bin/bash

# Function to display usage
function usage {
    echo "Usage: $0 -v version"
    exit 1
}

# Parse command line options.
while getopts v: option
do
    case "${option}"
    in
    v) VERSION=${OPTARG};;
    *) usage;;
    esac
done

# Check if version is not empty
if [ -z "$VERSION" ]
then
    echo "Version not specified. Use -v to specify the version."
    exit 1
fi

# Check if version is in correct format
if ! [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
then
    echo "Invalid version format. Correct format is x.x.x"
    exit 1
fi

# Iterate over directories and perform replacement
for d in */ ; do
    if [ -f "${d}pubspec.yaml" ]; then
        sed -i.bak "s/^version: .*/version: $VERSION/" "${d}pubspec.yaml"
        rm "${d}pubspec.yaml.bak" # remove the backup file
    fi
done
