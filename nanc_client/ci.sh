BN="$1"

if [ "$BN" = "" ]; then
    echo "Not found build number argument!"
    exit;
fi

echo "Build and release app v$BN"

#flutter clean
#flutter pub get
#flutter pub run build_runner build --delete-conflicting-outputs

#flutter build web \
#--no-pub \
#--build-number="$BN" \
#--dart2js-optimization=O4 \
#--dart-define=SUPA_HOST="$NANC_SUPA_HOST" \
#--dart-define=SUPA_KEY="$NANC_SUPA_KEY" \
#--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE" \
#--web-renderer=canvaskit

#flutter build apk \
#--no-pub \
#--build-number "$BN" \
#--target-platform="android-arm64" \
#--dart-define=SUPA_HOST="$NANC_SUPA_HOST" \
#--dart-define=SUPA_KEY="$NANC_SUPA_KEY" \
#--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE" \

# ? Copy Web build
#cp -R ./build/web/ "$NANC_CLIENT_REPO"
#cd "$NANC_CLIENT_REPO"
#git add .
#git commit -m "nanc client release"
#git push

# ? Copy Android build
mv ./build/app/outputs/flutter-apk/app-release.apk "$APPS_BUILDS_DIR/nanc_client_installer_v$BN.apk"
echo "Job done!"