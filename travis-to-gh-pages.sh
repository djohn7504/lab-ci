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
#		see: https://gist.github.com/willprice/e07efd73fb7f13f917ea
echo 
#git config --global user.email "travis@travis-ci.org"
#git config --global user.name "Travis CI"
#git fetch --all
git pull --all
#git checkout gh-pages
#echo "Travis CI (build $TRAVIS_BUILD_NUMBER)" >> index.html
#git add .
#git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
#git push --force --quiet "https://${GITHUB_TOKEN_2}@github.com/djohn7504/lab-ci" master


#git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
#git fetch --all




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
