#!/bin/bash

if [[ ! -f LICENSE ]]; then
    echo "LICENSE file not found"
    exit 1
fi

for dir in */; do
    if [[ -f "${dir}pubspec.yaml" ]]; then
        cp LICENSE "${dir}"
        echo "LICENSE was copied to ${dir}"
    fi
done

echo "Done"
