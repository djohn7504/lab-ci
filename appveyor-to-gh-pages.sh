# where..
rm -rf out || exit 0;
mkdir out
cd out

# what..
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git .

# modify..
echo "" >> README.md
echo "#### AppVeyor CI (build $APPVEYOR_BUILD_VERSION)" >> README.md
git add README.md
git commit --message "Update GitHub Pages."

# send..
# TODO: secure it ........................................................................
GITHUB_TOKEN="b28404de4430923f8ce5f2d39868e74ea18ed18c"
git push --force --quiet "https://$GITHUB_TOKEN@github.com/djohn7504/lab-ci"
