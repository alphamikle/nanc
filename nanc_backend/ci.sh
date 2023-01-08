flutter build web \
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