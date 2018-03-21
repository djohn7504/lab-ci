#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "================================================="
echo "------ starting deploy to GitHub Pages.. (branch)"
echo "================================================="
echo

# where..
rm -rf out || exit 0;
mkdir out
cd out

# what..
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git .

# modify..

# append..
#echo "" >> README.md
#echo "#### Travis CI (build $TRAVIS_BUILD_NUMBER)" >> README.md

# replace..
#badge="[![Build Status](https://travis-ci.org/djohn7504/lab-ci.svg?branch=master)](https://travis-ci.org/djohn7504/lab-ci)"
badge='[![Build Status](https://travis-ci.org/djohn7504/lab-ci.svg?branch=master)](https://travis-ci.org/djohn7504/lab-ci)'
textSearch=".*Travis CI.*"
textReplace="#### Travis CI (build $TRAVIS_BUILD_NUMBER) $badge"
sedComportment=""
destFile="./README.md"
sed -i -- "s/$textSearch/$textReplace/$sedComportment" "$destFile"

git add README.md
git commit --message "Update GitHub Pages.[skip ci]"

# send..
git push --force --quiet "https://$GITHUB_TOKEN@github.com/djohn7504/lab-ci"

# cleanup..
cd ..
