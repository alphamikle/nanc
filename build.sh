lib=$1
cd "$lib" || exit

function printStage() {
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "STARTING $1 STAGE FOR \"$lib\""
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
}

printStage "CLEANING"
flutter clean || exit

rm ./pubspec.lock

printStage "PUB GET"
flutter pub get || exit

if grep -q "build_runner" "./pubspec.yaml"; then
  printStage "BUILD RUNNER"
  flutter pub run build_runner build --delete-conflicting-outputs || exit
fi