lib=$1

cd "$lib" || exit

flutter pub upgrade
flutter pub upgrade --major-versions
flutter pub get