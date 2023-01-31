cd ..
dart ./release.dart -c
cd ./nanc_client

version="$(grep 'version: [0-9]' ./pubspec.yaml | sed 's/version: [0-9].[0-9].[0-9]+//')"
name="nanc_client_installer_v${version}"

echo "Build $name"

cp "$NANC_DEMO_PAGE_DATA/landing_page.json" ./web/page_data.json || exit
cp "$NANC_DEMO_PAGE_DATA/landing_page.json" ./assets/page_data.json || exit
cp ../cms/web/amplitude.js ./web/amplitude.js || exit

flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter build web \
--no-pub \
--web-renderer canvaskit \
--dart2js-optimization=O1 \
--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE" \
--dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
--dart-define=ANALYTICS_PROJECT=client_web \
--no-tree-shake-icons \

flutter build apk \
--no-pub \
--target-platform="android-arm64" \
--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE" \

flutter build appbundle \
--no-pub \
--target-platform="android-arm64" \
--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE" \
--dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
--dart-define=ANALYTICS_PROJECT=client_android \

# ? Copy Android build
mv ./build/app/outputs/flutter-apk/app-release.apk "$APPS_BUILDS_DIR/$name.apk"
mv ./build/app/outputs/bundle/release/app-release.aab "$APPS_BUILDS_DIR/nanc_client_bundle_v${version}.aab"

# ? Copy Web build
# cp -R ./build/web/ "$NANC_CLIENT_REPO" && cd "$NANC_CLIENT_REPO" && git add . && git commit -m "nanc client release" && git push
cp -R ./build/web/ "$NANC_CLIENT_REPO"
cd "$NANC_CLIENT_REPO"
git add .
git commit -m "nanc client release"
git push

echo "Job done!"