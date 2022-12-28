lib=$1
cd "$lib" || exit
flutter pub get
flutter pub run build_runner watch --delete-conflicting-outputs