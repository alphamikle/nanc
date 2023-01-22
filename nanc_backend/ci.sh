cd ..
dart ./release.dart -b
cd ./nanc_backend

cp -R "$NANC_DEMO_PAGE_DATA/" ./assets
rm -rf ./assets/auth
rm ./assets/dynamic_box.hive
rm ./assets/dynamic_box.lock

flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter build web \
--no-pub \
--web-renderer canvaskit \
--dart2js-optimization=O4 \
--dart-define=SUPA_HOST="$NANC_SUPA_HOST" \
--dart-define=SUPA_KEY="$NANC_SUPA_KEY" \
--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE"

cp -R ./build/web/ "$NANC_ADMIN_REPO"
cd "$NANC_ADMIN_REPO"
git add .
git commit -m "nanc admin release"
git push
echo "Job done!"