lib=$1
curPath="$(pwd)"
cd "$lib" || exit

function printStage() {
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "STARTING $1 STAGE FOR \"$lib\""
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
}

printStage "REINSTALL DEPENDENCIES"
bash "$curPath/get.sh" "$curPath/$1" || exit

if grep -q "build_runner" "./pubspec.yaml"; then
  printStage "BUILD RUNNER"
  flutter pub run build_runner clean
  flutter pub run build_runner build --delete-conflicting-outputs || exit
fi