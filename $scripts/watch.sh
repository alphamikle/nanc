#!/bin/bash

PACKAGE_PATH="$1"

if [[ "$PACKAGE_PATH" == "" ]]; then
  echo "Provide a path to package, which you want to build and watch" && exit 1
fi

cd "$PACKAGE_PATH" || exit

dart run build_runner watch --delete-conflicting-outputs
