lib=$1
cd "$lib" || exit
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs || echo "$lib package does not contain codegen"