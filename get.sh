lib=$1
cd "$lib" || exit

rm ./pubspec.lock
flutter clean
flutter pub get