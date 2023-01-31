cd ..
dart ./release.dart -b
cd ./nanc_backend

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
--dart-define=ANALYTICS_PROJECT=cms \

cp -R ./build/web/ "$NANC_ADMIN_REPO" || exit
cd "$NANC_ADMIN_REPO" || exit
git add .
git commit -m "nanc admin release"
git push
echo "Job done!"