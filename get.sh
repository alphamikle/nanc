lib=$1
cd "$lib" || exit

rm ./pubspec.lock
rm -rf ./macos/Pods
rm ./macos/Podfile
rm ./macos/Podfile.lock
rm -rf ./macos/Flutter/ephemeral


flutter clean
flutter pub get
cd macos
pod repo update
pod install