#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "================================================="
echo "--------------- starting deploy to GitHub Pages.."
echo "================================================="
echo

# where..
rm -rf out || exit 0;
mkdir out
cd out

# what..
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git .

# modify..
echo "" >> README.md
echo "#### Travis CI (build $TRAVIS_BUILD_NUMBER)" >> README.md
git add README.md
git commit --message "Update GitHub Pages."

# send..
git push --force --quiet "https://$GITHUB_TOKEN_2@github.com/djohn7504/lab-ci"
