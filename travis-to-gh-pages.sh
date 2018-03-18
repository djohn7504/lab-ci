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

echo "================================================="
echo "--------------- on branch master, folder /docs"
echo "================================================="


git checkout master
echo "Travis CI (build $TRAVIS_BUILD_VERSION)" >> docs/README.md
git add .
git commit -m "Update GitHub Pages index."
git push
#git push origin HEAD:master
