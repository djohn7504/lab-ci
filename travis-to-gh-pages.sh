#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "================================================="
echo "--------------- starting deploy to GitHub Pages.."
echo "================================================="
echo


echo "================================================="
echo "--------------- on branch gh-pages"
echo "================================================="
echo 

rm -rf out || exit 0;
mkdir out
cd out

git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git .
echo "<br>Travis CI (build $TRAVIS_BUILD_NUMBER)" >> index.html
echo "" >> README.md
echo "####Travis CI (build $TRAVIS_BUILD_NUMBER)" >> README.md
git add index.html
git commit --message "Change index.html"
git push --force --quiet "https://$GITHUB_TOKEN_2@github.com/djohn7504/lab-ci"


echo "================================================="
echo "--------------- on branch master, folder /docs"
echo "================================================="

#	OK, but
#	INFINITE LOOP !!!!!!!!!!!!!!!!

#git config --global user.email "travis@travis-ci.org"
#git config --global user.name "Travis CI"
#git checkout master
#echo "Travis CI (build $TRAVIS_BUILD_NUMBER)" >> docs/README.md
#git add .
#git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
#git push --force --quiet "https://${GITHUB_TOKEN_2}@github.com/djohn7504/lab-ci" master
