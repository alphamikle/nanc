#!/bin/bash

# Install flutter_gen globally
dart pub global activate flutter_gen

init_package() {
  local dir=$1
  # Change to the directory
  cd "$dir" || exit

  # Check if 'pubspec.yaml' exists
  if [ -f pubspec.yaml ]; then

    # Cleaning flutter
    flutter clean

    if [ -f "pubspec.lock" ]; then
      rm "pubspec.lock"
    fi

    # ios
    if [ -d "ios/.symlinks" ]; then
      rm -rf "ios/.symlinks"
    fi

    if [ -d "ios/Pods" ]; then
      rm -rf "ios/Pods"
    fi

    if [ -f "ios/Podfile.lock" ]; then
      rm "ios/Podfile.lock"
    fi

    # macos
    if [ -d "macos/.symlinks" ]; then
      rm -rf "macos/.symlinks"
    fi

    if [ -d "macos/Pods" ]; then
      rm -rf "macos/Pods"
    fi

    if [ -f "macos/Podfile.lock" ]; then
      rm "macos/Podfile.lock"
    fi


    # Run 'flutter pub get' command
    echo "Running 'flutter pub get' in $dir"
    flutter pub get || exit

    if [ -d "ios" ]; then
      cd "ios" || exit
      pod repo update || echo "Not found pod command"
      pod install || echo "Not found pod command"
      cd ..
    fi

    if [ -d "macos" ]; then
      cd "macos" || exit
      pod repo update || echo "Not found pod command"
      pod install || echo "Not found pod command"
      cd ..
    fi

    # Check if 'pubspec.yaml' contains 'build_runner'
    if grep -q 'build_runner' pubspec.yaml; then
      # If 'build_runner' is found, run the specified command
      echo "Running 'dart run build_runner build --delete-conflicting-outputs' in $dir"
      dart run build_runner build --delete-conflicting-outputs
    fi

    # Check if 'pubspec.yaml' contains 'flutter_gen'
    if grep -q 'flutter_gen' pubspec.yaml; then
      # If 'flutter_gen' is found, run the specified command
      echo "Running 'fluttergen' in $dir"
      fluttergen
    fi
  fi

  # Change back to the parent directory
  cd ..
}

# If an argument is provided, use it as the directory, otherwise use the current directory and loop through subdirectories
if [ "$1" ]; then
  init_package "$1"
else
  DIRS="*/"
  # Loop over the specified directories
  for dir in $DIRS; do
    init_package "$dir"
  done
fi
