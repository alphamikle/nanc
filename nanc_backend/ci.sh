# flutter build web
cp -R ./build/web/ "$NANC_ADMIN_REPO"
cd "$NANC_ADMIN_REPO"
git add .
git commit -m "nanc admin release"
git push
echo "Job done!"