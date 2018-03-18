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





echo "================================================="
echo "--------------- on branch master, folder /docs"
echo "================================================="


#git config --global user.name ${GIT_NAME}
#git config --global user.email ${GIT_EMAIL}
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git checkout master
echo "Travis CI (build $TRAVIS_BUILD_VERSION)" >> docs/README.md
git add .
#git commit --message "Update GitHub Pages index."
git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
#git push
#git push origin HEAD:master
#git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci" master:gh-pages > /dev/null 2>&1
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci" master
